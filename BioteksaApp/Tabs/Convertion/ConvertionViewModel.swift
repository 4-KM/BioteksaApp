//
//  ConversionViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import BioteksaAPI
import Dependencies
import Foundation
import Dependencies
import BioteksaAPI
import SwiftUI

class ConvertionViewModel: ViewModel {
    
    @Dependency(\.apiManager) var apiManager

    @Published var convertion : [ConvertionNutrient] = []
    
    override func load() async {
        @Dependency(\.dataManager) var dataManager
        convertion = dataManager.convertion.map {
            respons in
            ConvertionNutrient(
                id: respons.id,
                nutrient_id: respons.nutrient_id,
                bioteksa: respons.bioteksa,
                soluble: respons.soluble
            )
        }
        activeView = .content
    }
    
    func update() async {
        let nutrients = convertion.reduce(into: [String: SetConfigurationParams.ConvertionNutrient]()) { (partialResult, element) in
            partialResult["\(element.nutrient_id)"] = SetConfigurationParams.ConvertionNutrient(soluble: element.soluble, bioteksa: element.bioteksa)
        }
        let config = SetConfigurationParams(convertion: nutrients)
		 await sendConfig(config: config)
    }
}
