//
//  VolumenDeRiegoView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct VolumenDeRiegoView: View {
    @State var volumenM3: Double = 100.00
    @ObservedObject var viewModel: VolumenDeriegoViewmodel
    
    var body: some View {
        Page(viewModel: viewModel) {
            TableContainer(title: "Solucion madre") {
                HStack {
                    Spacer()
                    ElementEditableValue(title: "superficie en m3", value: $viewModel.m3Multiply)
                }
            }
            TableContainer(title: "Producto", secondaryTitle: "LT/Producto") {
                ForEach(Product.allCases) {
                    NonEditableValueRow(text: $0.name, value: viewModel.products[$0].value)
                }
            }
        }
    }
    
    @ViewBuilder func nonEditableElementTable(elementsSet: ElementSet) -> some View {
        TableContainer(title: "\(elementsSet.set.rawValue)") {
            ForEach(Element.allCases) {
                NonEditableValueRow(text: $0.chemicalFormula, value: elementsSet[$0].value)
                Divider()
            }
        }
    }
}

struct NonEditableValueRow: View {
    var text: String
    var value: Double
    var decimals: Int = 3
    
    var body: some View {
        HStack {
            Text(text)
                .frame(maxWidth: .infinity)
            QuantityText(value: value, decimals: decimals)
                .padding(8)
                .frame(maxWidth: .infinity)
					 .background(Color.anatomy.bgTextFieldGray)
        }
        Divider()
    }
}
