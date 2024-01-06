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

class NutrientesViewModel: ViewModel {
    @Dependency(\.apiManager) var apiManager
    @Dependency(\.dataManager) var dataManager

    @Published var response : [Bioteksa] = []
    
	override func load() async {
        response = dataManager.bioteksa.map { (key: String, value: [Nutrient]) in
            Bioteksa(key: key, value: value.map({ nutrient in
                NutrientElement(nutrient_id: nutrient.nutrient_id, quantity: nutrient.quantity)
            }))
        }
        activeView = .content
    }
    
    func update() async {
        let nutrients = response.reduce(into: [String: [String: Double]]()) { bioteksaNutrient, bioteksa in
            bioteksaNutrient[bioteksa.key] = bioteksa.value.reduce(into: [String: Double]()) { (partialResult, element) in
                partialResult["\(element.nutrient_id)"] = element.quantity
            }
        }
        let config = SetConfigurationParams(bioteksa: nutrients)
		 await sendConfig(config: config)
    }
}
