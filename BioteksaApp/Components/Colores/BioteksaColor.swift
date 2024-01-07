//
//  BioteksaColor.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//


import SwiftUI

protocol ColorStyle {
	var bgPrimary: Color { get }
	var bgBrand: Color { get }
	var bgPage: Color { get }
	var bgTable: Color { get }
	var bgTableHeader: Color { get }
	var bgTableHeaderGreen: Color { get }
	var bgTextFieldGray: Color { get }
	var bgTableRow: Color { get }
	var bgTableRowHighligted: Color { get }

	var fgPrimary: Color { get }
	var fgBrand: Color { get }
	var fgTableHeader: Color { get }
	var fgTableContent: Color { get }
	var fgTextGray: Color { get }
	var fgTextRed: Color { get }
	var fgTextBlack: Color { get }
	
	var gradientBlue1: Color { get }
	var gradientBlue2: Color { get }
	
	var borderPrimary: Color { get }
}

struct AnatomyLightColorStyle: ColorStyle {
	let bgPrimary = Color(hex: 0xffffff)
	let bgBrand = Color(hex: 0x03498E)
	let bgPage: Color = Color(hex: 0xAEB1FF)
	let bgTable = Color(hex: 0xffffff)
	let bgTableHeader = Color(hex: 0x03498E)
	let bgTableHeaderGreen = Color(hex: 0xC0EA07)
	let bgTextFieldGray = Color(hex: 0xF2F2F7)
	let bgTableRow = Color(hex: 0xffffff)
	let bgTableRowHighligted = Color(hex: 0xFDF7D9)
	
	let fgPrimary = Color(hex: 0xffffff)
	let fgBrand = Color(hex: 0x03498E)
	let fgTableHeader = Color(hex: 0xffffff)
	let fgTableContent = Color(hex: 0xffffff)
	let fgTextGray = Color(hex: 0xA2A2A2)
	let fgTextRed = Color(hex: 0xFF0000)
	let fgTextBlack = Color(hex: 0x000000)
	
	let gradientBlue1: Color = Color(hex: 0x114679)
	let gradientBlue2: Color = Color(hex: 0x498FD0)
	
	let borderPrimary: Color  = Color(hex: 0x03498E)
}

struct AnatomyDarkColorStyle: ColorStyle {
	let bgPrimary = Color(hex: 0x000000)
	let bgBrand = Color(hex: 0x03498E)
	let bgPage: Color = Color(hex: 0x4E519F)
	let bgTable = Color(hex: 0x000000)
	let bgTableHeader = Color(hex: 0x03498E)
	let bgTableHeaderGreen = Color(hex: 0x709A00)
	let bgTextFieldGray = Color(hex: 0x222222)
	let bgTableRow = Color(hex: 0xffffff)
	let bgTableRowHighligted = Color(hex: 0x6D6749)
	
	let fgPrimary = Color(hex: 0x000000)
	let fgBrand = Color(hex: 0x03498E)
	let fgTableHeader = Color(hex: 0xffffff)
	let fgTableContent = Color(hex: 0xffffff)
	let fgTextGray = Color(hex: 0xF2F2F7)
	let fgTextBlue = Color(hex: 0x03498E)
	let fgTextRed = Color(hex: 0xFF0000)
	let fgTextBlack = Color(hex: 0xffffff)

	let gradientBlue1: Color = Color(hex: 0x114679)
	let gradientBlue2: Color = Color(hex: 0x498FD0)
	
	let borderPrimary: Color  = Color(hex: 0x03498E)

}

extension Color {
	static var anatomy: ColorStyle {
		UITraitCollection.current.userInterfaceStyle == .light ? AnatomyLightColorStyle() : AnatomyDarkColorStyle()
	}
}

enum BioteksaColor: UInt {
	case purple = 0xAEB1FF
	case brandBlue = 0x03498E
	case green = 0xC0EA07
	case red = 0xFF0000
	case black = 0x000000
	case white = 0xffffff
	case yellow = 0xFDF7D9
	case gray = 0xF2F2F7
	case grandientBlue1 = 0x114679
	case grandientBlue2 = 0x498FD0
}

extension Color {
	init(hex: UInt, alpha: Double = 1) {
		self.init(
			.sRGB,
			red: Double((hex >> 16) & 0xff) / 255,
			green: Double((hex >> 08) & 0xff) / 255,
			blue: Double((hex >> 00) & 0xff) / 255,
			opacity: alpha
		)
	}
	
}


