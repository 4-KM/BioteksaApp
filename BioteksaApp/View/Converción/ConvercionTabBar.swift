//
//  ConverciónTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct ConvercionTabBar: View {
    var body: some View {
        NavigationView {
            ScrollView {
               
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    Text("""
                                    Tabla De Conversión
                         Element      Formula       Formula
                                              Soluble         Bioteksa
                      """)
                    .frame(width: 350, height: 100, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                    .cornerRadius(10)
                    List {
                        ForEach( elementos ,  id: \.nombre ) { option in Text(option.nombre) + Text("           text1 ") + Text ("text2")
                                .foregroundColor(.black)
                        }
                        .padding(25)
                    }
                    .frame(width: 350, height: 630, alignment: .center)
                    .cornerRadius(10)
                    
                    
                  
                }
               
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
    }
}
struct ConverciónTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ConvercionTabBar()
    }
}
