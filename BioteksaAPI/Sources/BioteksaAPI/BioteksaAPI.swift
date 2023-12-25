//  BioteksaAPI.swift
//  NetworkingDemo
//
//  Created by Mauricio Ventura on 01/10/23.
//

import Foundation
import Dependencies
import Networking

// MARK: - PharmacyRepository

public enum BioteksaServer {
    static let test = "https://phplaravel-1083716-3910861.cloudwaysapps.com/api"
    static let prod = "https://bioteksa.anuncia.space/api"
    static let mock = "https://phplaravel-1083716-3910861.cloudwaysapps.com/api"
}

private class BioteksaAuthProvider: AuthenticationProvider {
    
    enum TokenStorageKey: String, StorageKey {
        case token
        case rol
    }
    
    @Dependency(\.userDefaults) var userDefaults
    
    var token: String? {
        get {
            guard let token = userDefaults.value(forKey: TokenStorageKey.token) as? String else { return nil }
            return "Bearer " + token
        }
        set {
            userDefaults.set(newValue, forKey: TokenStorageKey.token)
        }
    }
    
    var rol: Int? {
        get {
            userDefaults.value(forKey: TokenStorageKey.rol) as? Int
        }
        set {
            userDefaults.set(newValue, forKey: TokenStorageKey.rol)
        }
    }
}

public protocol BioteksaAPIManager: APIManager {
	var isLogged: Bool { get }
    func login(email: String, password: String) async throws
    func logout() async throws
}

public class LiveBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider? = BioteksaAuthProvider()
    public var domain: String = BioteksaServer.test
    
	public var isLogged: Bool {
		authProvider?.token != nil
	}
    
    public func login(email: String, password: String) async throws {
        let response = try await fetch(Login(email: email, password: password))
        authProvider?.token = response.token
        authProvider?.rol = response.user.rol
    }
    
    public func logout() async throws {
        authProvider?.token = nil
    }
}

public class TestBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider?
    
    public var domain: String = BioteksaServer.test
	public var isLogged: Bool = false
    public func login(email: String, password: String) async throws {
        
    }
    
    public func logout() async throws {
        authProvider?.token = nil
    }
}

public class MockBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider?
    public var domain: String = BioteksaServer.mock
	public var isLogged: Bool = true
	
    public func login(email: String, password: String) async throws {
        
    }
    
    public func logout() async throws {
        authProvider?.token = nil
    }
}
