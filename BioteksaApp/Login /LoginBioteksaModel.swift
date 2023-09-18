//
//  LoginModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let data: LoginResponseData
}


struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
