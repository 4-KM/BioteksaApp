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

    var body: some View {
        NavigationView(){
            ScrollView {
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    ForEach( productos,  id: \.nombre ) { option in
                        Text(option.nombre)
                            .frame(width: 350, height: 35, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                            .cornerRadius(10)
                        List {
                            ForEach(lTProductos,  id: \.nombre) { option in
                                Text(option.nombre) + Text(" text field ")
                                    .foregroundColor(.black)
                                    //.frame(width: 350, height: 30, alignment: .center)
                                    //.background(Color(red: 0.949, green: 0.949, blue: 0.967))



                            }
                            .frame(width: 350, height: 35, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                            .cornerRadius(10)
                        }
                        .frame(width: 350, height: 340, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                    }
                  
                    
                }
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
        // .navigationTitle("Calculadora")
        
    }
}


struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesTabBar()
    }
}


