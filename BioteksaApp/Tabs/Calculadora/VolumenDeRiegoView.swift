//
//  VolumenDeRiegoView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct VolumenDeRiegoView: View {
    @State var volumenM3: Double = 100.00
  //  @State var arrayCalculo: [VolumenDeRiegoModel] = productosVolumenRiengo
   // var productoView: [CalculadoraViewModel.NecesarioCalculator] = []
    @ObservedObject var viewModel: VolumenDeriegoViewmodel
    
    var body: some View {
        Page(viewModel: viewModel) {
            TableContainer(title: "Solucion madre", backgroundColor: .blue) {
                HStack {
                    Spacer()
                    ElementEditableValue(title: "superficie en m3", value: $viewModel.m3Multiply)
                }
            }
            TableContainer(title: "Producto", secondaryTitle: "LT/Producto", backgroundColor: .blue) {
                ForEach(Product.allCases) {
                    NonEditableValueRow(text: $0.name, value: viewModel.products[$0].value)
                }
            }
        }
        .onChange(of: viewModel.m3Multiply) { oldValue, newValue in
            viewModel.multiplyForInput()
        }
    }
    
    @ViewBuilder func nonEditableElementTable(elementsSet: ElementSet) -> some View {
        TableContainer(title: "\(elementsSet.set.rawValue)", backgroundColor: .blue) {
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
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
        }
        Divider()
    }
}
