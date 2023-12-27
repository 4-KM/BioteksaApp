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
        VStack(spacing: 0) {
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
            .padding(5)
            .background(LinearGradient(gradient: Gradient(colors: [Color.anatomy.grandientBlue2, Color.anatomy.grandientBlue1]), startPoint: .top, endPoint: .bottom))
            
            TabView {
                ForEach(Array(viewModel.tabs.enumerated()), id: \.offset) { _, tab in
                    switch tab {
                    case .acidos(let viewModel):
                        AcidosView(viewModel: viewModel)
                            .tabItem {
                                Label(tab.title, systemImage: tab.image)
                            }
                    case .nutrientes(let viewModel):
                        NutrientesView(viewModel: viewModel)
                            .tabItem {
                                Label(tab.title, systemImage: tab.image)
                            }
                    case .convertion(let viewModel):
                        ConvertionView(viewModel: viewModel)
                            .tabItem {
                                Label(tab.title, systemImage: tab.image)
                            }
                    case .calculadora(let viewModel):
                        CalculadoraView(viewModel: viewModel)
                            .tabItem {
                                Label(tab.title, systemImage: tab.image)
                            }
                    }
                }
                
            }
        }
    }
}

#Preview {
    TabBarView(viewModel: TabbarViewModel(onLogout: {
        
    }))
}
