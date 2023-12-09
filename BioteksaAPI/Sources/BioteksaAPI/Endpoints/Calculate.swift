//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 29/10/23.
//

import Foundation
import Networking

public struct Calculate: RestEndpoint {
    public struct CalculateParams: Codable {
        var required: [String: Double]
    }
    
    public struct CalculateResponse: Codable {
       public var recommended: [String: Double]
    }
    
    public typealias ResponseType = CalculateResponse
    
    public var path: String = "/calculator/calculate"
    public var method: RestMethod = .post
    public var bodyParams: CalculateParams?
    
    public init(required: [String: Double]) {
        bodyParams = CalculateParams(required: required)
    }
}
