//
//  VolumenDeriegoModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import Foundation


struct VolumenDeRiegoModel: Hashable {
    let nombre: TypeProduct
    var valueProduct: String = ""
    var idVolumen: String = ""
}

// CHECAR SI TIENE ERROR DE CONTINUIDAD CON LOS ELEMENTOS

let productos =  [
    
    VolumenDeRiegoModel(nombre: TypeProduct.HBKPlus),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAN),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAP),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAK),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRACA),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAMG),
    VolumenDeRiegoModel(nombre: TypeProduct.HYPERMN)
    
]

let productosVolumenRiengo =  [
    
    VolumenDeRiegoModel(nombre: TypeProduct.HBKPlus, idVolumen: ""),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAN),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAP),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAK),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRACA),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAMG),
    VolumenDeRiegoModel(nombre: TypeProduct.HYPERMN),
    VolumenDeRiegoModel(nombre: TypeProduct.HYPERZN),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAFE),
    VolumenDeRiegoModel(nombre: TypeProduct.ULTRAS)
    
]
enum TypeProduct: String, CaseIterable {
    case HBKPlus = "HBK Plus"
    case ULTRAN = "ULTRA N"
    case ULTRAP = "ULTRA P"
    case ULTRAK = "ULTRA K"
    case ULTRACA  = "ULTRA CA"
    case ULTRAMG = "ULTRA MG"
    case HYPERMN = "HYPER MN"
    case HYPERZN = "HYPER ZN"
    case ULTRAFE = "ULTRA FE"
    case ULTRAS = "ULTRA S"
}

