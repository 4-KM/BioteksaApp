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
                        
                        Text("Acido sulfurico")// vistas reusables
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                            .cornerRadius(10)
      
                        List {
                            Section(header: Text("Bioteksa       Otros")
                                .frame(width: 280, height: 30, alignment: .trailing))
                            {
                                ForEach(Array(( meq + acidos + cantidad).enumerated()), id: \.offset ) { index, option in
                                    HStack() {
                                        Text("\(option.descripcion)")
                                        Spacer()
                                        if option.typeAcido == .MedNeutralizar {
                                            HStack() {
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                            }
                                        } else if option.typeAcido == .PesoExpecifico {
                                            HStack() {
                                                Text(calculadoraVM.sulfurico.bioteksa.pesoEspesifico)
                                                Text(calculadoraVM.sulfurico.otros.pesoEspesifico)
                                            }
                                        } else if option.typeAcido == .Densidad {
                                            HStack() {
                                                Text(calculadoraVM.sulfurico.bioteksa.densidad)
                                                Text(calculadoraVM.sulfurico.otros.densidad)
                                            }
                                        } else if option.typeAcido == .Riqueza {
                                            HStack(){
                                                Text(calculadoraVM.sulfurico.bioteksa.riqueza)
                                                Text(calculadoraVM.sulfurico.otros.riqueza)
                                            }
                                        } else if option.typeAcido == .HMNOL {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.sulfurico.bioteksa.pesoEspesifico , densidad: calculadoraVM.sulfurico.bioteksa.densidad, riqueza: calculadoraVM.sulfurico.bioteksa.riqueza), specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.sulfurico.otros.pesoEspesifico , densidad: calculadoraVM.sulfurico.otros.densidad, riqueza: calculadoraVM.sulfurico.otros.riqueza), specifier: "%.3f" ) ")
                                            }

                                        } else if option.typeAcido == .HMNOL100 {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.sulfurico.bioteksa.pesoEspesifico , densidad: calculadoraVM.sulfurico.bioteksa.densidad, riqueza: calculadoraVM.sulfurico.bioteksa.riqueza) * 100, specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.sulfurico.otros.pesoEspesifico , densidad: calculadoraVM.sulfurico.otros.densidad, riqueza: calculadoraVM.sulfurico.otros.riqueza) * 100, specifier: "%.3f" ) ")
                                            }
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                        .cornerRadius(10.0)
                        .frame(width: 350, height: 360, alignment: .center)
                        
                        
                        
                        
                        Text("Acido Nitrico")// vistas reusables
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                            .cornerRadius(10)
                        List {
                            Section(header: Text("Bioteksa       Otros")
                                .frame(width: 280, height: 30, alignment: .trailing))
                            {
                                ForEach( meq + acidos + cantidad, id: \.descripcion ) { option in
                                    HStack() {
                                        Text("\(option.descripcion)")
                                        Spacer()
                                        if option.typeAcido == .MedNeutralizar {
                                            HStack() {
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                            }
                                        } else if option.typeAcido == .PesoExpecifico {
                                            HStack() {
                                                Text(calculadoraVM.nitrico.bioteksa.pesoEspesifico)
                                                Text(calculadoraVM.nitrico.otros.pesoEspesifico)
                                            }
                                        } else if option.typeAcido == .Densidad {
                                            HStack() {
                                                Text(calculadoraVM.nitrico.bioteksa.densidad)
                                                Text(calculadoraVM.nitrico.otros.densidad)
                                            }
                                        } else if option.typeAcido == .Riqueza {
                                            HStack(){
                                                Text(calculadoraVM.nitrico.bioteksa.riqueza)
                                                Text(calculadoraVM.nitrico.otros.riqueza)
                                            }
                                        } else if option.typeAcido == .HMNOL {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.nitrico.bioteksa.pesoEspesifico , densidad: calculadoraVM.nitrico.bioteksa.densidad, riqueza: calculadoraVM.nitrico.bioteksa.riqueza), specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.nitrico.otros.pesoEspesifico , densidad: calculadoraVM.nitrico.otros.densidad, riqueza: calculadoraVM.nitrico.otros.riqueza), specifier: "%.3f" ) ")
                                            }
                                            
                                        } else if option.typeAcido == .HMNOL100 {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.nitrico.bioteksa.pesoEspesifico , densidad: calculadoraVM.nitrico.bioteksa.densidad, riqueza: calculadoraVM.nitrico.bioteksa.riqueza) * 100, specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.nitrico.otros.pesoEspesifico , densidad: calculadoraVM.nitrico.otros.densidad, riqueza: calculadoraVM.nitrico.otros.riqueza) * 100, specifier: "%.3f" ) ")
                                            }
                                        }
                                        
                                        
                                        
                                    }
                                }
                            }
                        }
                        .cornerRadius(10.0)
                        .frame(width: 350, height: 360, alignment: .center)
                        
                        
                        
                        Text("Acido Fosforico")// vistas reusables
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                            .cornerRadius(10)
                        List {
                            Section(header: Text("Bioteksa       Otros")
                                .frame(width: 280, height: 30, alignment: .trailing))
                            {
                                ForEach( meq + acidos + cantidad,  id: \.descripcion ) { option in
                                    HStack() {
                                        Text("\(option.descripcion)")
                                        Spacer()
                                        if option.typeAcido == .MedNeutralizar {
                                            HStack() {
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                                Text("\(HCO3ToNeutralize, specifier: "%.3f")")
                                            }
                                        } else if option.typeAcido == .PesoExpecifico {
                                            HStack() {
                                                Text(calculadoraVM.fosforico.bioteksa.pesoEspesifico)
                                                Text(calculadoraVM.fosforico.otros.pesoEspesifico)
                                            }
                                        } else if option.typeAcido == .Densidad {
                                            HStack() {
                                                Text(calculadoraVM.fosforico.bioteksa.densidad)
                                                Text(calculadoraVM.fosforico.otros.densidad)
                                            }
                                        } else if option.typeAcido == .Riqueza {
                                            HStack(){
                                                Text(calculadoraVM.fosforico.bioteksa.riqueza)
                                                Text(calculadoraVM.fosforico.otros.riqueza)
                                            }
                                        } else if option.typeAcido == .HMNOL {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.fosforico.bioteksa.pesoEspesifico , densidad: calculadoraVM.fosforico.bioteksa.densidad, riqueza: calculadoraVM.fosforico.bioteksa.riqueza), specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.fosforico.otros.pesoEspesifico , densidad: calculadoraVM.fosforico.otros.densidad, riqueza: calculadoraVM.fosforico.otros.riqueza), specifier: "%.3f" ) ")
                                            }
                                            
                                        } else if option.typeAcido == .HMNOL100 {
                                            HStack(){
                                                Text ("\(operationHML(pesoEspe: calculadoraVM.fosforico.bioteksa.pesoEspesifico , densidad: calculadoraVM.fosforico.bioteksa.densidad, riqueza: calculadoraVM.fosforico.bioteksa.riqueza) * 100, specifier: "%.3f" ) ")
                                                Text("\(operationHML(pesoEspe: calculadoraVM.fosforico.otros.pesoEspesifico , densidad: calculadoraVM.fosforico.otros.densidad, riqueza: calculadoraVM.fosforico.otros.riqueza) * 100, specifier: "%.3f" ) ")
                                            }
                                        }
                                        
                                        
                                        
                                    }
                                }
                            }
                        }
                        .cornerRadius(10.0)
                        .frame(width: 350, height: 360, alignment: .center)
                    }
