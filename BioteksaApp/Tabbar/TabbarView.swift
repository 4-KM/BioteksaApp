//
//  TabBarbioteksa.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import Dependencies
import SwiftUI
import BioteksaAPI

struct TabBarView: View {
    @ObservedObject var viewModel: TabbarViewModel
    
    init(viewModel: TabbarViewModel) {
        self.viewModel = viewModel
        UITabBar.appearance().unselectedItemTintColor = UIColor.green
    }
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            Group {
                ForEach(Array(viewModel.tabs.enumerated()), id: \.offset) { _, tab in
                    TabbarContainer(tab: tab)
                }
                Text("Salir")
                    .tabItem {
                        Label("Salir", systemImage: "rectangle.portrait.and.arrow.right.fill")
                    }
                    .onTapGesture {
                        viewModel.showLogoutAlert = true
                    }
                    .tag(4)
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.anatomy.bgPrimary, for: .tabBar)
        }
        .toolbarTitleDisplayMode(.inline)
        .onChange(of: viewModel.attemptChangeToTab) { oldValue, newValue in
            if viewModel.shouldChangeTab(to: newValue) {
                viewModel.selectedTab = newValue
            } else {
                viewModel.selectedTab = oldValue
            }
        }
        .onChange(of: viewModel.selectedTab) { oldValue, newValue in
            viewModel.attemptChangeToTab = newValue
        }
        .confirmationDialog("Cerrar sesion", isPresented: $viewModel.showLogoutAlert) {
            Button("Cerrar sesion", role: .destructive) {
                Task {
                    await viewModel.logout()
                }
            }
            Button("Cancelar", role: .cancel) { }
        }
    }
}

#Preview {
    withDependencies {
        $0.userDefaults = MockUserDefaults(storage: { key in
            0
        })
    } operation: {
        TabBarView(viewModel: TabbarViewModel(onLogout: { }))
    }
}
