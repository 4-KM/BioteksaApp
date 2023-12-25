//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct AcidosView: View {
    
    @ObservedObject var viewModel: AcidosViewModel = AcidosViewModel()
    
    var body: some View {
        Page {
            VStack(spacing: 16) {
                AcidosContainer(acidTitle: "Acido Sulforico", model: $viewModel.sulfurico)
                AcidosContainer(acidTitle: "Acido Nitrico", model: $viewModel.nitrico)
                AcidosContainer(acidTitle: "Acido Fosforico", model: $viewModel.fosforico)
                BioteksaButton(title: "Actualizar") {
                    await viewModel.update()
                }
            }
        }
        .navigationTitle("Calculadora")
    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosView()
    }
}



