//
//  CalculadoraViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 08/11/23.
//

import BioteksaAPI
import Dependencies
import Foundation
import SwiftUI

class CalculadoraViewModel: ObservableObject {
    struct Acido {
        var bioteksa: AcidoInfo
        var otros: AcidoInfo
    }
    struct AcidoInfo {
        var pesoEspesifico: String
        var densidad: String
        var riqueza: String
        var medNeutrailar: String
        var HMNOL: String
        var HMNOL100 : String

        
        func getAcido(typeInfo: TypeInfo) -> String {
            switch typeInfo {
                
            case .PesoExpecifico:
                return pesoEspesifico
            case .Densidad:
                return densidad
            case .Riqueza:
                return riqueza
            case .MedNeutralizar:
                return medNeutrailar
            case .HMNOL:
                return HMNOL
            case .HMNOL100:
                return HMNOL100
            default : break
            }
        }
    }
    
    var sulfurico: Acido!
    var nitrico: Acido!
    var fosforico: Acido!
    
    struct MiliequivalentesRequeridos{
        var textField: MilequivalentesInfo
    }
    struct MilequivalentesInfo {
        var NO3: String
        var H2PO4: String
        var K: String
        var CA: String
        var MG: String
        var SO4: String
    }
    struct Neutralizar{}
    
    struct Necesario {
        let molecula: String
    }
    
    
    init() {
        @Dependency(\.userDefaults) var UserDefaults
        
        if var configurationData = UserDefaults.data(forKey: LoginKeys.configuration), 
            var configuration = try? JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData) {
            
            
            var sulfuricoResponse = configuration.sulfurico
            sulfurico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f", sulfuricoResponse.peso_especifico.bioteksa),
                        densidad: String(format:"%.3f", sulfuricoResponse.densidad.bioteksa),
                        riqueza: String(format:"%.3f",sulfuricoResponse.riqueza.bioteksa),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    ),
                otros:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f",sulfuricoResponse.peso_especifico.greenHow),
                        densidad: String(format:"%.3f",sulfuricoResponse.densidad.greenHow),
                        riqueza: String(format:"%.3f",sulfuricoResponse.riqueza.greenHow),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    )
            )
            
            var nitricoResponse = configuration.nitrico
            nitrico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f",nitricoResponse.peso_especifico.bioteksa),
                        densidad: String(format:"%.3f", nitricoResponse.densidad.bioteksa),
                        riqueza: String(format:"%.3f", nitricoResponse.riqueza.bioteksa),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    ),
                otros:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f", nitricoResponse.peso_especifico.greenHow),
                        densidad: String(format:"%.3f", nitricoResponse.densidad.greenHow),
                        riqueza: String(format:"%.3f", nitricoResponse.riqueza.greenHow),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    )
            )
            
            var fosforicoResponse = configuration.fosforico
            fosforico = Acido(
                bioteksa:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f", fosforicoResponse.peso_especifico.bioteksa),
                        densidad: String(format:"%.3f", fosforicoResponse.densidad.bioteksa),
                        riqueza: String(format:"%.3f", fosforicoResponse.riqueza.bioteksa),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    ),
                otros:
                    AcidoInfo(
                        pesoEspesifico: String(format:"%.3f", fosforicoResponse.peso_especifico.greenHow),
                        densidad: String(format:"%.3f", fosforicoResponse.densidad.greenHow),
                        riqueza: String(format:"%.3f", fosforicoResponse.riqueza.greenHow),
                        medNeutrailar: "",
                        HMNOL: "",
                        HMNOL100: ""
                    )
            )
            
            
            
        }
    }
}
