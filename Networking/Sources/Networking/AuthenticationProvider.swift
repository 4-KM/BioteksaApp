//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 02/10/23.
//

import Foundation

public protocol AuthenticationProvider {
    var token: String? { get set }
    
    // TODO: implement token refreshing
    // func refreshToken()
}

public struct Unauthenticated: AuthenticationProvider {
    public var token: String? = nil
    
    init() { }
}
