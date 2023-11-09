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

class CalculadoraViewModel {
    struct Acido {
        var bioteksa: AcidoInfo
        var otros: AcidoInfo
    }
    struct AcidoInfo {
        var pesoEspesifico: String
        var densidad: String
        var riqueza: String
        var neutralizar: String
        var HMNO3ml: String
        var HMNO3mLTS: String
    }
    
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
}
