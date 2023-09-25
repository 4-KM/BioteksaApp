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
        NavigationView() {
            Form {
                Section {
                    HStack {
                        // Rectangle()
                        TextField("", text: $valorComparativoBioteksa)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 120, height: 50, alignment: .center)
                        
                        
                        TextField("", text: $valorComparativoBioteksa)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 120, height: 50, alignment: .center)
                        
                    }
                }
                .background(Color(red: 0.997, green: 0.970, blue: 0.848))
                Section {
                    
                    HStack {
                        // Rectangle()
                        TextField("", text: $valorComparativoBioteksa)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 120, height: 50, alignment: .center)
                            //.padding(1)
                    }
                }
                
                .background(Color(red: 0.997, green: 0.970, blue: 0.848))
                
                Section {
                    HStack {
                        TextField("", text: $valorComparativoOtros)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 100, height: 50, alignment: .trailing)
                        
                        TextField("", text: $valorComparativoOtros)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 100, height: 50, alignment: .trailing)
                        
                    }
                }
                Section {
                    HStack {
                        TextField("", text: $valorComparativoOtros)
                            .keyboardType(.decimalPad)
                            .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                            .frame(width: 100, height: 50, alignment: .trailing)
                    }
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    textFieldScreams()
}


