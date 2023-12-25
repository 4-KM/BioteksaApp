//
//  AcidosModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import BioteksaAPI
import Foundation
import SwiftUI


struct AcidoModel {
    var pesoEspecifico: AcidoInfo
    var densidad: AcidoInfo
    var riqueza: AcidoInfo
    
    init(pesoEspecifico: AcidoInfo, densidad: AcidoInfo, riqueza: AcidoInfo) {
        self.pesoEspecifico = pesoEspecifico
        self.densidad = densidad
        self.riqueza = riqueza
    }
    
    init(productComparison: ProductComparison) {
        pesoEspecifico = AcidoInfo(bioteksa: productComparison.peso_especifico.bioteksa, otros: productComparison.peso_especifico.greenHow)
        densidad = AcidoInfo(bioteksa: productComparison.densidad.bioteksa, otros: productComparison.densidad.greenHow)
        riqueza = AcidoInfo(bioteksa: productComparison.riqueza.bioteksa, otros: productComparison.riqueza.greenHow)
    }
    
}

struct AcidoInfo {
    var bioteksa: Double
    var otros: Double
}

enum Acidos{
    case AcidoSulfurico
    case AcidoNitrico
    case AcidoFosforico
}

extension ProductComparison {
    init(acido: AcidoModel) {
        self.init(
            peso_especifico: Comparison(bioteksa: acido.pesoEspecifico.bioteksa, greenHow: acido.pesoEspecifico.otros),
            densidad: Comparison(bioteksa: acido.densidad.bioteksa, greenHow: acido.densidad.otros),
            riqueza: Comparison(bioteksa: acido.riqueza.bioteksa, greenHow: acido.riqueza.otros)
        )
    }
}
