//
//  BioteksaColor.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//


import SwiftUI

extension Color {
    struct anatomy {
		 static var fgRed: Color {
			 .red
		 }
		 
		 static var bgGrayTransparent: Color {
			 Color(red: 0, green: 0, blue: 0, opacity: 0.05)
		 }
		 
		 static var fgGray: Color {
			 Color(CGColor(gray: 0.5, alpha: 1))
		 }
		 
        static var white: Color {
            Color(hex: BioteksaColor.white.rawValue)
        }
        //Color.anatomy.white
        static var black: Color {
            Color(hex: BioteksaColor.black.rawValue)
        }
        //Color.anatomy.black
        static var bgTitleGreen: Color {
            Color(hex: BioteksaColor.bgTitleGreen.rawValue)
        }
        //Color.anatomy.bgTitleGreen
        static var bgTitleBlue: Color {
            Color(hex: BioteksaColor.bgTitleBlue.rawValue)
        }
        //Color.anatomy.bgTitleBlue
        static var bgPurple: Color {
            Color(hex: BioteksaColor.bgPurple.rawValue)
        }
        //Color.anatomy.bgPurple
        static var bgUnderlineBeige: Color {
            Color(hex: BioteksaColor.bgUnderlineBeige.rawValue)
        }
        //Color.anatomy.bgUnderlineBeige
        static var bgUnderlineGrey: Color {
            Color(hex: BioteksaColor.bgUnderlineGrey.rawValue)
        }
        //Color.anatomy.bgUnderlineGrey
        static var grandientBlue1: Color {
            Color(hex: BioteksaColor.grandientBlue1.rawValue)
        }
        //Color.anatomy.grandientBlue1
        static var grandientBlue2: Color {
            Color(hex: BioteksaColor.grandientBlue2.rawValue)
        }
        //Color.anatomy.grandientBlue2
    }
}

enum BioteksaColor: UInt {
    case black = 0x000000
    case white = 0xffffff
    case bgTitleGreen = 0xC0EA07
    case bgTitleBlue = 0x03498E
    case bgPurple = 0xAEB1FF
    case bgUnderlineBeige = 0xFDF7D9
    case bgUnderlineGrey = 0xF2F2F7
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

