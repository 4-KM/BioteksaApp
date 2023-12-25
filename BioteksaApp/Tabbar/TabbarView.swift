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
                Spacer()
                Button(action: {
                    Task {
                        await viewModel.logout()
                    }
                }, label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .foregroundColor(.white)
                })
            }
            .padding()
            .background(Color.blue)
            TabView {
                AcidosView()
                    .tabItem {
                        Label("Acidos", systemImage: "flask")
                    }
                NutrientesTabBar()
                    .tabItem {
                        Label("Nutrientes", systemImage: "circle.hexagongrid")
                    }
                ConvertionView()
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

#Preview {
    TabBarView(viewModel: TabbarViewModel(onLogout: {
        
    }))
}
