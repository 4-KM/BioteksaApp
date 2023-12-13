//
//  CalculatorAcidoView.swift
//  BioteksaApp
//
//  Created by Aldroid on 12/12/23.
//

import SwiftUI

struct CalculatorAcidoView: View {
//    @Binding var textsBioteksa:[String]
//    @Binding var textOtros: [String]
    var title: String
    @ObservedObject var viewModel: CalculadoraViewModel
    @Binding var values: CalculadoraViewModel.Acido
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                
                Text(title).frame(maxWidth: .infinity, minHeight: 45).background(.green)
                
                CalculatorAcidoHeaderView()
                CalculatorTableView(viewModel: viewModel, valuesAcidoInfo: $values)
                    .background(.white)
            }
            VStack {
                
            }
        }
        .cornerRadius(10)
        .padding()
    }
}

struct CalculatorAcidoHeaderView: View {
    var body: some View {
        HStack() {
            Text("").frame(maxWidth: .infinity)
            Text("Bioteksa").frame(maxWidth: .infinity)
            Text("Otros").frame(maxWidth: .infinity)
        }.frame(height: 45).background(.white)
    }
}





#Preview {
    HStack {
        CalculatorAcidoView(title: "Acido Sulfurico",viewModel: CalculadoraViewModel(), values: .constant(CalculadoraViewModel.Acido.init(bioteksa: .init(pesoEspesifico: "1", densidad: "2", riqueza: "3", medNeutrailar: "4", HMNOL: "5", HMNOL100: "6" ), otros: .init(pesoEspesifico: "1", densidad: "2", riqueza: "3", medNeutrailar: "4", HMNOL: "5", HMNOL100: "6" )) ) )
    }.background(.yellow)
}
