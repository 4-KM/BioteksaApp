//
//  RootViewModel.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//

import Dependencies
import Foundation

@MainActor 
class RootViewModel: ObservableObject {
	enum ActiveView {
        case splash
		case login
		case loggedIn
	}
	
	@Dependency(\.apiManager) var apiManager

	@Published var activeView: ActiveView = .splash
	
	func getSessionState() {
		if apiManager.isLogged {
			activeView = .loggedIn
		} else {
			activeView = .login
		}
	}
}
