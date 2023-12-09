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
    @ObservedObject var model: NutrientesModelView = NutrientesModelView()

    var body: some View {
        ScrollView {
            VStack {
                Color(red: 0.681, green: 0.695, blue: 1.000)
                ForEach(model.response) { bioteksa in
                    NutrientesBasicView(acidTitle: "\(bioteksa.name)", bioteksa: bioteksa, model: model)
                }
                Button("Actualizar") {
                    print(model.response)
                }
                .frame(width: 350, height: 50, alignment: .center)
                .foregroundColor(.black)
                .background(Color.gray)
                .cornerRadius(10)
            }
        }
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        .navigationTitle("Calculadora")
    }
    
}



struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesTabBar()
    }
}


