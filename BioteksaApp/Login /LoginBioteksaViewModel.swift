//
//  LoginBioteksaViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false

    
    func login() {
        LoginAction(
            parameters: LoginRequest(
                email: username,
                password: password
            )
        ).call { respuesta in
            print(respuesta)
        }
    }
}
