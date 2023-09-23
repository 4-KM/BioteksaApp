//
//  AcidosModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import Foundation
import SwiftUI






struct AcidosSolucionesMeqANeutralizar {
    let descripcion: String // caracteristicas
    //let textField: TextField<Label: View>

}

let acidos =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "PesoExpecifico"),
    AcidosSolucionesMeqANeutralizar(descripcion: "Densidad"),
    AcidosSolucionesMeqANeutralizar(descripcion: "Riqueza")
]

let meq =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "Meq a Neutralizar")
]

let cantidad =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3ml/L"),
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3mLTS/100M3")
]
