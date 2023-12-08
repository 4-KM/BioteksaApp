//
//  NutrientesTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI
import Foundation
import UIKit

struct NutrientesTabBar: View {
    @State var texto: String = ""
    
    @ObservedObject var nutrients: NutrientesModelView = NutrientesModelView()

    var body: some View {
            ScrollView {
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    ForEach(Array( productos.enumerated()),  id: \.offset ) { index, optionProduct in
                        Text(optionProduct.nombre.rawValue)
                            .frame(width: 350, height: 35, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                            .cornerRadius(10)
                        List {
                            ForEach(lTProductos,  id: \.nombre) { option in
                                
                                HStack (spacing: 40){
                                    Text(option.nombre.getAbbreviation()).frame(width: 60, height: 35, alignment: .center)
                                   
                                        HStack (spacing: 40){
                                            if let nutrient = nutrients.nutrientsModel[String(index + 1)], let quantity = nutrient[TypeNutriente.allCases.firstIndex(of: option.nombre)!].quantity   {
                                                
                                                Text( "\(quantity) " as  String)
                                            }

                                        }.foregroundColor(.black)
                                    

                                }
                               /* Text(option.nombre.getAbbreviation()) + Text(" text field ")
                                    .foregroundColor(.black)*/
                                    //.frame(width: 350, height: 30, alignment: .center)
                                    //.background(Color(red: 0.949, green: 0.949, blue: 0.967))

                            }
                            .frame(width: 300, height: 35, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                            .cornerRadius(10)
                        }
                        .frame(width: 350, height: 340, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                    }
                    .padding(10)
                    
                }
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
        // .navigationTitle("Calculadora")
        
    }



struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesTabBar()
    }
}


