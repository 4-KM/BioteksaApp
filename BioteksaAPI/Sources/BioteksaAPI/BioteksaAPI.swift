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
    static let test = "https://bioteksa.anuncia.space/api"
    static let prod = "https://phplaravel-1083716-3910861.cloudwaysapps.com/api"
    static let mock = "https://phplaravel-1083716-3910861.cloudwaysapps.com/api"
}

private class BioteksaAuthProvider: AuthenticationProvider {
    
    enum TokenStorageKey: String, StorageKey {
        case token
    }
    
    @Dependency(\.userDefaults) var userDefaults
    
    var token: String? {
        get {
            "Bearer " + (userDefaults.value(forKey: TokenStorageKey.token) as? String ?? "")
        }
        set {
            userDefaults.set(newValue, forKey: TokenStorageKey.token)
        }
    }
    
}

public protocol BioteksaAPIManager: APIManager {
	var isLogged: Bool { get }
    func login(email: String, password: String) async throws
}

public class LiveBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider? = BioteksaAuthProvider()
    public var domain: String = BioteksaServer.prod
	public var isLogged: Bool {
		authProvider?.token != nil
	}
    public func login(email: String, password: String) async throws {
        let response = try await fetch(Login(email: email, password: password))
        authProvider?.token = response.token
    }
}

public class TestBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider?
    
    public var domain: String = BioteksaServer.test
	public var isLogged: Bool = false
    public func login(email: String, password: String) async throws {
        
    }
}

public class MockBioteksaAPI: BioteksaAPIManager {
    public var authProvider: AuthenticationProvider?
    public var domain: String = BioteksaServer.mock
	public var isLogged: Bool = true
	
    public func login(email: String, password: String) async throws {
        
    }
}
