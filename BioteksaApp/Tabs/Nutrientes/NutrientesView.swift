//
//  NutrientesTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI
import Foundation
import UIKit

struct NutrientesView: View {
    @ObservedObject var viewModel: NutrientesViewModel

    var body: some View {
        Page {
            ForEach($viewModel.response) { $bioteksa in
                NutrientesBasicView(bioteksa: $bioteksa)
            }
            BioteksaButton(title: "Actualizar") {
                await viewModel.update()
            }
        }
    }
}

struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesView(viewModel: NutrientesViewModel())
    }
}


