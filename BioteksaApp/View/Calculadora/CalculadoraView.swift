//
//  Calculadora.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct LineVertical : View {
    var body: some View {
        Divider().background(Color(.black)).frame(width: 1).rotationEffect(.degrees(0))
    }
    
}

struct Calculadora: View {
    @State var textWater: [Necesario] = agua
    @State var milEquivalente: [Necesario] = miliEq
    @State var necessary: [Necesario] = necesario
    @State var HCO3ToNeutralize: Double = 0.0
    @State var isReadyToEvaluate: Bool = false
    @State var showNutrientsViews: Bool =  false
    @State var resultNecessary: [Necesario] = []
    @State var showBtnSolucionMadre = false
    @ObservedObject var calculadoraVM: CalculadoraViewModel = CalculadoraViewModel()
   
  

    var body: some View {
        NavigationView{
            ScrollView {
                
                Group {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    CalculatorView(title: "Agua", calculatorTypeView: .water,arrValues: $calculadoraVM.aguaModel)
                    
                    CalculatorView(title: "Milequivalentes requeridos por el cultivo", calculatorTypeView: .milEq, arrValues: $calculadoraVM.miliEq)
                    
                    
                    VStack() {
                        Text("HCO3 a neutralizar").frame(width: 350, height: 50, alignment: .center)
                            .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        HStack(){
                            Text("Sulfurico")
                            LineVertical()
                            Text("Nitrico")
                            LineVertical()
                            Text("Fosforico")


                        }.padding()
                        HStack(alignment: .center,spacing: 80){
                            Text("HCO3")
                            
                            Text("\(calculadoraVM.HCO3ToNeutralize, specifier: "%.3f")").frame(width: 80, height: 40, alignment: .center).background(Color(red: 0.80, green: 0.80, blue: 0.80)).cornerRadius(5)
                            
                            
                        }.padding()
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .frame(width: 350, alignment: .center)
                    
                    Button("Calcular"){
                        calculadoraVM.isReadyToEvaluate = true
                        calculadoraVM.calculator()
                       // calculator()
                        
                    }.frame(width: 350, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    if calculadoraVM.showNutrientsViews {
                        
                        CalculatorView(title: "Necesario", calculatorTypeView: .necessary,arrValues: $calculadoraVM.necessaryModel)
                        
                        CalculatorAcidoView(title: "Acido sulfurico",viewModel: calculadoraVM, values: $calculadoraVM.sulfurico)
                        CalculatorAcidoView(title: "Acido Nitrico",viewModel: calculadoraVM, values: $calculadoraVM.nitrico)
                        
                        CalculatorAcidoView(title: "Acido Fosforico",viewModel: calculadoraVM, values: $calculadoraVM.fosforico)

                    }
                    
                    if calculadoraVM.showBtnSolucionMadre {
                        NavigationLink(destination: VolumenDeRiegoView(volumentVM: VolumenDeriegoViewmodel(products: milEquivalente))) {
                            Text("VOLUMEN DE RIEGO M3")
                                .frame(width: 350, height: 50, alignment: .center)
                                .foregroundColor(.black)
                                .background(Color.gray)
                                .cornerRadius(10)
                            
                        }
                        .navigationTitle("VOLUMEN DE RIEGO M3")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                    }

                    
                }.onChange(of: calculadoraVM.aguaModel) {  newValue in
                    calculadoraVM.calculator()
            }.onChange(of: calculadoraVM.miliEq) {  newValue in
                calculadoraVM.calculator()
        }
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
    }
    
    func operationHML(pesoEspe: String, densidad: String, riqueza: String) -> Double {
        let result = HCO3ToNeutralize * (Double(pesoEspe) ?? 0.0)
        let result1  = result  * 1 / (Double(densidad) ?? 0.0)
        let result2 = result1 * 100 / (Double(riqueza) ?? 0.0) * 0.001
      
        return result2
    }
}
                    
struct Calculadora_Previews: PreviewProvider {
    static var previews: some View {
        Calculadora()
    }
}


