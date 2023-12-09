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
                        
                    }
                    .frame(width: 200, height: 40)
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .padding()
                }
               
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
    }

struct ConverciónTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ConvercionTabBar()
    }
}
