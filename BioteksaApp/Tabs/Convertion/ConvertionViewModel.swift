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

class ConvertionViewModel: ObservableObject {

    @Published var convertion : [ConvertionNutrient]
    
    init() {
        @Dependency(\.dataManager) var dataManager
        convertion = dataManager.convertion.map({ respons in
            ConvertionNutrient(id: respons.id, nutrient_id: respons.nutrient_id, bioteksa: "\(respons.bioteksa)", soluble: "\(respons.soluble)")
        })
    }
}

extension Double {
    func rounded(toRounded: Int) -> Double {
        let cocient = Self(Int( pow(10.0, Double(toRounded))))
        return (self * cocient).rounded() / cocient
    }
}
