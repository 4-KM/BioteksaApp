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
    
    @Published var response : [Bioteksa] = [Bioteksa(key: "1", value: [NutrientElement(nutrient_id: 1, quantity: "1.0"),NutrientElement(nutrient_id: 2, quantity: "2.0"),NutrientElement(nutrient_id: 3, quantity: "3.0"),NutrientElement(nutrient_id: 4, quantity: "3.0"),NutrientElement(nutrient_id: 5, quantity: "3.0"),NutrientElement(nutrient_id: 6, quantity: "3.0")])]
    
    init() {
        @Dependency(\.dataManager) var dataManager
        response = dataManager.bioteksa.map { (key: String, value: [Nutrient]) in
            Bioteksa(key: key, value: value.map({ nutrient in
                NutrientElement(nutrient_id: nutrient.nutrient_id, quantity: "\(nutrient.quantity)")
            }))
        }
    }
}