//                    Button("Calcular"){
//                        isReadyToEvaluate = true
//                        calculator()
//                        
//                    }.frame(width: 350, height: 50, alignment: .center)
//                    .foregroundColor(.black)
//                    .background(Color.gray)
//                    .cornerRadius(10)
                    if showBtnSolucionMadre {
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
   /* func calculator()  {
        var index = 0
        var hasError: Bool = false
        guard isReadyToEvaluate else { return }
        showBtnSolucionMadre = true
        textWater.forEach { molecula in
            if molecula.valueMole.isEmpty  {
               // print("agregar valor a \(molecula.molecula)")
                textWater[index].isCorrect = false
                hasError = true
            } else {
                textWater[index].isCorrect = true
            }
            index += 1
          //  print("Termino el proceso 1")
            
        }
        index = 0
        milEquivalente.forEach { molecula in
            if molecula.valueMole.isEmpty  {
              //  print("agregar valor a \(molecula.molecula)")
                milEquivalente[index].isCorrect = false
                hasError = true
            } else {
                milEquivalente[index].isCorrect = true
            }
            index += 1
           // print("Termino el proceso 2")
            
        }
        if let valueHCO3 = Double(textWater[6].valueMole), let valueCo3 = Double(textWater[7].valueMole) {
            var result = ((valueHCO3  ) + (valueCo3 * 2)) - 0.500
            
            if result < 0.500 {
                result =  0.0
            }
            HCO3ToNeutralize = result.rounded(toRounded: 3)
        }
        if !hasError {
            showNutrientsViews = true
            showBtnSolucionMadre = true
        }
        getOperationNecessary()
    }*/
    
    func getOperationNecessary() {
        var milEquivalente = milEquivalente
        var index = 0
        var result = 0.0
        resultNecessary = milEquivalente.map({ necessaries in
            var necessaries = necessaries
            if index == 5 {
                HCO3ToNeutralize = HCO3ToNeutralize.rounded(toRounded: 3)
                result =  (Double(necessaries.valueMole) ?? 0.0) - (Double(textWater[index].valueMole) ?? 0.0) - HCO3ToNeutralize
            } else {
                result = ( Double(necessaries.valueMole) ?? 0.0 ) - (Double(textWater[index].valueMole) ?? 0.0)
            }
            result = result.rounded(toRounded: 3)
            necessaries.valueMole = String(result)
            index += 1
            return necessaries
        })
    }
    

}
                    
struct Calculadora_Previews: PreviewProvider {
    static var previews: some View {
        Calculadora()
    }
}


