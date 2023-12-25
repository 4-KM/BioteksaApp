//
//  AcidosModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import Foundation
import SwiftUI






struct AcidosSolucionesMeqANeutralizar: Hashable {
    let descripcion: String // caracteristicas
    let typeAcido: TypeInfo?
    //let textField: TextField<Label: View>

}

let acidos =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "PesoExpecifico", typeAcido: .PesoExpecifico),
    AcidosSolucionesMeqANeutralizar(descripcion: "Densidad          ",typeAcido: .Densidad),
    AcidosSolucionesMeqANeutralizar(descripcion: "Riqueza             ",typeAcido: .Riqueza)
]

let meq =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "Meq a Neutralizar" , typeAcido: .MedNeutralizar)
]

let cantidad =  [
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3ml/L        ", typeAcido: .HMNOL),
    AcidosSolucionesMeqANeutralizar(descripcion: "HMNO3mLTS/100M3  " ,typeAcido:  .HMNOL100)
]

enum TypeInfo: String {
    case PesoExpecifico
    case Densidad
    case Riqueza
    case MedNeutralizar
    case HMNOL
    case HMNOL100
}
