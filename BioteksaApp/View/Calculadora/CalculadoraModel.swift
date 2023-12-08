//
//  CalculadoraModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import Foundation
import SwiftUI


struct Necesario: Hashable {

    

    
    var molecula: String
    var valueMole: String = ""
    var isCorrect: Bool = true
}

// CHECAR SI TIENE ERROR DE CONTINUIDAD CON LOS ELEMENTOS

var necesario =  [
    
    Necesario(molecula: "NO3"),
    Necesario(molecula: "H2PO4"),
    Necesario(molecula: "K+"),
    Necesario(molecula: "CA+2"),
    Necesario(molecula: "MG+2"),
    Necesario(molecula: "SO4-2")
    
]

var agua =  [
    
    Necesario(molecula: "NO3", isCorrect: true),
    Necesario(molecula: "H2PO4", isCorrect: true),
    Necesario(molecula: "K+", isCorrect: true),
    Necesario(molecula: "CA+2", isCorrect: true),
    Necesario(molecula: "MG+2", isCorrect: true),
    Necesario(molecula: "SO4-2", isCorrect: true),
    Necesario(molecula: "HCO3", isCorrect: true),
    Necesario(molecula: "CO3", isCorrect: true)
    
]


let miliEq =  [
    
    Necesario(molecula: "NO3"),
    Necesario(molecula: "H2PO4"),
    Necesario(molecula: "K+"),
    Necesario(molecula: "CA+2"),
    Necesario(molecula: "MG+2"),
    Necesario(molecula: "SO4-2"),

    
]
