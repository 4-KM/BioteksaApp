//
//  Comparison.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 04/01/24.
//

import SwiftUI

struct ComparisonHeader: View {
    var body: some View {
        HStack{
            Text("")
                .frame(maxWidth: .infinity)
            Text("Bioteksa")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.anatomy.fgBrand)
            Text("Otros")
                .frame(maxWidth: .infinity)
					 .foregroundColor(.anatomy.fgTextGray)
        }
        .padding()
				.background(Color.anatomy.bgPrimary)
    }
}
