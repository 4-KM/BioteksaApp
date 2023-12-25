//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 29/10/23.
//

import Foundation
import Networking

public struct Nutrient: Codable {
    public var nutrient_id: Int
    public var quantity: Double
    
    public init(nutrient_id: Int, quantity: Double) {
        self.nutrient_id = nutrient_id
        self.quantity = quantity
    }
}

public typealias Bioteksa = [String: [Nutrient]]

public struct ConvertionNutrient: Codable {
    public var id: Int
    public var nutrient_id: Int
    public var bioteksa: Double
    public var soluble: Double
    
    public init(id: Int, nutrient_id: Int, bioteksa: Double, soluble: Double) {
        self.id = id
        self.nutrient_id = nutrient_id
        self.bioteksa = bioteksa
        self.soluble = soluble
    }
}

public struct ProductComparison: Codable {
    public struct Comparison: Codable {
        public var bioteksa: Double
        public var greenHow: Double
        
        public init(bioteksa: Double, greenHow: Double) {
            self.bioteksa = bioteksa
            self.greenHow = greenHow
        }
    }
    
    public init(peso_especifico: Comparison, densidad: Comparison, riqueza: Comparison) {
        self.peso_especifico = peso_especifico
        self.densidad = densidad
        self.riqueza = riqueza
    }
    
    public var peso_especifico: Comparison
    public var densidad: Comparison
    public var riqueza: Comparison
}

public struct GetConfigurationResponse: Codable {
    public var bioteksa: Bioteksa
    public var convertion: [ConvertionNutrient]
    public var nitrico: ProductComparison
    public var sulfurico: ProductComparison
    public var fosforico: ProductComparison
    
    public init(bioteksa: Bioteksa, convertion: [ConvertionNutrient], nitrico: ProductComparison, sulfurico: ProductComparison, fosforico: ProductComparison) {
        self.bioteksa = bioteksa
        self.convertion = convertion
        self.nitrico = nitrico
        self.sulfurico = sulfurico
        self.fosforico = fosforico
    }
}

public struct GetConfiguration: RestEndpoint {
    public typealias ResponseType = GetConfigurationResponse
    
    public var path: String = "/calculator/configuration"
    public var method: RestMethod = .get
    
    public init() { }
}
