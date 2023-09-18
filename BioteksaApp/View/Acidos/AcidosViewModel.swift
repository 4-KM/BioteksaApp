//
//  AcidosViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import Foundation
import SwiftUI
 
class AcidosViewModel: ObservableObject {
    
    @Published var Bioteksa: String = ""
    @Published var Otros: String = ""
    
    func tablasComparativas() {
        Section(header: Text("house")) {
            ForEach(house + work, id: \.title) { option in
                Label(option.title, systemImage: option.otros)
            }
        }
        Section(header: Text("Work")) {
            ForEach(work, id: \.title) { option in
                Label(option.title, systemImage: option.otros)
            }
            .listStyle(SidebarListStyle())
        }
    }
}

