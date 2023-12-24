//
//  TabBarbioteksa.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var viewModel: TabbarViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .center, content: {
                    Text("Calculadora")
                })
                Spacer()
                Button(action: {
                    Task {
                        await viewModel.logout()
                    }
                }, label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                })
            }
            TabView {
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
                        Label("Converción", systemImage: "rectangle.2.swap")
                    }
                Calculadora()
                    .tabItem {
                        Label("Calculadora", systemImage: "minus.forwardslash.plus")
                    }
            }
        }
    }
}

struct TabBarbioteksa_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewModel: TabbarViewModel(onLogout: {
            
        }))
    }
}

