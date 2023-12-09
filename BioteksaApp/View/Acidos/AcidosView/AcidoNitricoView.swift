//
//  AcidoNitricoView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/4/23.
//

import SwiftUI

struct AcidoNitricoView: View {
    @ObservedObject var viewModel = AcidosViewModel()
    
    var body: some View {
        HStack{
            VStack{
                BioteksaAcidosSubView()
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.nitrico.pesoEspecifico.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.nitrico.densidad.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.nitrico.riqueza.bioteksa)
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.nitrico.pesoEspecifico.otros)
                BioteksaTextField(title: "", text: $viewModel.nitrico.densidad.otros)
                BioteksaTextField(title: "", text: $viewModel.nitrico.riqueza.otros)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AcidoNitricoView()
}
