//
//  BioteksaAcidosView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/2/23.
//

import SwiftUI

struct AcidosContainer: View {
    var acidTitle: LocalizedStringKey
    @Binding var model: AcidoModel

    var body: some View {
        TableContainer(title: acidTitle, backgroundColor:  Color.anatomy.bgTitleGreen) {
            ComparisonHeader()
            HStack{
                titlesColumn()
                VStack{
                    BioteksaNumberTextField(title: "", value: $model.pesoEspecifico.bioteksa)
                    BioteksaNumberTextField(title: "", value: $model.densidad.bioteksa)
                    BioteksaNumberTextField(title: "", value: $model.riqueza.bioteksa)
                }
                VStack{
                    BioteksaNumberTextField(title: "", value: $model.pesoEspecifico.otros)
                    BioteksaNumberTextField(title: "", value: $model.densidad.otros)
                    BioteksaNumberTextField(title: "", value: $model.riqueza.otros)
                }
            }
            .frame(maxWidth: .infinity)
				.background(Color.anatomy.bgUnderlineGrey)
        }
    }
    
    @ViewBuilder func titlesColumn() -> some View {
        let titlesAcidos = ["Peso Especifico", "Densidad", "Riqueza"]
        VStack{
            ForEach(titlesAcidos,  id: \.self) { option in 
                BioteksaAcidosText(title: option)
            }
        }
    }
}

struct BioteksaAcidosText: View {
    var title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
    }
}

struct PreviewView: View {
    @State var model =  AcidoModel(
        pesoEspecifico: AcidoInfo(bioteksa: 2, otros: 2),
        densidad: AcidoInfo(bioteksa: 2, otros: 2),
        riqueza: AcidoInfo(bioteksa: 2, otros: 2)
    )
    
    var body: some View {
        AcidosContainer(acidTitle: "Nitrico", model: $model)
    }
}

#Preview {
    PreviewView()
}
