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
		name: "Peso specifico",
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
		name: "HNO3ml/L",
		rowColor: .clear,
		textColor: .anatomy.fgTextRed,
		propertyIndex: 5
	),
	AcidoCalculator(
		name: "HNO3ml/100M3",
		rowColor: .clear,
		textColor: .anatomy.fgTextRed,
		propertyIndex: 6
	)
]
