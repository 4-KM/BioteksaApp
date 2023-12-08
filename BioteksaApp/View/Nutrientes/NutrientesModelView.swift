//
//  NewModelView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 25/09/23.
//

import Foundation
import Dependencies
import BioteksaAPI



class NutrientesModelView: ObservableObject {
    
     var nutrientsModel: [String:[LTNutrientModel]] = [:]
    
    
    struct LTNutrientModel {
        var nutrient_id: Int
        var quantity: Double?
        
        init(nutrient_id: Int, quantity: Double) {
            self.nutrient_id = nutrient_id
            self.quantity = quantity
        }
    }
    
    init() {
        @Dependency(\.userDefaults) var userDefaults

        if let configurationData = userDefaults.data(forKey: LoginKeys.configuration),
           let configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData) {
            for (keyNutrient, convertionValue) in configuration.bioteksa {
                print("pasamos a modificarlo:::", keyNutrient)
                self.nutrientsModel[keyNutrient] = convertionValue.compactMap {
                    LTNutrientModel(nutrient_id:  $0.nutrient_id, quantity: $0.quantity.rounded(toRounded: 3))
                }
            }
        }
    }
}
