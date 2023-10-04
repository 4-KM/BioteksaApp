//
//  VolumenDeRiegoView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct VolumenDeRiegoView: View {
    var body: some View {
        ScrollView {
            VStack {
                Color(red: 0.681, green: 0.695, blue: 1.000)
                
                List {
                    Text("superficie en m3")
                        .frame(width: 250, height: 40, alignment: .leading)
                        .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                    Button ("Calcular") {}
                        .frame(width: 300, height: 30, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color(red: 0.838, green: 0.849, blue: 0.845))
                        .cornerRadius(100)
                    Text("Productos                     LTProducto")
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(100)
                //}
                //.cornerRadius(10)
                //.frame(width: 350, height: 800, alignment: .top)
                    List {
                        ForEach(productos,  id: \.nombre) { option in Text(option.nombre) + Text("                    textos")
                                .foregroundColor(.red)
                                //.alignment(.leading)
                        }
                        .padding(15)
                    }
                    .padding(5)
                    .cornerRadius(10)
                    .frame(width: 350, height: 610, alignment: .center)
                }
                .cornerRadius(10)
                .frame(width: 350, height: 800, alignment: .top)
                
            }
            
        }
        
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
    }
}

#Preview {
    VolumenDeRiegoView()
}





