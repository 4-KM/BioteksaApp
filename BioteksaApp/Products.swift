//
//  Products.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 03/01/24.
//

import Foundation

enum Product: CaseIterable, Identifiable {
    case hbk
    case utraN
    case ultraP
    case utraK
    case ultraCA
    case ultraMG
		case ultraS
    case hyperMn
    case hyperZN
    case ultraFe
    
    var id: String { self.name}
    
    var name: String {
        switch self {
        case .hbk:
            return "HBK"
        case .utraN:
            return "UTRA N"
        case .ultraP:
            return "ULTRA P"
        case .utraK:
            return "UTRA K"
        case .ultraCA:
            return "ULTRA CA"
        case .ultraMG:
            return "ULTRA MG"
        case .ultraS:
            return "ULTRA S"
        case .ultraFe:
            return "ULTRA FE"
        case .hyperZN:
            return "HYPER ZN"
        case .hyperMn:
            return "HYPER MN"
        }
    }
}

enum Element: CaseIterable, Identifiable {
    case nitrogeno
    case fosforo
    case potasio
    case calcio
    case magnesio
    case asufre
    case bicarbonato
    case carbonato
    
    var id: String {
        switch self {
        case .nitrogeno:
            return "1"
        case .fosforo:
            return "2"
        case .potasio:
            return "3"
        case .calcio:
            return "4"
        case .magnesio:
            return "5"
        case .asufre:
            return "6"
        case .bicarbonato:
            return "7"
        case .carbonato:
            return "8"
        }
    }
}

extension Element {
    var symbol: String {
        switch self {
        case .nitrogeno:
            return "N"
        case .fosforo:
            return "P"
        case .potasio:
            return "K"
        case .calcio:
            return "Ca"
        case .magnesio:
            return "Mg"
        case .asufre:
            return "S"
        case .bicarbonato:
            return "HCO₃⁻"
        case .carbonato:
            return "CO₃²⁻"
        }
    }
    
    var chemicalFormula: String {
        switch self {
        case .nitrogeno:
            return "NO₃⁻"
        case .fosforo:
            return "H₂PO₄⁻"
        case .potasio:
            return "K⁺"
        case .calcio:
            return "Ca²⁺"
        case .magnesio:
            return "Mg²⁺"
        case .asufre:
            return "SO₄²⁻"
        case .bicarbonato:
            return "HCO₃⁻"
        case .carbonato:
            return "CO₃²⁻"
        }
    }
    
    var salesBioteksa: Double {
        switch self {
        case .nitrogeno:
            return 0
        case .fosforo:
            return 0
        case .potasio:
            return 0
        case .calcio:
            return 0
        case .magnesio:
            return 0
        case .asufre:
            return 0
        case .bicarbonato:
            return 0
        case .carbonato:
            return 0
        }
    }
}
