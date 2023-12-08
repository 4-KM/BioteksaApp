//
//  ComversiónViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

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

    var sustratos: [ConvertionModel] = []
    
    struct ConvertionModel {
        var id: Int?
        var nutrient_id: Int?
        var bioteksa: Double
        var soluble: Double
    }
    
    init() {
        @Dependency(\.userDefaults) var userDefaults

        if let configurationData = userDefaults.data(forKey: LoginKeys.configuration),
           let configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData) {
            for convertionValue in configuration.convertion {
                self.sustratos.append(ConvertionModel(id: convertionValue.id, nutrient_id: convertionValue.nutrient_id ,bioteksa: convertionValue.bioteksa.rounded(toRounded: 3), soluble: convertionValue.soluble.rounded(toRounded:  3)))
            }
            
            
        }
    }
    
    
    
}


extension Double {
    func rounded(toRounded: Int) -> Double {
        let cocient = Self(Int( pow(10.0, Double(toRounded))))
        return (self * cocient).rounded() / cocient
    }
}
