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
    @ObservedObject var volumentVM: VolumenDeriegoViewmodel
    
    var body: some View {
        Page {
            List {
                HStack() {
                    Text("superficie en m3")
                        .frame(width: 200, height: 40, alignment: .leading)
                        .foregroundColor(Color.anatomy.bgTitleBlue)
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
                .foregroundColor(Color.anatomy.black)
                .background(Color.anatomy.bgUnderlineGrey)
                .cornerRadius(100)
                Text("Productos                     LTProducto")
                    .frame(width: 300, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.anatomy.bgTitleBlue)
                    .cornerRadius(100)
                //.cornerRadius(10)
                //.frame(width: 350, height: 800, alignment: .top)
                
            }
            .background(Color.anatomy.bgPurple)

            .cornerRadius(10)
            .frame(width: 350, height: 235, alignment: .top)
            
            List {
                ForEach($volumentVM.arrayCalculo,  id: \.self) {  $option in
                    HStack(){
                        Text(option.nombre.rawValue)
                        Spacer()
                        Text(option.valueProduct)
                    }
                    
                    //.alignment(.leading)
                }
                .padding(15)
            }
            .background(Color.anatomy.bgPurple)
            .cornerRadius(10)
            .frame(width: 350, height: 720, alignment: .center)
        }
        .onAppear{
            Task{
                    await volumentVM.calculatorM3()
                } 
        }
    }
}
