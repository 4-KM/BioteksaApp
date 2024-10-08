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
						elementTable(elementsSet: $viewModel.requiredSet)
            elementTable(elementsSet: $viewModel.waterSet)
            hcoTable()
            BioteksaButton(title: "Calcular") {
                viewModel.calculate()
            }
            nutrientsTable()
            if viewModel.showNutrientsViews {
                BioteksaButton(title: "Solución Madre") {
                    viewModel.showSolucionMadre = true
                }
            }
        }
				.sheet(isPresented: $viewModel.showSolucionMadre,
							 content: {
					VolumenDeRiegoView(
						viewModel: VolumenDeriegoViewmodel(
							calculatedSet: viewModel.calculatedSet,
							acidTitle: viewModel.acidoType.rawValue,
							acidLiters: viewModel.selectedAcid?.HMNOL.bioteksa ?? 0
						)
					)
        })
    }
    
    @ViewBuilder func elementTable(elementsSet: Binding<ElementSet>) -> some View {
        TableContainer(title: "\(elementsSet.wrappedValue.set.rawValue)") {
            ForEach(Element.allCases) {
                ElementEditableValue(title: $0.chemicalFormula, value: elementsSet[$0].value)
                Divider()
            }
        }
    }
    
    @ViewBuilder func nonEditableElementTable(elementsSet: ElementSet) -> some View {
			TableContainer(title: "\(elementsSet.set.rawValue)" ) {
            ForEach(Element.allCases) {
                NonEditableValueRow(text: $0.chemicalFormula, value: elementsSet[$0].value)
                Divider()
            }
        }
    }
    
    @ViewBuilder func hcoTable() -> some View {
        VStack() {
            TableContainer(title: "HCO₃⁻ a neutralizar") {
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
                        .background(Color.anatomy.bgTextFieldGray)
                }
            }
        }
    }
    
    @ViewBuilder func nutrientsTable() -> some View {
        if viewModel.showNutrientsViews, let selectedAcid = viewModel.selectedAcid {
            nonEditableElementTable(elementsSet: viewModel.calculatedSet)
						
					CalculatorAcidoView(
						title: "Ácido \(viewModel.acidoType.rawValue)",
						values: selectedAcid
					)
            
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
