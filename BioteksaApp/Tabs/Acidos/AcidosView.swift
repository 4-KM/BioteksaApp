//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//
import Dependencies
import SwiftUI

struct AcidosView: View {
    
    @ObservedObject var viewModel: AcidosViewModel
    
    var body: some View {
        Page(viewModel: viewModel) {
			  VStack(spacing: 16) {
                  switch viewModel.activeView {
                  case .fetching:
                      ProgressView()
                  case .error:
                      Text("Ocurrio un error")
                  case .content:
                      AcidosContainer(acidTitle: "Ácido Sulfúrico", model: $viewModel.acidosTuple.sulfurico)
                      AcidosContainer(acidTitle: "Ácido Nítrico", model: $viewModel.acidosTuple.nitrico)
                      AcidosContainer(acidTitle: "Ácido Fosfórico", model: $viewModel.acidosTuple.fosforico)
                      BioteksaButton(title: "Actualizar") {
                          await viewModel.update()
                      }
                  }
			  }
        }
        .navigationTitle("Ácidos")
    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosView(viewModel: AcidosViewModel())
    }
}
