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
                      
                      AcidosContainer(acidTitle: "Acido Sulfurico", model: $viewModel.acidosTuple.sulfurico)
                      AcidosContainer(acidTitle: "Acido Nitrico", model: $viewModel.acidosTuple.nitrico)
                      AcidosContainer(acidTitle: "Acido Fosforico", model: $viewModel.acidosTuple.fosforico)
                      BioteksaButton(title: "Actualizar") {
                          await viewModel.update()
                      }
                  }
			  }
        }
        .navigationTitle("Calculadora")
    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosView(viewModel: AcidosViewModel())
    }
}

struct InfoView: View {
	var text: String
	
	var body: some View {
		Text(text)
	}
}

