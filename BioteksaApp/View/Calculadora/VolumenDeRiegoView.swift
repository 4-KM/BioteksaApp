//
//  VolumenDeRiegoView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct VolumenDeRiegoView: View {
    @State var volumenM3: Double = 100.00
    @State var arrayCalculo: [VolumenDeRiegoModel] = productosVolumenRiengo
    @ObservedObject var volumentVM: VolumenDeriegoViewmodel

    var body: some View {
        ScrollView {
                Color(red: 0.681, green: 0.695, blue: 1.000)
                
                List {
                    HStack() {
                        Text("superficie en m3")
                            .frame(width: 200, height: 40, alignment: .leading)
                            .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
                            .cornerRadius(10)
                        TextField("100.00", value: $volumentVM.m3Multiply, format: .number )
                    }
                    Button ("Calcular") {
                     /*   var index = 1
                        volumentVM.arrayCalculo.forEach { inter in
                            
                            volumentVM.calculatorDic[String(index)] = Double(inter.valueProduct)
                            index += 1
                        }*/
                        Task {
                            await volumentVM.calculatorM3()
                        }
                        
                    }
                        .frame(width: 300, height: 30, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color(red: 0.838, green: 0.849, blue: 0.845))
                        .cornerRadius(100)
                    Text("Productos                     LTProducto")
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(100)
                //.cornerRadius(10)
                //.frame(width: 350, height: 800, alignment: .top)
                  
                }
                .cornerRadius(10)
                .frame(width: 350, height: 235, alignment: .top)
                
            List {
                ForEach(Array(volumentVM.arrayCalculo.enumerated()),  id: \.offset) { index, option in
                    HStack(){
                        Text(option.nombre.rawValue)
                        Spacer()
                        Text(volumentVM.arrayCalculo[index].valueProduct)
                    }

                    //.alignment(.leading)
                }
                .padding(15)
            }
            .cornerRadius(10)
            .frame(width: 350, height: 720, alignment: .center)
        }
        
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
    }
}
/*
#Preview {
    VolumenDeRiegoView()
}
*/




