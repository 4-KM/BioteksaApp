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
					LoginView(
						viewModel: LoginViewModel {
							viewModel.getSessionState()
						}
					)
				case .loggedIn:
					TabBarBioteksa()
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


