//
//  ComversiónViewModel.swift
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




class ComversionViewModel: ObservableObject {
    
    var NITROGENO: ConvertionModel?
    var FOSFORO: ConvertionModel?
    var POTASIO: ConvertionModel?
    var CALCIO: ConvertionModel?
    var MAGNECIO: ConvertionModel?
    var AZUFRE: ConvertionModel?

class ConversionViewModel: ObservableObject {
    
    @Published var convertion : [ConvertionNutrient] = [ConvertionNutrient(id: 1, nutrient_id: 1, bioteksa: "0.0", soluble: "0.0")]
    
    init() {
        
        @Dependency(\.userDefaults) var userDefaults
        
        if let configurationData = userDefaults.data(forKey: LoginKeys.configuration),
           let configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData)
        {
            let convertionResponse = configuration.convertion
            convertion = convertionResponse.map({ respons in
                ConvertionNutrient(id: respons.id, nutrient_id: respons.nutrient_id, bioteksa: "\(respons.bioteksa)", soluble: "\(respons.soluble)")
            })
        }
    }
    
    
    
}


extension Double {
    func rounded(toRounded: Int) -> Double {
        let cocient = Self(Int( pow(10.0, Double(toRounded))))
        return (self * cocient).rounded() / cocient
    }
    
}
