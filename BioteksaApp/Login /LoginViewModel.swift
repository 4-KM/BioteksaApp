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
	@Dependency(\.userDefaults) var userDefaults
	
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
			let configuration = try await apiManager.fetch(GetConfiguration())
			try userDefaults.set(
				JSONEncoder().encode(configuration),
				forKey: LoginKeys.configuration
			)
			onSuccessfulLogin()
		} catch {
			print("error 🔴", error)
		}
	}
}


