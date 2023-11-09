//
//  TabBarbioteksa.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct TabBarBioteksa: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        ZStack {

        GeometryReader { proxy in
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
                        ConvercionTabBar()
                            .tabItem {
                                Label("Comverción", systemImage: "rectangle.2.swap")
                            }
                        Calculadora()
                            .tabItem {
                                Label("Calculadora", systemImage: "minus.forwardslash.plus")
                            }
                    }
                    .navigationTitle("hola")
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color(red: 0.757, green: 0.916, blue: 0.025), for: .tabBar)
                }
                .frame(width:proxy.size.width, height:proxy.size.height) //W390 H780
            }
        }
    }
}


struct TabBarbioteksa_Previews: PreviewProvider {
    static var previews: some View {
        TabBarBioteksa()
    }
}
