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
    
    
    struct Acido {
        var bioteksa: AcidoInfo
        var otros: AcidoInfo
    }
    struct AcidoInfo {
        var pesoEspesifico: String
        var densidad: String
        var riqueza: String
        
        func getAcido(typeInfo: TypeInfo) -> String {
            switch typeInfo {
            case .PesoExpecifico:
                return pesoEspesifico
            case .Densidad:
                return densidad
            case .Riqueza:
                return riqueza
            default: 
                return ""
                break
            }
        }
    }
    
    var sulfurico: Acido!
    var nitrico: Acido!
    var fosforico: Acido!
    
    
    init() {
        
        @Dependency(\.userDefaults) var userDefaults
        
        if let configurationData = userDefaults.data(forKey: LoginKeys.configuration),
           let configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData)
 {
            var sulfuricoResponse = configuration.sulfurico
            sulfurico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: "\(sulfuricoResponse.peso_especifico.bioteksa)",
                        densidad: "\(sulfuricoResponse.densidad.bioteksa)",
                        riqueza: "\(sulfuricoResponse.riqueza.bioteksa)"),
                otros:
                    AcidoInfo(
                        pesoEspesifico: "\(sulfuricoResponse.peso_especifico.greenHow)",
                        densidad: "\(sulfuricoResponse.densidad.greenHow)",
                        riqueza: "\(sulfuricoResponse.riqueza.greenHow)"
                    )
            )
            
            var nitricoResponse = configuration.nitrico
            nitrico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: "\(nitricoResponse.peso_especifico.bioteksa)",
                        densidad: "\(nitricoResponse.densidad.bioteksa)",
                        riqueza: "\(nitricoResponse.riqueza.bioteksa)"),
                otros:
                    AcidoInfo(
                        pesoEspesifico: "\(nitricoResponse.peso_especifico.greenHow)",
                        densidad: "\(nitricoResponse.densidad.greenHow)",
                        riqueza: "\(nitricoResponse.riqueza.greenHow)"
                    )
            )
            
            var fosforicoResponse = configuration.fosforico
            fosforico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: "\(fosforicoResponse.peso_especifico.bioteksa)",
                        densidad: "\(fosforicoResponse.densidad.bioteksa)",
                        riqueza: "\(fosforicoResponse.riqueza.bioteksa)"),
                otros:
                    AcidoInfo(
                        pesoEspesifico: "\(fosforicoResponse.peso_especifico.greenHow)",
                        densidad: "\(fosforicoResponse.densidad.greenHow)",
                        riqueza: "\(fosforicoResponse.riqueza.greenHow)"
                    )
            )
            
        }
    }
    
    func tablasComparativas() {
        
        ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
        }
        
        
        
        ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
        }
    }
}


