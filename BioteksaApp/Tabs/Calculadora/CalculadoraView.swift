//
//  Calculadora.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct Calculadora: View {
    
    @ObservedObject var calculadoraVM: CalculadoraViewModel = CalculadoraViewModel()
   
    var body: some View {
        NavigationView {
            Page {
                elementTable(title: "Agua", arrValues: $calculadoraVM.aguaModel)
                elementTable(title: "Milequivalentes requeridos por el cultivo", arrValues: $calculadoraVM.miliEq)
                hcoTable()
                BioteksaButton(title: "Calcular") {
                    calculadoraVM.isReadyToEvaluate = true
                    calculadoraVM.calculator()
                }
                nutrientsTable()
                solucionMadreTable()
            }
            .onChange(of: calculadoraVM.aguaModel) {  newValue in
                calculadoraVM.calculator()
            }.onChange(of: calculadoraVM.miliEq) {  newValue in
                calculadoraVM.calculator()
            }
        }
    }
    
    @ViewBuilder func elementTable(
        title: String,
        arrValues: Binding<[CalculadoraViewModel.NecesarioCalculator]>
    ) -> some View {
        TableContainer(title: "\(title)", backgroundColor: .blue) {
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
            TableContainer(title: "HCO3 a neutralizar", backgroundColor: .blue) {
                Picker(selection: $calculadoraVM.selectedAcid) {
                    Text("Sulfurico").tag(0)
                    Text("Nitrico").tag(1)
                    Text("Fosforico").tag(2)
                } label: {
                    EmptyView()
                }
                .pickerStyle(SegmentedPickerStyle())

                HStack(alignment: .center) {
                    Text("HCO3")
                    BioteksaNumberTextField(title: "HCO3", value: $calculadoraVM.HCO3ToNeutralize)
                }
            }
        }
    }
    
    @ViewBuilder func nutrientsTable() -> some View {
        if calculadoraVM.showNutrientsViews {
            elementTable(title: "Necesario", arrValues: $calculadoraVM.necessaryModel)
            
            CalculatorAcidoView(title: "Acido sulfurico",viewModel: calculadoraVM, values: $calculadoraVM.sulfurico)
            
            CalculatorAcidoView(title: "Acido Nitrico",viewModel: calculadoraVM, values: $calculadoraVM.nitrico)
            
            CalculatorAcidoView(title: "Acido Fosforico",viewModel: calculadoraVM, values: $calculadoraVM.fosforico)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func solucionMadreTable() -> some View {
        if calculadoraVM.showBtnSolucionMadre {
            NavigationLink(destination: VolumenDeRiegoView(volumentVM: VolumenDeriegoViewmodel(products: calculadoraVM.miliEq) )) {
                Text("VOLUMEN DE RIEGO M3")
                    .frame(width: 350, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.gray)
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
        Calculadora()
    }
}
