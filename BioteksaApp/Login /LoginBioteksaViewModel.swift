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
    case authenticated
    case configuration
}

@MainActor
class LoginViewModel: ObservableObject {
    
    @Dependency(\.apiManager) var apiManager
    @Dependency(\.userDefaults) var userDefaults
    
    @Published var isLogged = true
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    init() {
        isLogged = userDefaults.value(forKey: LoginKeys.authenticated) as? Bool ?? false
    }
    
    func login() async {
        
        do {
            print("Entro a la app0 🟢")
            try await apiManager.login(email: username, password: password)
            userDefaults.set(true, forKey: LoginKeys.authenticated)
            print("Entro a la app1 🟢")
            let configuration = try await apiManager.fetch(GetConfiguration())
            print("Entro a la app1.5 🟢")
            try userDefaults.set(
                JSONEncoder().encode(configuration),
                forKey: LoginKeys.configuration
            )
            print("Entro a la app2 🟢")
            let configurationData = userDefaults.data(forKey: LoginKeys.configuration)
            print("Entro a la app 🟢")
            let configuration2 = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData!)
            isLogged = true
        } catch {
            print("error 🔴", error)
        }
    }
}

