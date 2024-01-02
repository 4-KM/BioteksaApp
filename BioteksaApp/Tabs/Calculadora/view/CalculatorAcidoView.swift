//
//  CalculatorAcidoView.swift
//  BioteksaApp
//
//  Created by Aldroid on 12/12/23.
//

import SwiftUI

struct CalculatorAcidoView: View {
    var title: String
    var values: AcidoModel
    
    var body: some View {
        TableContainer(title: LocalizedStringKey(title), backgroundColor: .blue) {
            ComparisonHeaderView()
            CalculatorTableView(valuesAcidoInfo: values)
        }
    }
}

struct ComparisonHeaderView: View {
    var body: some View {
        HStack{
            Text("")
                .frame(maxWidth: .infinity)
            Text("Bioteksa")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
            Text("Otros")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.gray)
        }
        .frame(height: 40)
        .background(.white)
    }
}

/*
#Preview {
    HStack {
        CalculatorAcidoView(title: "Acido Sulfurico",viewModel: CalculadoraViewModel(), values: .constant(CalculadoraViewModel.Acido.init(bioteksa: .init(pesoEspesifico: "1", densidad: "2", riqueza: "3", medNeutrailar: "4", HMNOL: "5", HMNOL100: "6" ), otros: .init(pesoEspesifico: "1", densidad: "2", riqueza: "3", medNeutrailar: "4", HMNOL: "5", HMNOL100: "6" )) ) )
    }.background(.yellow)
}
*/
