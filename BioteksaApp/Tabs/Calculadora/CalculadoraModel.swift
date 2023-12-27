//
//  CalculadoraModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import Foundation
import SwiftUI

struct AcidosSolucionesMeqANeutralizar: Hashable {
    let descripcion: String // caracteristicas
    let typeAcido: TypeInfo?
    //let textField: TextField<Label: View>
    
}

let acidos =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "PesoExpecifico", typeAcido: .PesoExpecifico),
    AcidosSolucionesMeqANeutralizar(descripcion: "Densidad          ",typeAcido: .Densidad),
    AcidosSolucionesMeqANeutralizar(descripcion: "Riqueza             ",typeAcido: .Riqueza)
]

let meq =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "Meq a Neutralizar" , typeAcido: .MedNeutralizar)
]

let cantidad =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3ml/L        ", typeAcido: .HMNOL),
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3mLTS/100M3  " ,typeAcido:  .HMNOL100)
]

enum TypeInfo: String {
    case PesoExpecifico
    case Densidad
    case Riqueza
    case MedNeutralizar
    case HMNOL
    case HMNOL100
}

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

struct AcidoCalculator: Hashable {
    var name: String
    var rowColor: Color
    var textColor: Color
}

let acidosCalculator = [
    AcidoCalculator(name: "Meq a Neutralizar", rowColor: .clear, textColor: Color.anatomy.bgTitleBlue),
    AcidoCalculator(name: "Peso Especifico", rowColor: Color.anatomy.bgUnderlineBeige, textColor: Color.anatomy.black),
    AcidoCalculator(name: "Densidad", rowColor: Color.anatomy.bgUnderlineBeige, textColor: Color.anatomy.black),
    AcidoCalculator(name: "Riqueza", rowColor: Color.anatomy.bgUnderlineBeige, textColor: Color.anatomy.black),
    AcidoCalculator(name: "HNO3ml/L", rowColor: .clear, textColor: .red),
    AcidoCalculator(name: "HNO3ml/100M3", rowColor: .clear, textColor: .red)
]
