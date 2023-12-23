//
//  RootViewModel.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//

import Foundation

class RootViewModel: ObservableObject {
	enum ActiveView {
		case login
		case loggedIn
	}
	
	@Published var activeView: ActiveView = .login
	
	func getSessionState() {
		if let token = UserDefaults.standard.string(forKey: "token") {
			activeView = .loggedIn
		} else {
			activeView = .login
		}
	}
}
