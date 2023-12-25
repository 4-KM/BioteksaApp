//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 29/10/23.
//

import Foundation
import Networking

public struct SetConfigurationParams: Codable {
    public typealias SetBioteksa = [String: [String: Double]]
    public typealias Convertion = [String: ConvertionNutrient]
    
    public struct ConvertionNutrient: Codable {
        var soluble: Double
        var bioteksa: Double
        
        public init(soluble: Double, bioteksa: Double) {
            self.soluble = soluble
            self.bioteksa = bioteksa
        }
    }

    public var bioteksa: SetBioteksa?
    public var convertion: Convertion?
    public var nitrico: ProductComparison?
    public var sulfurico: ProductComparison?
    public var fosforico: ProductComparison?
    
    public init(
        bioteksa: SetBioteksa? = nil,
        convertion: Convertion? = nil,
        nitrico: ProductComparison? = nil,
        sulfurico: ProductComparison? = nil,
        fosforico: ProductComparison? = nil
    ) {
        self.bioteksa = bioteksa
        self.convertion = convertion
        self.nitrico = nitrico
        self.sulfurico = sulfurico
        self.fosforico = fosforico
    }
}

public struct SetConfiguration: RestEndpoint {
    public struct Response: Codable {
        var success: Bool
    }
    
    public typealias ResponseType = Response
    
    public var path: String = "/calculator/configuration"
    public var method: RestMethod = .post
    public var bodyParams: SetConfigurationParams?

    public init(configuration: SetConfigurationParams) {
        self.bodyParams = configuration
    }
}



