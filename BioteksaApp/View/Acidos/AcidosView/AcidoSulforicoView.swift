//
//  AcidoSulforicoView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/3/23.
//

import SwiftUI

struct AcidoSulforicoView: View {
    @ObservedObject var viewModel = AcidosViewModel()

    var body: some View {
        HStack{
            VStack{
                BioteksaAcidosSubView()
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.sulfurico.pesoEspecifico.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.sulfurico.densidad.bioteksa)
                BioteksaTextField(title: "", text: $viewModel.sulfurico.riqueza.bioteksa)
            }
            VStack{
                BioteksaTextField(title: "", text: $viewModel.sulfurico.pesoEspecifico.otros)
                BioteksaTextField(title: "", text: $viewModel.sulfurico.densidad.otros)
                BioteksaTextField(title: "", text: $viewModel.sulfurico.riqueza.otros)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AcidoSulforicoView(viewModel: AcidosViewModel())
}
