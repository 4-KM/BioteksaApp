//
//  ConversionBasicView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/5/23.
//

import SwiftUI

struct ConversionBasicView: View {
    @ObservedObject var viewModel : ConversionViewModel
    var body: some View {
        ZStack() {
            HStack{
                TableContainer(title: "Tabla De Conversión", backgroundColor:  Color(red: 0.021, green: 0.286, blue: 0.557)) {
                    ConversionSubHeaders()
                        .foregroundColor(.white)
                    HStack{
                        VStack{
                            ForEach(viewModel.convertion,  id: \.self) { option in BioteksaAcidosText(title: option.name)
                            }
                        }
                        VStack{
                            ForEach($viewModel.convertion,  id: \.self) { $option in
                                BioteksaTextField(title: "", text: $option.soluble)
                            }
                        }
                        VStack{
                            ForEach($viewModel.convertion,  id: \.self) { $option in
                                BioteksaTextField(title: "", text: $option.bioteksa)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                        .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
                }
                .cornerRadius(10)
            }
        }
    }
}

struct ConversionSubHeaders: View {
    var body: some View {
        HStack{
            Text("Element")
                .frame(maxWidth: .infinity)
            Text("Formula Soluble")
                .frame(maxWidth: .infinity)
            Text("Formula Bioteksa")
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
        .foregroundColor(.white)
        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
    }
}

#Preview {
    ConversionBasicView(viewModel: ConversionViewModel())
}
