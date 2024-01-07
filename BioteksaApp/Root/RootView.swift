//
//  RootView.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel
	@Environment(\.colorScheme) var colorScheme
    var body: some View {
			VStack {
				switch viewModel.activeView {
					case .splash:
						Image("logotipo")
							.background {
								Image("bg_home-800")
							}
					case .login:
						LoginView(
							viewModel: LoginViewModel {
								Task {
									await viewModel.getSessionState()
								}
							}
						)
					case .loggedIn:
						if colorScheme == .light || true {
							TabBarView(
								viewModel: TabbarViewModel {
									Task {
										await viewModel.getSessionState()
									}
								}
							)
						}
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
