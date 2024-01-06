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
            ComparisonHeader()
            CalculatorTableView(valuesAcidoInfo: values)
        }
    }
}
