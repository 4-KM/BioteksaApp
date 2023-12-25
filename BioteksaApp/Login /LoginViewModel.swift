//
//  LoginBioteksaViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import BioteksaAPI
import Dependencies
import SwiftUI

enum LoginKeys: String, StorageKey {
	case configuration
}

@MainActor
class LoginViewModel: ObservableObject {
	
	@Dependency(\.apiManager) var apiManager
	
	var onSuccessfulLogin: () -> Void
    
	@Published var isLogged = true
	@Published var username: String = ""
	@Published var password: String = ""
	@Published var showPassword: Bool = false
	
	init(onSuccessfulLogin: @escaping() -> Void) {
		self.onSuccessfulLogin = onSuccessfulLogin
	}
	
	func login() async {
		do {
			try await apiManager.login(email: username, password: password)
			onSuccessfulLogin()
		} catch {
			print("error 🔴", error)
		}
	}
}


