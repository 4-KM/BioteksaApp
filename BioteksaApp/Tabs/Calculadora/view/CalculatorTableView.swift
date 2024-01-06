//
//  CalculatorTableView.swift
//  BioteksaApp
//
//  Created by Aldroid on 12/12/23.
//

import SwiftUI

struct CalculatorTableView: View {
    var valuesAcidoInfo: AcidoModel
    
    var body: some View {
        VStack {
            ForEach(acidosCalculator, id: \.self) { acido in
                HStack {
                    TitlesView(title: acido.name, colorText: acido.textColor, colorCell: acido.rowColor)
                        .frame(maxWidth: .infinity)
                    QuantityText(value: valuesAcidoInfo.comparison(index: acido.propertyIndex).bioteksa)
                        .frame(maxWidth: .infinity)
                    QuantityText(value: valuesAcidoInfo.comparison(index: acido.propertyIndex).otros)
                        .frame(maxWidth: .infinity)
                }
                .background(acido.rowColor)
            }
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
