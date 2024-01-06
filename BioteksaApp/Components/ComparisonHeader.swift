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
                .foregroundColor(Color(red: 0.021, green: 0.286, blue: 0.557))
            Text("Otros")
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.gray)
        }
        .frame(height: 40)
        .background(.white)
    }
}
