//
//  Calculadora.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct CalculadoraView: View {
    
    @ObservedObject var viewModel: CalculadoraViewModel
   
    var body: some View {
        Page(viewModel: viewModel) {
            elementTable(title: "Agua", arrValues: $viewModel.aguaModel)
            elementTable(title: "Milequivalentes requeridos por el cultivo", arrValues: $viewModel.miliEq)
            hcoTable()
            BioteksaButton(title: "Calcular") {
                viewModel.isReadyToEvaluate = true
                viewModel.calculator()
            }
            nutrientsTable()
            if viewModel.showBtnSolucionMadre {
                BioteksaButton(title: "Solucion Madre") {
                    viewModel.showSolucionMadre = true
                }
            }
        }
        .sheet(isPresented: $viewModel.showSolucionMadre, content: {
            if let vRiegoVM = VolumenDeriegoViewmodel(products: viewModel.miliEq) {
                VolumenDeRiegoView(viewModel: vRiegoVM)
            }
        })
    }
    
    @ViewBuilder func elementTable(
        title: String,
        arrValues: Binding<[CalculadoraViewModel.NecesarioCalculator]>
    ) -> some View {
        TableContainer(title: "\(title)", backgroundColor: .blue) {
            ForEach(Array(arrValues.enumerated()),id: \.offset) { index, $option in
                ElementEditableValue(title: option.molecula, value: $option.valueMole)
                Divider()
            }
        }
    }
    
    @ViewBuilder func nonEditableElementTable(
        title: String,
        arrValues: Binding<[CalculadoraViewModel.NecesarioCalculator]>
    ) -> some View {
        TableContainer(title: "\(title)", backgroundColor: .blue) {
            ForEach(Array(arrValues.enumerated()),id: \.offset) { index, $option in
                NonEditableValueRow(text: option.molecula, value: option.valueMole)
            }
        }
    }
    
    @ViewBuilder func hcoTable() -> some View {
        VStack() {
            TableContainer(title: "HCO3 a neutralizar", backgroundColor: .blue) {
                Picker("Options", selection: $viewModel.acidoType) {
                    ForEach(CalculadoraViewModel.AcidoType.allCases) { option in
                        Text(option.rawValue).tag(option)
                            .padding()
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                HStack {
                    Text("HCO3")
                    QuantityText(value: viewModel.HCO3ToNeutralize)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
                }
            }
        }
    }
    
    @ViewBuilder func nutrientsTable() -> some View {
        if viewModel.showNutrientsViews {
            nonEditableElementTable(title: "Necesario", arrValues: $viewModel.necessaryModel)
            CalculatorAcidoView(title: "Acido sulfurico", values: viewModel.sulfurico)
            CalculatorAcidoView(title: "Acido Nitrico", values: viewModel.nitrico)
            CalculatorAcidoView(title: "Acido Fosforico", values: viewModel.fosforico)
        } else {
            EmptyView()
        }
    }
}
                    
struct Calculadora_Previews: PreviewProvider {
    static var previews: some View {
        CalculadoraView(viewModel: CalculadoraViewModel())
    }
}
