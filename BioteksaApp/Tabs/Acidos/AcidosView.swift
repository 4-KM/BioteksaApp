//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct AcidosView: View {
    
    @ObservedObject var acidosViewModel: AcidosViewModel = AcidosViewModel()
    
    var body: some View {
        Page {
            VStack(spacing: 16) {
                AcidosContainer(acidTitle: "Acido Sulforico", acidoSelect: .AcidoSulfurico, viewModel: acidosViewModel)
                AcidosContainer(acidTitle: "Acido Nitrico", acidoSelect: .AcidoNitrico, viewModel: acidosViewModel)
                AcidosContainer(acidTitle: "Acido Fosforico", acidoSelect: .AcidoFosforico, viewModel: acidosViewModel)
                BioteksaButton(title: "Actualizar") {
                    print(acidosViewModel.sulfurico)
                    print(acidosViewModel.nitrico)
                    print(acidosViewModel.fosforico)
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



