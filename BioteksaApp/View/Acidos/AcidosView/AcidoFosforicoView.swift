//
//  AcidoFosforicoView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/4/23.
//

import SwiftUI

struct AcidoFosforicoView: View {
    @ObservedObject var viewModel : AcidosViewModel
    
    var body: some View {
        HStack{
            VStack{
                BioteksaAcidosSubView()
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.fosforico.pesoEspecifico.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.fosforico.densidad.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.fosforico.riqueza.bioteksa)
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.fosforico.pesoEspecifico.otros)
                BioteksaTextField(title: "", text: $viewModel.fosforico.densidad.otros)
                BioteksaTextField(title: "", text: $viewModel.fosforico.riqueza.otros)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AcidoFosforicoView(viewModel: AcidosViewModel())
}
