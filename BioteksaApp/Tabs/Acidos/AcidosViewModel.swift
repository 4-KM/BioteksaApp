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

class AcidosViewModel: ViewModel {
    typealias AcidosTuple = (sulfurico: AcidoModel, nitrico: AcidoModel, fosforico: AcidoModel)
    
	@Dependency(\.dataManager) var dataManager

    @Published var acidosTuple: AcidosTuple!
    
	override func load() async {
        acidosTuple = (
            AcidoModel(productComparison: dataManager.sulfurico),
            AcidoModel(productComparison: dataManager.nitrico),
            AcidoModel(productComparison: dataManager.fosforico)
        )
        activeView = .content
    }
    
    func update() async {
        let sulfurico = ProductComparison(acido: acidosTuple.sulfurico)
        let nitrico = ProductComparison(acido: acidosTuple.nitrico)
        let fosforico = ProductComparison(acido: acidosTuple.fosforico)
        let config = SetConfigurationParams(
            nitrico: nitrico,
            sulfurico: sulfurico,
            fosforico: fosforico
        )
        await sendConfig(config: config)
    }
}
