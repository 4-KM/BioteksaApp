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
						Image("composed")
					case .login(let viewModel):
						LoginView(viewModel: viewModel)
					case .loggedIn(let viewModel):
						if colorScheme == .light || true {
							TabBarView(viewModel: viewModel)
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
