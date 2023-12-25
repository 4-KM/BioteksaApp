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

class NutrientesViewModel: ObservableObject {
    @Dependency(\.apiManager) var apiManager

    @Published var response : [Bioteksa]
    
    init() {
        @Dependency(\.dataManager) var dataManager
        response = dataManager.bioteksa.map { (key: String, value: [Nutrient]) in
            Bioteksa(key: key, value: value.map({ nutrient in
                NutrientElement(nutrient_id: nutrient.nutrient_id, quantity: nutrient.quantity)
            }))
        }
    }
    
    func update() async {
        var nutrients = response.reduce(into: [String: [String: Double]]()) { bioteksaNutrient, bioteksa in
            bioteksaNutrient[bioteksa.key] = bioteksa.value.reduce(into: [String: Double]()) { (partialResult, element) in
                partialResult["\(element.nutrient_id)"] = element.quantity
            }
        }
        let config = SetConfigurationParams(bioteksa: nutrients)
        do {
            try await apiManager.fetch(SetConfiguration(configuration: config))
        } catch {
            
        }
    }
}
