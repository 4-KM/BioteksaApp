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
    @ObservedObject var viewModel: NutrientesViewModel = NutrientesViewModel()

    var body: some View {
        Page {
            ForEach(viewModel.response) { bioteksa in
                NutrientesBasicView(bioteksa: bioteksa)
            }
            BioteksaButton(title: "Actualizar") {
                print(viewModel.response)
            }
        }
    }
    
}



struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesTabBar()
    }
}


