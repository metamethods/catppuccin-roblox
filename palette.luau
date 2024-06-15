--!strict
export type PaletteFlavor = "mocha" | "frappe" | "macchiato" | "latte"
export type PaletteColor =
	"overlay1"
	| "rosewater"
	| "maroon"
	| "sapphire"
	| "flamingo"
	| "subtext1"
	| "overlay0"
	| "surface1"
	| "surface0"
	| "blue"
	| "crust"
	| "green"
	| "subtext0"
	| "lavender"
	| "yellow"
	| "mauve"
	| "red"
	| "surface2"
	| "base"
	| "overlay2"
	| "sky"
	| "peach"
	| "mantle"
	| "teal"
	| "pink"
	| "text"
export type PaletteTheme = {
	flamingo: Color3,
	green: Color3,
	lavender: Color3,
	yellow: Color3,
	teal: Color3,
	mantle: Color3,
	surface0: Color3,
	subtext0: Color3,
	blue: Color3,
	surface2: Color3,
	overlay2: Color3,
	overlay0: Color3,
	peach: Color3,
	subtext1: Color3,
	pink: Color3,
	crust: Color3,
	text: Color3,
	surface1: Color3,
	maroon: Color3,
	mauve: Color3,
	red: Color3,
	base: Color3,
	rosewater: Color3,
	sky: Color3,
	overlay1: Color3,
	sapphire: Color3,
}
export type Palette = { latte: PaletteTheme, mocha: PaletteTheme, macchiato: PaletteTheme, frappe: PaletteTheme }
local palette: Palette = {
	mocha = {
		maroon = Color3.fromHex("#eba0ac"),
		sky = Color3.fromHex("#89dceb"),
		crust = Color3.fromHex("#11111b"),
		rosewater = Color3.fromHex("#f5e0dc"),
		sapphire = Color3.fromHex("#74c7ec"),
		mauve = Color3.fromHex("#cba6f7"),
		yellow = Color3.fromHex("#f9e2af"),
		surface0 = Color3.fromHex("#313244"),
		green = Color3.fromHex("#a6e3a1"),
		mantle = Color3.fromHex("#181825"),
		flamingo = Color3.fromHex("#f2cdcd"),
		overlay1 = Color3.fromHex("#7f849c"),
		teal = Color3.fromHex("#94e2d5"),
		subtext0 = Color3.fromHex("#a6adc8"),
		red = Color3.fromHex("#f38ba8"),
		pink = Color3.fromHex("#f5c2e7"),
		text = Color3.fromHex("#cdd6f4"),
		subtext1 = Color3.fromHex("#bac2de"),
		lavender = Color3.fromHex("#b4befe"),
		surface1 = Color3.fromHex("#45475a"),
		blue = Color3.fromHex("#89b4fa"),
		surface2 = Color3.fromHex("#585b70"),
		overlay2 = Color3.fromHex("#9399b2"),
		overlay0 = Color3.fromHex("#6c7086"),
		peach = Color3.fromHex("#fab387"),
		base = Color3.fromHex("#1e1e2e"),
	},
	frappe = {
		blue = Color3.fromHex("#8caaee"),
		base = Color3.fromHex("#303446"),
		lavender = Color3.fromHex("#babbf1"),
		subtext0 = Color3.fromHex("#a5adce"),
		teal = Color3.fromHex("#81c8be"),
		surface0 = Color3.fromHex("#414559"),
		overlay2 = Color3.fromHex("#949cbb"),
		sky = Color3.fromHex("#99d1db"),
		green = Color3.fromHex("#a6d189"),
		pink = Color3.fromHex("#f4b8e4"),
		yellow = Color3.fromHex("#e5c890"),
		mantle = Color3.fromHex("#292c3c"),
		crust = Color3.fromHex("#232634"),
		surface1 = Color3.fromHex("#51576d"),
		flamingo = Color3.fromHex("#eebebe"),
		maroon = Color3.fromHex("#ea999c"),
		overlay0 = Color3.fromHex("#737994"),
		red = Color3.fromHex("#e78284"),
		surface2 = Color3.fromHex("#626880"),
		text = Color3.fromHex("#c6d0f5"),
		rosewater = Color3.fromHex("#f2d5cf"),
		mauve = Color3.fromHex("#ca9ee6"),
		sapphire = Color3.fromHex("#85c1dc"),
		peach = Color3.fromHex("#ef9f76"),
		subtext1 = Color3.fromHex("#b5bfe2"),
		overlay1 = Color3.fromHex("#838ba7"),
	},
	latte = {
		flamingo = Color3.fromHex("#dd7878"),
		overlay0 = Color3.fromHex("#9ca0b0"),
		surface2 = Color3.fromHex("#acb0be"),
		overlay1 = Color3.fromHex("#8c8fa1"),
		subtext0 = Color3.fromHex("#6c6f85"),
		yellow = Color3.fromHex("#df8e1d"),
		blue = Color3.fromHex("#1e66f5"),
		sky = Color3.fromHex("#04a5e5"),
		mantle = Color3.fromHex("#e6e9ef"),
		mauve = Color3.fromHex("#8839ef"),
		lavender = Color3.fromHex("#7287fd"),
		surface1 = Color3.fromHex("#bcc0cc"),
		maroon = Color3.fromHex("#e64553"),
		peach = Color3.fromHex("#fe640b"),
		sapphire = Color3.fromHex("#209fb5"),
		overlay2 = Color3.fromHex("#7c7f93"),
		pink = Color3.fromHex("#ea76cb"),
		green = Color3.fromHex("#40a02b"),
		subtext1 = Color3.fromHex("#5c5f77"),
		base = Color3.fromHex("#eff1f5"),
		crust = Color3.fromHex("#dce0e8"),
		teal = Color3.fromHex("#179299"),
		text = Color3.fromHex("#4c4f69"),
		red = Color3.fromHex("#d20f39"),
		surface0 = Color3.fromHex("#ccd0da"),
		rosewater = Color3.fromHex("#dc8a78"),
	},
	macchiato = {
		rosewater = Color3.fromHex("#f4dbd6"),
		crust = Color3.fromHex("#181926"),
		yellow = Color3.fromHex("#eed49f"),
		pink = Color3.fromHex("#f5bde6"),
		surface0 = Color3.fromHex("#363a4f"),
		teal = Color3.fromHex("#8bd5ca"),
		sky = Color3.fromHex("#91d7e3"),
		subtext1 = Color3.fromHex("#b8c0e0"),
		maroon = Color3.fromHex("#ee99a0"),
		lavender = Color3.fromHex("#b7bdf8"),
		overlay1 = Color3.fromHex("#8087a2"),
		surface1 = Color3.fromHex("#494d64"),
		mauve = Color3.fromHex("#c6a0f6"),
		sapphire = Color3.fromHex("#7dc4e4"),
		peach = Color3.fromHex("#f5a97f"),
		overlay2 = Color3.fromHex("#939ab7"),
		base = Color3.fromHex("#24273a"),
		green = Color3.fromHex("#a6da95"),
		flamingo = Color3.fromHex("#f0c6c6"),
		mantle = Color3.fromHex("#1e2030"),
		subtext0 = Color3.fromHex("#a5adcb"),
		surface2 = Color3.fromHex("#5b6078"),
		blue = Color3.fromHex("#8aadf4"),
		red = Color3.fromHex("#ed8796"),
		overlay0 = Color3.fromHex("#6e738d"),
		text = Color3.fromHex("#cad3f5"),
	},
}
return palette
