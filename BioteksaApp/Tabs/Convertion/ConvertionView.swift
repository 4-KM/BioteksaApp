//
//  ConverciónTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct ConvertionView: View {
    @ObservedObject var viewModel = ConvertionViewModel()

    var body: some View {
        Page {
            Color(red: 0.681, green: 0.695, blue: 1.000)
            ConversionBasicView(viewModel: viewModel)
            BioteksaButton(title: "Actualizar") {
                print(viewModel.convertion)
            }
        }
    }
}

struct ConverciónTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ConvertionView()
    }
}
