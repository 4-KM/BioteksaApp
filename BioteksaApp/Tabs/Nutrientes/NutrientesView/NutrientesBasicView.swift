//
//  NutrientesBasicView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/3/23.
//

import SwiftUI

struct NutrientesBasicView: View {
    @Binding var bioteksa : Bioteksa

    var body: some View {
        TableContainer(title: "\(bioteksa.name)", backgroundColor:  Color(red: 0.021, green: 0.286, blue: 0.557)) {
            VStack{
                HStack(alignment: .center, spacing: 2){
                    VStack{
                        Text(bioteksa.value[0].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[0].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[1].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[1].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[2].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[2].quantity)
                    }
                }
                Divider()
                HStack{
                    VStack{
                        Text(bioteksa.value[3].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[3].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[4].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[4].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[5].name)
                        BioteksaNumberTextField(title: "", value: $bioteksa.value[5].quantity)
                    }
                }
            }
        }
    }
}

struct PreviewNutrientes: View {
    @State var value = Bioteksa(
        key: "1",
        value: [
            NutrientElement(
                nutrient_id: 1,
                quantity: 1.0
            ),
            NutrientElement(nutrient_id: 2, quantity: 2.0),
            NutrientElement(
                nutrient_id: 3,
                quantity: 3.0
            ),
            NutrientElement(nutrient_id: 4, quantity: 3.0),
            NutrientElement(
                nutrient_id: 5,
                quantity: 3.0
            ),
            NutrientElement(nutrient_id: 6, quantity: 3.0)
        ]
    )
    
    var body: some View {
        NutrientesBasicView(
            bioteksa: $value
        )
    }
}

#Preview {
    PreviewNutrientes()
}
