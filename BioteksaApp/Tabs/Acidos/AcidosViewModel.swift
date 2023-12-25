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
    
    @Published var sulfurico: AcidoModel = AcidoModel(pesoEspecifico: AcidoInfo(bioteksa: "0", otros: "0"), densidad: AcidoInfo(bioteksa: "0", otros: "0"), riqueza: AcidoInfo(bioteksa: "0", otros: "0"))
    @Published var nitrico: AcidoModel = AcidoModel(pesoEspecifico: AcidoInfo(bioteksa: "0", otros: "0"), densidad: AcidoInfo(bioteksa: "0", otros: "0"), riqueza: AcidoInfo(bioteksa: "0", otros: "0"))
    @Published var fosforico: AcidoModel = AcidoModel(pesoEspecifico: AcidoInfo(bioteksa: "0", otros: "0"), densidad: AcidoInfo(bioteksa: "0", otros: "0"), riqueza: AcidoInfo(bioteksa: "0", otros: "0"))
    
    init() {
        guard let configuration = GetConfigurationResponse.fetchLocalConfiguration() else { return }
        let sulfuricoResponse = configuration.sulfurico
        sulfurico = AcidoModel(
            pesoEspecifico: AcidoInfo(bioteksa: String(sulfuricoResponse.peso_especifico.bioteksa), otros: String(sulfuricoResponse.peso_especifico.greenHow)),
            densidad: AcidoInfo(bioteksa: String(sulfuricoResponse.densidad.bioteksa), otros: String(sulfuricoResponse.densidad.greenHow)),
            riqueza: AcidoInfo(bioteksa: String(sulfuricoResponse.riqueza.bioteksa), otros: String(sulfuricoResponse.riqueza.greenHow))
        )
        
        let nitricoResponse = configuration.nitrico
        nitrico = AcidoModel(
            pesoEspecifico: AcidoInfo(bioteksa: String(nitricoResponse.peso_especifico.bioteksa), otros: String(nitricoResponse.peso_especifico.greenHow)),
            densidad: AcidoInfo(bioteksa: String(nitricoResponse.densidad.bioteksa), otros: String(nitricoResponse.densidad.greenHow)),
            riqueza: AcidoInfo(bioteksa: String(nitricoResponse.riqueza.bioteksa), otros: String(nitricoResponse.riqueza.greenHow))
        )
        
        let fosforicoResponse = configuration.fosforico
        fosforico = AcidoModel(
            pesoEspecifico: AcidoInfo(bioteksa: String(fosforicoResponse.peso_especifico.bioteksa), otros: String(fosforicoResponse.peso_especifico.greenHow)),
            densidad: AcidoInfo(bioteksa: String(fosforicoResponse.densidad.bioteksa), otros: String(fosforicoResponse.densidad.greenHow)),
            riqueza: AcidoInfo(bioteksa: String(fosforicoResponse.riqueza.bioteksa), otros: String(fosforicoResponse.riqueza.greenHow))
        )
    }
}


