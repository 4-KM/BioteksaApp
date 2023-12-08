//
//  ComversiónModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import Foundation



struct Elementos {
    let nombre: TypeNutriente
}


let elementos =  [
    
    Elementos(nombre: TypeNutriente.NITROGENO),
    Elementos(nombre: TypeNutriente.FOSFORO),
    Elementos(nombre: TypeNutriente.POTASIO),
    Elementos(nombre: TypeNutriente.CALCIO),
    Elementos(nombre: TypeNutriente.MAGNECIO),
    Elementos(nombre: TypeNutriente.AZUFRE),
    
]

enum TypeNutriente: String, CaseIterable {
    case NITROGENO
    case FOSFORO
    case POTASIO
    case CALCIO
    case MAGNECIO
    case AZUFRE
    
    func getAbbreviation() -> String{
        switch self {

        case .NITROGENO: "N"
        case .FOSFORO: "P"
        case .POTASIO: "K"
        case .CALCIO: "CA"
        case .MAGNECIO: "MG"
        case .AZUFRE: "S"
        }
    }
}
 
