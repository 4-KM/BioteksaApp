//
//  ContentView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct LoginTestView: View {
	@ObservedObject var viewModel: LoginTestViewModel
	
	var body: some View {
		Text("Login")
		Button("Login") {
			Task {
				try await viewModel.login()
			}
		}
	}
}

class LoginTestViewModel: ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var isLoading: Bool = false
	
	var onSuccessfulLogin: () -> Void
	
	init(onSuccessfulLogin: @escaping () -> Void) {
		self.onSuccessfulLogin = onSuccessfulLogin
	}
	
	func login() async throws {
		UserDefaults.standard.setValue("token", forKey: "token")
		onSuccessfulLogin()
	}
}

struct HomeView: View {
	@ObservedObject var viewModel: HomeViewModel
	
	var body: some View {
		Text("Home")
		Button("Log out") {
			Task {
				try await viewModel.logout()
			}
		}
	}
}

class HomeViewModel: ObservableObject {
	var onLogout: () -> Void
	
	init(onLogout: @escaping () -> Void) {
		self.onLogout = onLogout
	}
	
	func logout() async throws {
		UserDefaults.standard.setValue(nil, forKey: "token")
		onLogout()
	}
}
