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
				case .login:
					LoginTestView(viewModel: LoginTestViewModel(onSuccessfulLogin: {
						viewModel.getSessionState()
					}))
				case .loggedIn:
					HomeView(viewModel: HomeViewModel(onLogout: {
						viewModel.getSessionState()
					}))
			}
		}
		.background { Color.anatomy.blue }
		.task {
			viewModel.getSessionState()
		}
		
	}
}

#Preview{
	RootView(viewModel: RootViewModel())
}
