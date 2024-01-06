//
//  CalculadoraModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import Foundation
import SwiftUI


struct AcidoCalculator: Hashable {
    var name: String
    var rowColor: Color
    var textColor: Color
    var propertyIndex: Int
}

let acidosCalculator = [
    AcidoCalculator(name: "Meq a Neutralizar", rowColor: .clear, textColor: .blue, propertyIndex: 1),
    AcidoCalculator(name: "Peso Especifico", rowColor: Color(red: 0.997, green: 0.970, blue: 0.848), textColor: .black, propertyIndex: 2),
    AcidoCalculator(name: "Densidad", rowColor: Color(red: 0.997, green: 0.970, blue: 0.848), textColor: .black, propertyIndex: 3),
    AcidoCalculator(name: "Riqueza", rowColor: Color(red: 0.997, green: 0.970, blue: 0.848), textColor: .black, propertyIndex: 4),
    AcidoCalculator(name: "HNO3ml/L", rowColor: .clear, textColor: .red, propertyIndex: 5),
    AcidoCalculator(name: "HNO3ml/100M3", rowColor: .clear, textColor: .red, propertyIndex: 6)
]
