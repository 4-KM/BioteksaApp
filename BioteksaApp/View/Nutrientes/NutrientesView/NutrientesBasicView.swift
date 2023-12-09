//
//  NutrientesBasicView.swift
//  BioteksaApp
//
//  Created by Iris GalGal on 12/3/23.
//

import SwiftUI

struct NutrientesBasicView: View {
    
    var acidTitle: LocalizedStringKey
    @State var bioteksa : Bioteksa
    @ObservedObject var model: NutrientesModelView

    var body: some View {
        
        TableContainer(title: acidTitle, backgroundColor:  Color(red: 0.021, green: 0.286, blue: 0.557)) {
            VStack{
                HStack(alignment: .center, spacing: 2){
                    VStack{
                        Text(bioteksa.value[0].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[0].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[1].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[1].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[2].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[2].quantity)
                    }
                }
                Divider()
                HStack{
                    VStack{
                        Text(bioteksa.value[3].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[3].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[4].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[4].quantity)
                    }
                    VStack{
                        Text(bioteksa.value[5].name)
                        BioteksaTextField(title: "", text: $bioteksa.value[5].quantity)
                    }
                }
            }
        }
    }
}

#Preview {
    NutrientesBasicView(acidTitle: "HBK Plus", bioteksa: Bioteksa(key: "1", value: [NutrientElement(nutrient_id: 1, quantity: "1.0"),NutrientElement(nutrient_id: 2, quantity: "2.0"),NutrientElement(nutrient_id: 3, quantity: "3.0"),NutrientElement(nutrient_id: 4, quantity: "3.0"),NutrientElement(nutrient_id: 5, quantity: "3.0"),NutrientElement(nutrient_id: 6, quantity: "3.0")]), model: NutrientesModelView())
}
