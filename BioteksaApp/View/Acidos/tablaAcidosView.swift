//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct AcidosTabBar: View {
    
    @ObservedObject var acidosViewModel: AcidosViewModel = AcidosViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack {
                Color(red: 0.681, green: 0.695, blue: 1.000)
                
                VStack {
                    BioteksaAcidosView(acidTitle: "Acido Sulforico", acidoSelect: .AcidoSulfurico, viewModel: acidosViewModel)
                    BioteksaAcidosView(acidTitle: "Acido Nitrico", acidoSelect: .AcidoNitrico, viewModel: acidosViewModel)
                    BioteksaAcidosView(acidTitle: "Acido Fosforico", acidoSelect: .AcidoFosforico, viewModel: acidosViewModel)
                }
                Button("Actualizar") {
                    print(acidosViewModel.sulfurico)
                    print(acidosViewModel.nitrico)
                    print(acidosViewModel.fosforico)

                }
                .frame(width: 350, height: 50, alignment: .center)
                .foregroundColor(.black)
                .background(Color.gray)
                .cornerRadius(10)
                
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
            .navigationTitle("Calculadora")
            
        }
    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosTabBar()
    }
}



