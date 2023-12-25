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
        TableContainer(title: acidTitle, backgroundColor:  Color(red: 0.757, green: 0.916, blue: 0.025)) {
            header()
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
            .background(Color(red: 0.997, green: 0.970, blue: 0.848))
        }
    }
    
    @ViewBuilder func header() -> some View {
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
