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
                
                List {
                    Text("superficie en m3")
                        .frame(width: 250, height: 40, alignment: .leading)
                        .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                    Button ("Calcular") {}
                        .frame(width: 350, height: 30, alignment: .center)
                        .foregroundColor(.black)
                        .background(Color(red: 0.838, green: 0.849, blue: 0.845))
                        .cornerRadius(10)
                    Text("superficie en m3")
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                }
                .cornerRadius(10.0)
                .frame(width: 350, height: 220, alignment: .center)
                List {
                    ForEach(productos,  id: \.nombre) { option in Text(option.nombre)
                    }
                    .padding(15)
                }
                .cornerRadius(10.0)
                .frame(width: 350, height: 555, alignment: .center)
                Color(red: 0.681, green: 0.695, blue: 1.000)
               
            }
        }
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
    }
}

#Preview {
    VolumenDeRiegoView()
}

