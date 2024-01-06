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
            elementTable(elementsSet: $viewModel.waterSet)
            elementTable(elementsSet: $viewModel.requiredSet)
            hcoTable()
            BioteksaButton(title: "Calcular") {
                viewModel.calculate()
            }
            nutrientsTable()
            if viewModel.showNutrientsViews {
                BioteksaButton(title: "Solucion Madre") {
                    viewModel.showSolucionMadre = true
                }
            }
        }
        .sheet(isPresented: $viewModel.showSolucionMadre, content: {
            VolumenDeRiegoView(viewModel: VolumenDeriegoViewmodel(calculatedSet: viewModel.calculatedSet))
        })
    }
    
    @ViewBuilder func elementTable(elementsSet: Binding<ElementSet>) -> some View {
        TableContainer(title: "\(elementsSet.wrappedValue.set.rawValue)", backgroundColor: .blue) {
            ForEach(Element.allCases) {
                ElementEditableValue(title: $0.chemicalFormula, value: elementsSet[$0].value)
                Divider()
            }
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
    
    @ViewBuilder func hcoTable() -> some View {
        VStack() {
            TableContainer(title: "HCO₃⁻ a neutralizar", backgroundColor: .blue) {
                Picker("Options", selection: $viewModel.acidoType) {
                    ForEach(CalculadoraViewModel.AcidoType.allCases) { option in
                        Text(option.rawValue).tag(option)
                            .padding()
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                HStack {
                    Text(Element.bicarbonato.chemicalFormula)
                    QuantityText(value: viewModel.acidsSet.bicarbonato.value)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
                }
            }
        }
    }
    
    @ViewBuilder func nutrientsTable() -> some View {
        if viewModel.showNutrientsViews {
            nonEditableElementTable(elementsSet: viewModel.calculatedSet)
            CalculatorAcidoView(title: "Acido sulfurico", values: viewModel.sulfurico)
            CalculatorAcidoView(title: "Acido Nitrico", values: viewModel.nitrico)
            CalculatorAcidoView(title: "Acido Fosforico", values: viewModel.fosforico)
        } else {
            EmptyView()
        }
    }
}
                    
struct Calculadora_Previews: PreviewProvider {
    static let demoData = DemoData()
    
    static var previews: some View {
        CalculadoraView(viewModel: Self.demoData.viewModel)
    }
}
