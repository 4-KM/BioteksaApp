//
//  RootView.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
    
    var body: some View {
        VStack {
            switch viewModel.activeView {
            case .splash:
                Image("bioteksaLogo")
            case .login:
                LoginView(
                    viewModel: LoginViewModel {
                        Task {
                            await viewModel.getSessionState()
                        }
                    }
                )
            case .loggedIn:
                TabBarView(
                    viewModel: TabbarViewModel {
                        Task {
                            await viewModel.getSessionState()
                        }
                    }
                )
            }
        }
        .task {
            Task {
                await viewModel.getSessionState()
            }
        }
    }
}

#Preview{
    RootView(viewModel: RootViewModel())
}
