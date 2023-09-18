//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct AcidosTabBar: View {
    @State var comparativa: String = "0"
    
    var acidosViewModel = AcidosViewModel()
    var body: some View {
        NavigationView {
            //Spacer()
            List {
                Section(header: Text("Bioteksa       Otros")
                    .frame(width: 250, height: 30, alignment: .trailing))
                {
                    Section {
                        ForEach(acidos, id: \.tipoDeAcido) { option in
                            
                        }
                    }
                }
            }
             .frame(width: 350.0, height: 350, alignment: .center)
            .navigationTitle("Acido Fosforico")
            .navigationBarTitleDisplayMode(.inline)
            .padding(100)
        }
    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosTabBar()
    }
}



/*
 .navigationTitle("Acido Sulfurico")
 .navigationTitle("Acido Nitrico")

 List {
 Section {
 ForEach(house + work, id: \.title) { option in
 Label(option.title, systemImage: option.otros)
 }
 }
 }
 .frame(width: 350.0, height: 350, alignment: .top)
 
 List {
 Section {
 ForEach(house + work, id: \.title) { option in
 Label(option.title, systemImage: option.otros)
 }
 }
 }
 .frame(width: 350.0, height: 350, alignment: .top)
 
 
 List {
 Section {
 Text("iPhone Language")
 }
 Section {
 Text("English")
 Text("Thai")
 } header: {
 
 Text("Preferred language order")
 } footer: {
 
 Text("Apps and websites will use the first language in this list that they support.")
 }
 Section {
 Text("Region")
 Text("Calendar")
 Text("Temperature Unit")
 }
 }*/
