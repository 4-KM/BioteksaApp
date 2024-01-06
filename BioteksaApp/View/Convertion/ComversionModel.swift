//
//  ComversiónModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import Foundation


struct ConvertionNutrient: Hashable{
    let id: Int
    let nutrient_id: Int
    var bioteksa : String
    var soluble: String
    var name: String {
        get {
            return ElementsNames(rawValue: nutrient_id)?.name ?? ""
        }
    }
}

enum ElementosNames: Int{
    case NITROGENO = 1
    case FOSFORO = 2
    case POTASIO = 3
    case CALCIO = 4
    case MAGNECIO = 5
    case AZUFRE = 6
    
    var name : String {
        switch self {
        case .NITROGENO: return "NITROGENO"
        case .FOSFORO: return "FOSFORO"
        case .POTASIO: return "POTASIO"
        case .CALCIO: return "CALCIO"
        case .MAGNECIO: return "MAGNECIO"
        case .AZUFRE: return "AZUFRE"
        default: return "other"
        }
    }
}
 
