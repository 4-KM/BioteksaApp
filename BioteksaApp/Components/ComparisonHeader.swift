//
//  Comparison.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 04/01/24.
//

import SwiftUI

struct ComparisonHeader: View {
	var aColumn: String = "Bioteksa"
	var bColumn: String = "Otros"
    var body: some View {
        HStack{
            Text("")
                .frame(maxWidth: .infinity)
            Text(aColumn)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.anatomy.fgBrand)
            Text(bColumn)
                .frame(maxWidth: .infinity)
					 .foregroundColor(.anatomy.fgTextGray)
        }
        .padding()
				.background(Color.anatomy.bgPrimary)
    }
}
