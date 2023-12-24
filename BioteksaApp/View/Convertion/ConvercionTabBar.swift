//
//  ConverciónTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct ConvercionTabBar: View {
    @ObservedObject var viewModel = ConversionViewModel()

    var body: some View {
        ScrollView {
            VStack{
                Color(red: 0.681, green: 0.695, blue: 1.000)
                ConversionBasicView(viewModel: viewModel)
                Button("Actualizar") {
                    print(viewModel.convertion)
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

struct ConverciónTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ConvercionTabBar()
    }
}
