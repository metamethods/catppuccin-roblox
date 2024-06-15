use std::{collections::HashMap, fs::File, io::Write, path::PathBuf};

use serde::Deserialize;

const CATPPUCCIN_PALETTE_ENDPOINT: &str =
    "https://raw.githubusercontent.com/catppuccin/palette/main/palette.json";

#[derive(Debug, Deserialize)]
struct Color {
    pub hex: String,
}

#[derive(Debug, Deserialize)]
struct Palette {
    pub colors: HashMap<String, Color>,
}

fn string_to_ltype(string: String, name: &str, export: bool) -> String {
    format!(
        "{} type {name} = {string}",
        if export { "export" } else { "" }
    )
}

fn vec_to_lunion_type(vec: &Vec<String>, name: &str, export: bool) -> String {
    string_to_ltype(
        vec.iter()
            .map(|s| format!("\"{s}\""))
            .collect::<Vec<String>>()
            .join("|"),
        name,
        export,
    )
}

fn hash_map_to_ltable_type(
    hash_map: &HashMap<String, String>,
    name: &str,
    export: bool,
) -> String {
    let table_type = hash_map
        .iter()
        .map(|(k, v)| format!("{k}: {v}"))
        .collect::<Vec<String>>()
        .join(",");
    string_to_ltype(format!("{{{table_type}}}"), name, export)
}

fn hash_map_to_ltable(hash_map: &HashMap<String, String>) -> String {
    let table = hash_map
        .iter()
        .map(|(k, v)| format!("{k} = {v}"))
        .collect::<Vec<String>>()
        .join(",");
    format!("{{{table}}}")
}

fn define_variable(name: &str, type_name: &str, value: String) -> String {
    format!("local {name}: {type_name} = {value}")
}

async fn get_palettes() -> Result<HashMap<String, Palette>, reqwest::Error> {
    let palette = reqwest::get(CATPPUCCIN_PALETTE_ENDPOINT)
        .await?
        .json::<HashMap<String, Palette>>()
        .await?;
    Ok(palette)
}

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    let args = std::env::args().collect::<Vec<String>>();
    let mut out_file = {
        let path = args
            .get(1)
            .expect("missing out file argument")
            .parse::<PathBuf>()
            .expect("unable to parse as a path");
        File::create(path).expect("unable to open/create file")
    };
    let palettes = get_palettes().await?;

    let palette_flavors =
        palettes.keys().map(|k| k.clone()).collect::<Vec<String>>();
    let palette_colors = palettes
        .values()
        .next()
        .unwrap()
        .colors
        .keys()
        .map(|k| k.clone())
        .collect::<Vec<String>>();

    let palettes_ltable = hash_map_to_ltable(
        &palette_flavors
            .iter()
            .map(|f| {
                (
                    f.clone(),
                    hash_map_to_ltable(
                        &palettes
                            .get(f)
                            .unwrap()
                            .colors
                            .iter()
                            .map(|(k, v)| {
                                (
                                    k.clone(),
                                    format!("Color3.fromHex(\"{}\")", v.hex),
                                )
                            })
                            .collect::<HashMap<String, String>>(),
                    ),
                )
            })
            .collect::<HashMap<String, String>>(),
    );

    let palette_flavor_lunion_type =
        vec_to_lunion_type(&palette_flavors, "PaletteFlavor", true);
    let palette_color_lunion_type =
        vec_to_lunion_type(&palette_colors, "PaletteColor", true);
    let palette_theme_ltable_type = hash_map_to_ltable_type(
        &palette_colors
            .iter()
            .map(|c| (c.clone(), "Color3".to_string()))
            .collect::<HashMap<String, String>>(),
        "PaletteTheme",
        true,
    );
    let palette_ltable_type = hash_map_to_ltable_type(
        &palette_flavors
            .iter()
            .map(|f| (f.clone(), "PaletteTheme".to_string()))
            .collect::<HashMap<String, String>>(),
        "Palette",
        true,
    );

    let data = vec![
        "--!strict".to_string(),
        palette_flavor_lunion_type,
        palette_color_lunion_type,
        palette_theme_ltable_type,
        palette_ltable_type,
        define_variable("palette", "Palette", palettes_ltable),
        "return palette".to_string(),
    ]
    .join("\n");

    out_file
        .write_all(data.as_bytes())
        .expect("unable to write to file");

    Ok(())
}
