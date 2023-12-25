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
        Group {
            switch viewModel.activeView {
            case .splash:
                Image("bioteksaLogo")
            case .login:
                LoginView(
                    viewModel: LoginViewModel {
                        viewModel.getSessionState()
                    }
                )
            case .loggedIn:
                TabBarView(
                    viewModel: TabbarViewModel {
                        viewModel.getSessionState()
                    }
                )
            }
        }
        .task {
            viewModel.getSessionState()
        }
    }
}

#Preview{
    RootView(viewModel: RootViewModel())
}



