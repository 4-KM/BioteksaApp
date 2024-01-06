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

extension AcidoModel {
    func comparison(index: Int) -> AcidoInfo {
        switch index {
        case 1:
            return meqNeutrailar
        case 2:
            return pesoEspecifico
        case 3:
            return densidad
        case 4:
            return riqueza
        case 5:
            return HMNOL
        case 6:
            return AcidoInfo(bioteksa: HMNOL.bioteksa * 100, otros: HMNOL.otros * 100)
        default:
            return AcidoInfo(bioteksa: 0, otros: 0)
        }
    }
}

struct ElementValue {
    let element: Element
    var value: Double = 0
}

struct ElementSet {
    enum Set: String {
        case water = "Agua"
        case required = "Meq requeridos por el cultivo"
        case needed = "Necesario"
        case tmpAcids = "Acids"
    }
    
    let set: Set
    var nitrogeno = ElementValue(element: .nitrogeno)
    var fosforo = ElementValue(element: .fosforo)
    var potasio = ElementValue(element: .potasio)
    var calcio = ElementValue(element: .calcio)
    var magnesio = ElementValue(element: .magnesio)
    var asufre = ElementValue(element: .asufre)
    var bicarbonato = ElementValue(element: .bicarbonato)
    var carbonato = ElementValue(element: .carbonato)
    
    subscript(element: Element) -> ElementValue {
        get {
            switch element {
            case .nitrogeno:
                return nitrogeno
            case .fosforo:
                return fosforo
            case .potasio:
                return potasio
            case .calcio:
                return calcio
            case .magnesio:
                return magnesio
            case .asufre:
                return asufre
            case .bicarbonato:
                return bicarbonato
            case .carbonato:
                return carbonato
            }
        }
        
        set {
            switch element {
            case .nitrogeno:
                nitrogeno.value = newValue.value
            case .fosforo:
                fosforo.value = newValue.value
            case .potasio:
                potasio.value = newValue.value
            case .calcio:
                calcio.value = newValue.value
            case .magnesio:
                magnesio.value = newValue.value
            case .asufre:
                asufre.value = newValue.value
            case .bicarbonato:
                bicarbonato.value = newValue.value
            case .carbonato:
                carbonato.value = newValue.value
            }
        }
    }
    
    static func acidosTemp(water: ElementSet, required: ElementSet) -> (ElementSet, Double) {
        var set = ElementSet(set: .tmpAcids)
        let burn = water.bicarbonato.value + (water.carbonato.value * 2)
        set.bicarbonato.value = burn - 0.5
        let neededBicarbonato = burn - set.bicarbonato.value

        set.asufre.value = water.bicarbonato.value - neededBicarbonato
        
        return (set, neededBicarbonato)
    }
}

struct ProductValue {
    let product: Product
    var value: Double = 0
}

struct ProductSet {
    var hbk = ProductValue(product: .hbk)
    var utraN = ProductValue(product: .utraN)
    var ultraP = ProductValue(product: .ultraP)
    var utraK = ProductValue(product: .utraK)
    var ultraCA = ProductValue(product: .ultraCA)
    var ultraMG = ProductValue(product: .ultraMG)
    var ultraS = ProductValue(product: .ultraS)
    var ultraFe = ProductValue(product: .ultraFe)
    var hyperZN = ProductValue(product: .hyperZN)
    var hyperMn = ProductValue(product: .hyperMn)

    subscript(product: Product) -> ProductValue {
        get {
            switch product {
            case .hbk:
                return hbk
            case .utraN:
                return utraN
            case .ultraP:
                return ultraP
            case .utraK:
                return utraK
            case .ultraCA:
                return ultraCA
            case .ultraMG:
                return ultraMG
            case .ultraS:
                return ultraS
            case .ultraFe:
                return ultraFe
            case .hyperZN:
                return hyperZN
            case .hyperMn:
                return hyperMn
            }
        }
        
        set {
            switch product {
            case .hbk:
                hbk = newValue
            case .utraN:
                utraN = newValue
            case .ultraP:
                ultraP = newValue
            case .utraK:
                utraK = newValue
            case .ultraCA:
                ultraCA = newValue
            case .ultraMG:
                ultraMG = newValue
            case .ultraS:
                ultraS = newValue
            case .ultraFe:
                ultraFe = newValue
            case .hyperZN:
                hyperZN = newValue
            case .hyperMn:
                hyperMn = newValue
            }
        }
    }
}

class CalculadoraViewModel: ViewModel {
    enum AcidoType: String, CaseIterable, Identifiable {
        case sulfurico = "Sulfurico"
        case nitrico = "Nitrico"
        case fosforico = "Fosforico"
        
        var id: String { self.rawValue }
    }
    
    @Dependency(\.dataManager) var dataManager
    
    @Published var sulfurico: AcidoModel!
    @Published var nitrico: AcidoModel!
    @Published var fosforico: AcidoModel!
    
    @Published var selectedAcid: Int = 1
    @Published var acidoType: AcidoType = .sulfurico
    
    @Published var waterSet: ElementSet = ElementSet(set: .water)
    @Published var requiredSet: ElementSet = ElementSet(set: .required)
    @Published var calculatedSet: ElementSet = ElementSet(set: .needed)
    var acidsSet: ElementSet = ElementSet(set: .tmpAcids)
   
    @Published var productSet: ProductSet = ProductSet()

    @Published var showNutrientsViews = false
    @Published var showSolucionMadre = false

    override func load() async {
        sulfurico = AcidoModel(productComparison: dataManager.sulfurico)
        nitrico = AcidoModel(productComparison: dataManager.nitrico)
        fosforico = AcidoModel(productComparison: dataManager.fosforico)
        activeView = .content
    }
    
    func calculate()  {
        var neededBicarbonato = 0.0
        (acidsSet, neededBicarbonato) = ElementSet.acidosTemp(water: waterSet, required: requiredSet)
        Element.allCases.forEach {
            calculatedSet[$0].value = max(0, requiredSet[$0].value - acidsSet[$0].value - waterSet[$0].value)
        }
        calculatedSet[.bicarbonato].value = neededBicarbonato
        
        let meqNeutralizar = acidsSet.bicarbonato.value
        
        sulfurico.updateMeq(meqNeutralizar: meqNeutralizar)
        nitrico.updateMeq(meqNeutralizar: meqNeutralizar)
        fosforico.updateMeq(meqNeutralizar: meqNeutralizar)
        showNutrientsViews = true
        
        
        
    }
    
    func calculateSolucionMadre() {
        
    }
}
