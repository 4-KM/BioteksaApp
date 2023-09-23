//
//  TabBarbioteksa.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct TabBarBioteksa: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    var body: some View {
        TabView {
            Group {
                
                AcidosTabBar()
                    .tabItem {
                        Image(systemName:"flask")
                        Text("Acidos")
                    }
                NutrientesTabBar()
                    .tabItem {
                        Label("Nutrientes", systemImage: "circle.hexagongrid")
                    }
                ConverciónTabBar()
                    .tabItem {
                        Label("Comverción", systemImage: "rectangle.2.swap")
                    }
                Calculadora()
                    .tabItem {
                        Label("Calculadora", systemImage: "minus.forwardslash.plus")
                    }
            }
             .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.black, for: .tabBar)
        }
    }
}

struct TabBarbioteksa_Previews: PreviewProvider {
    static var previews: some View {
        TabBarBioteksa()
    }
}
