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
        NavigationView {
            Page {
                elementTable(title: "Agua", arrValues: $viewModel.aguaModel)
                elementTable(title: "Milequivalentes requeridos por el cultivo", arrValues: $viewModel.miliEq)
                hcoTable()
                BioteksaButton(title: "Calcular") {
                    viewModel.isReadyToEvaluate = true
                    viewModel.calculator()
                }
                nutrientsTable()
                solucionMadreTable()
            }
            .onChange(of: viewModel.aguaModel) {  newValue in
                viewModel.calculator()
            }.onChange(of: viewModel.miliEq) {  newValue in
                viewModel.calculator()
            }
        }
    }
    
    @ViewBuilder func elementTable(
        title: String,
        arrValues: Binding<[CalculadoraViewModel.NecesarioCalculator]>
    ) -> some View {
        TableContainer(title: "\(title)", backgroundColor: Color.anatomy.bgTitleBlue) {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    ForEach(Array(arrValues.enumerated()),id: \.offset) { index, $option in
                        ElementEditableValue(title: option.molecula, value: $option.valueMole)
                            .padding(.horizontal, 16)
                        Divider()
                    }
                }
            }
        }
    }
    
    @ViewBuilder func hcoTable() -> some View {
        VStack() {
            TableContainer(title: "HCO3 a neutralizar", backgroundColor: Color.anatomy.bgTitleBlue) {
                Picker(selection: $viewModel.selectedAcid) {
                    Text("Sulfurico").tag(0)
                    Text("Nitrico").tag(1)
                    Text("Fosforico").tag(2)
                } label: {
                    EmptyView()
                }
                .pickerStyle(SegmentedPickerStyle())

                HStack(alignment: .center) {
                    Text("HCO3")
                    BioteksaNumberTextField(title: "HCO3", value: $viewModel.HCO3ToNeutralize)
                }
            }
        }
    }
    
    @ViewBuilder func nutrientsTable() -> some View {
        if viewModel.showNutrientsViews {
            elementTable(title: "Necesario", arrValues: $viewModel.necessaryModel)
            
            CalculatorAcidoView(title: "Acido sulfurico",viewModel: viewModel, values: $viewModel.sulfurico)
            
            CalculatorAcidoView(title: "Acido Nitrico",viewModel: viewModel, values: $viewModel.nitrico)
            
            CalculatorAcidoView(title: "Acido Fosforico",viewModel: viewModel, values: $viewModel.fosforico)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func solucionMadreTable() -> some View {
        if viewModel.showBtnSolucionMadre {
            NavigationLink(destination: VolumenDeRiegoView(volumentVM: VolumenDeriegoViewmodel(products: viewModel.miliEq) )) {
                Text("VOLUMEN DE RIEGO M3")
                    .frame(width: 350, height: 50, alignment: .center)
                    .foregroundColor(Color.anatomy.black)
                    .background(Color.anatomy.bgUnderlineGrey)
                    .cornerRadius(10)
                
            }
            .navigationTitle("VOLUMEN DE RIEGO M3")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
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
