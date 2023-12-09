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
                    BioteksaAcidosView(acidTitle: "Acido Sulforico", acidoSelect: .AcidoSulfurico)
                    BioteksaAcidosView(acidTitle: "Acido Nitrico", acidoSelect: .AcidoNitrico)
                    BioteksaAcidosView(acidTitle: "Acido Fosforico", acidoSelect: .AcidoFosforico)
                }
                Button("Actualizar") {
                    
                }
                .frame(width: 200, height: 40)
                .background(Color.gray)
                .foregroundColor(Color.white)
                .padding()
                
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



