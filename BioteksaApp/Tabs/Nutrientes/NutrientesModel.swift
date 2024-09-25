//
//  NutrientesModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 25/09/23.
//

import Foundation

struct NutrientElement: Identifiable{
    let id = UUID()
    public var nutrient_id: Int
    public var quantity: Double
    var name: String {
        get {
            return ElementsNames(rawValue: nutrient_id)?.name ?? ""
        }
    }
}

struct Bioteksa: Identifiable {
    let id = UUID()
    var key: String
    var value : [NutrientElement]
    var name: String {
        get {
            return BioteksaNames(rawValue: key)?.name ?? ""
        }
    }
}

enum BioteksaNames: String{
    case HBK_Plus = "1"
    case ULTRA_N = "2"
    case ULTRA_P = "3"
    case ULTRA_K = "4"
    case ULTRA_CA = "5"
    case ULTRA_MG = "6"
    case ULTRA_S = "7"
    
    var name : String {
        switch self {
        case .HBK_Plus: return "HBK Plus"
        case .ULTRA_N: return "ULTRA N"
        case .ULTRA_P: return "ULTRA P"
        case .ULTRA_K: return "ULTRA K"
        case .ULTRA_CA: return "ULTRA CA"
        case .ULTRA_MG: return "ULTRA MG"
        case .ULTRA_S: return "ULTRA S"
        }
    }
}
enum ElementsNames: Int{
    case N = 1
    case P = 2
    case K = 3
    case CA = 4
    case MG = 5
    case S = 6
    
    var name : String {
        switch self {
        case .N: return "N"
        case .P: return "P"
        case .K: return "K"
        case .CA: return "CA"
        case .MG: return "MG"
        case .S: return "S"
        }
    }
}
