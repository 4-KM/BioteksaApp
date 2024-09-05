//
//  ConverciónTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct ConvertionView: View {
    @ObservedObject var viewModel: ConvertionViewModel

    var body: some View {
        Page(viewModel: viewModel) {
            TableContainer(title: "Tabla de Conversión") {
                ConversionSubHeaders()
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[0].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[0].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[0].bioteksa)
                }
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[1].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[1].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[1].bioteksa)
                }
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[2].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[2].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[2].bioteksa)
                }
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[3].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[3].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[3].bioteksa)
                }
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[4].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[4].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[4].bioteksa)
                }
                HStack {
                    BioteksaAcidosText(title: viewModel.convertion[5].name)
                    BioteksaAcidosText(title: "\(viewModel.convertion[5].soluble)")
                    BioteksaNumberTextField(title: "", value: $viewModel.convertion[5].bioteksa)
                }
            }
            BioteksaButton(title: "Actualizar") {
                await viewModel.update()
            }
        }
    }
}

struct ConversionSubHeaders: View {
    var body: some View {
        HStack {
					
            Text("Elemento")
                .frame(maxWidth: .infinity)
            Text("Fórmula Soluble")
                .frame(maxWidth: .infinity)
            Text("Fórmula Bioteksa")
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
				.foregroundColor(.anatomy.fgContrast)
				.background(Color.anatomy.bgBrand)
    }
}

struct ConverciónTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ConvertionView(viewModel: ConvertionViewModel())
    }
}
