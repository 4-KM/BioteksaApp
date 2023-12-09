//
//  NewModelView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 25/09/23.
//

import BioteksaAPI
import Dependencies
import Foundation
import SwiftUI

class NutrientesModelView: ObservableObject {
    
    @Published var response : [Bioteksa] = [Bioteksa(key: "1", value: [NutrientElement(nutrient_id: 1, quantity: "0.0")])]
    
    init() {
        
        @Dependency(\.userDefaults) var userDefaults
        
        if let configurationData = userDefaults.data(forKey: LoginKeys.configuration),
           let configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData)
        {
            let responseBioteksa = configuration.bioteksa
            response = responseBioteksa.map { (key: String, value: [Nutrient]) in
                Bioteksa(key: key, value: value.map({ nutrient in
                    NutrientElement(nutrient_id: nutrient.nutrient_id, quantity: "\(nutrient.quantity)")
                }))
            }
        }
    }
    
}
