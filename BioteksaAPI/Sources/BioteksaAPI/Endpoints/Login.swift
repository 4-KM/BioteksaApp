//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 29/10/23.
//

import Foundation
import Networking
public struct Login: RestEndpoint {
    
    public struct LoginParams: Codable {
        var email: String
        var password: String
    }
    
    public struct User: Codable {
        var rol: Int
    }
    
    public struct LoginResponse: Codable {
        public var success: Bool
        public var user: User
        public var token: String?
        public var error: [String]?
    }
    
    public typealias ResponseType = LoginResponse
    
    public var path: String = "/auth/login"
    public var method: RestMethod = .post
    public var queryParams: QueryParams?
    public var bodyParams: LoginParams?
    
    public init(email: String, password: String) {
        bodyParams = LoginParams(email: email, password: password)
    }
}
