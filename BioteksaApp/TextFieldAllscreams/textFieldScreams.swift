//
//  textFieldScreams.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 21/09/23.
//

import SwiftUI


struct textFieldScreams: View {
    
    @State var valorComparativoBioteksa: String = ""
    @State var valorComparativoOtros: String = ""
    
    
    @State var formulaSoluble: String = ""
    @State var formulaBioteksa: String = ""
    
    
    @State var N: String = ""
    @State var P: String = ""
    @State var K: String = ""
    @State var CA: String = ""
    @State var MG: String = ""
    @State var S: String = ""

    
    
    var body: some View {
        ZStack() {
            HStack {
                Spacer()
                // Rectangle()
                TextField("", text: $valorComparativoBioteksa)
                    .foregroundColor(.white)
                    .keyboardType(.decimalPad)
                    .background(Color.black)
                    .frame(width: 100, height: 100, alignment: .trailing)
                
                
                TextField("", text: $valorComparativoOtros)
                    .keyboardType(.decimalPad)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100, alignment: .trailing)
                
                Spacer()
                
                HStack {
                    
                }
            }
            .background(Color(red: 0.997, green: 0.970, blue: 0.848))

        }
    }
}

#Preview {
    textFieldScreams()
}
