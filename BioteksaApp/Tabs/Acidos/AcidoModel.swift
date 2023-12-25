//
//  AcidosModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import Foundation
import SwiftUI


struct AcidoModel {
    var pesoEspecifico: AcidoInfo
    var densidad: AcidoInfo
    var riqueza: AcidoInfo
}

struct AcidoInfo {
    var bioteksa: String
    var otros: String
}

enum Acidos{
    case AcidoSulfurico
    case AcidoNitrico
    case AcidoFosforico
}
