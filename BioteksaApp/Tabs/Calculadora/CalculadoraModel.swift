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
	AcidoCalculator(
		name: "Meq a Neutralizar",
		rowColor: .clear,
		textColor: .anatomy.fgBrand,
		propertyIndex: 1
	),
	AcidoCalculator(
		name: "Peso específico",
		rowColor: .anatomy.bgTableRowHighligted,
		textColor: .anatomy.fgTextBlack,
		propertyIndex: 2
	),
	AcidoCalculator(
		name: "Densidad",
		rowColor: .anatomy.bgTableRowHighligted,
		textColor: .anatomy.fgTextBlack,
		propertyIndex: 3
	),
	AcidoCalculator(
		name: "Riqueza",
		rowColor: .anatomy.bgTableRowHighligted,
		textColor: .anatomy.fgTextBlack,
		propertyIndex: 4
	),
	AcidoCalculator(
		name: "ml/L",
		rowColor: .clear,
		textColor: .anatomy.fgTextRed,
		propertyIndex: 5
	),
	AcidoCalculator(
		name: "L/100m³",
		rowColor: .clear,
		textColor: .anatomy.fgTextRed,
		propertyIndex: 6
	)
]
