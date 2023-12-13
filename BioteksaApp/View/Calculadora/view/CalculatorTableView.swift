//
//  CalculatorTableView.swift
//  BioteksaApp
//
//  Created by Aldroid on 12/12/23.
//

import SwiftUI

struct CalculatorTableView: View {
    
    @ObservedObject var viewModel: CalculadoraViewModel
    @Binding var valuesAcidoInfo:CalculadoraViewModel.Acido
    
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack( spacing: 0) {
                ForEach( acidosCalculator, id: \.self){ acido in
                    TitlesView(title: acido.name, colorText: acido.textColor, colorCell: acido.rowColor)
                }
            }.frame(maxWidth: .infinity).padding(.bottom)
            VStack(spacing: 0) {
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.medNeutrailar)
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.pesoEspesifico).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.densidad).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.riqueza).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.HMNOL)
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.HMNOL100)
            }.frame(maxWidth: .infinity).padding(.bottom)
            VStack (spacing: 0){
                CalculatorTextView(text: valuesAcidoInfo.bioteksa.medNeutrailar)
                CalculatorTextView(text: valuesAcidoInfo.otros.pesoEspesifico).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.otros.densidad).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.otros.riqueza).background(Color(red: 0.997, green: 0.970, blue: 0.848))
                CalculatorTextView(text: valuesAcidoInfo.otros.HMNOL)
                CalculatorTextView(text: valuesAcidoInfo.otros.HMNOL100)
            }.frame(maxWidth: .infinity).padding(.bottom)
        }
    }
}


struct TitlesView: View {
    var title: String
    var colorText: Color
    var colorCell: Color
    
    var body: some View  {
        Text(title)
            .frame( maxWidth: .infinity, minHeight: 40,alignment: .leading)
            .foregroundColor(colorText)
            .background(colorCell)
            .padding(.leading)
            
            
    }
    
}

struct CalculatorTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .frame( maxWidth: .infinity, minHeight: 40)
            
    }
}
class Test: ObservableObject {
    @Published var texts1 = ["1"]
    
    

}


#Preview {
    
    HStack {
        CalculatorTableView( viewModel: CalculadoraViewModel(), valuesAcidoInfo: .constant(CalculadoraViewModel.Acido.init(bioteksa: .init(pesoEspesifico: "1", densidad: "2", riqueza: "3", medNeutrailar: "4", HMNOL: "5", HMNOL100: "6" ), otros: .init(pesoEspesifico: "12", densidad: "12", riqueza: "13", medNeutrailar: "14", HMNOL: "15", HMNOL100: "16" )) ) )
    }

    
    
}
