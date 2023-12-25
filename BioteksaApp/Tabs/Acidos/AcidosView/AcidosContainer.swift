//
//  BioteksaAcidosView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/2/23.
//

import SwiftUI

struct AcidosContainer: View {
    var acidTitle: LocalizedStringKey
    var acidoSelect : Acidos
    @ObservedObject var viewModel : AcidosViewModel

    var body: some View {
        TableContainer(title: acidTitle, backgroundColor:  Color(red: 0.757, green: 0.916, blue: 0.025)) {
            BioteksaAcidosHeader()
            HStack{
                switch acidoSelect {
                case .AcidoSulfurico:
                    AcidoSulforicoView(viewModel: viewModel)
                case .AcidoNitrico:
                    AcidoNitricoView(viewModel: viewModel)
                case .AcidoFosforico:
                    AcidoFosforicoView(viewModel: viewModel)
                }
            }
            .background(Color(red: 0.997, green: 0.970, blue: 0.848))
        }
    }
}

struct BioteksaAcidosHeader: View {
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

struct BioteksaAcidosText: View {
    var title: String
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
        }
        .padding()
    }
}

struct BioteksaAcidosSubView: View {
    let titlesAcidos = ["Peso Especifico", "Densidad", "Riqueza"]
    
    var body: some View {
        VStack{
            ForEach(titlesAcidos,  id: \.self) { option in BioteksaAcidosText(title: option)
            }
        }
    }
}

#Preview {
    AcidosContainer(acidTitle: "Acido Sulforico", acidoSelect: .AcidoSulfurico, viewModel: AcidosViewModel())
}
