//
//  AcidosViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//
import BioteksaAPI
import Dependencies
import Foundation
import SwiftUI

class AcidosViewModel: ObservableObject {
    @Dependency(\.apiManager) var apiManager

    @Published var sulfurico: AcidoModel!
    @Published var nitrico: AcidoModel!
    @Published var fosforico: AcidoModel!
    
    init() {
        @Dependency(\.dataManager) var dataManager
        sulfurico = AcidoModel(productComparison: dataManager.sulfurico)
        nitrico = AcidoModel(productComparison: dataManager.nitrico)
        fosforico = AcidoModel(productComparison: dataManager.fosforico)
    }
    
    func update() async {
        let sulfurico = ProductComparison(acido: sulfurico)
        let nitrico = ProductComparison(acido: nitrico)
        let fosforico = ProductComparison(acido: fosforico)
        
        let config = SetConfigurationParams(
            nitrico: nitrico,
            sulfurico: sulfurico,
            fosforico: fosforico
        )
        do {
            try await apiManager.fetch(SetConfiguration(configuration: config))
        } catch {
            
        }
    }
}
