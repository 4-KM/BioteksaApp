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
    mutating func neutralize(hco: Double) {
        
    }
    
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
    
    struct NecesarioCalculator: Hashable {
        var molecula: String
        var valueMole: Double = 1
        var isCorrect: Bool = true
    }
    
    @Published var aguaModel =  [
        
        NecesarioCalculator(molecula: "NO3", isCorrect: true),
        NecesarioCalculator(molecula: "H2PO4", isCorrect: false),
        NecesarioCalculator(molecula: "K+", isCorrect: true),
        NecesarioCalculator(molecula: "CA+2", isCorrect: true),
        NecesarioCalculator(molecula: "MG+2", isCorrect: true),
        NecesarioCalculator(molecula: "SO4-2", isCorrect: true),
        NecesarioCalculator(molecula: "HCO3", isCorrect: true),
        NecesarioCalculator(molecula: "CO3", isCorrect: true)
        
    ]
    
    @Published var miliEq =  [
        
        NecesarioCalculator(molecula: "NO3",isCorrect: true),
        NecesarioCalculator(molecula: "H2PO4",isCorrect: true),
        NecesarioCalculator(molecula: "K+",isCorrect: true),
        NecesarioCalculator(molecula: "CA+2",isCorrect: true),
        NecesarioCalculator(molecula: "MG+2",isCorrect: true),
        NecesarioCalculator(molecula: "SO4-2",isCorrect: true),

        
    ]
    @Published var necessaryModel: [NecesarioCalculator] = [
        
        NecesarioCalculator(molecula: "NO3", isCorrect: true),
        NecesarioCalculator(molecula: "H2PO4", isCorrect: true),
        NecesarioCalculator(molecula: "K+", isCorrect: true),
        NecesarioCalculator(molecula: "CA+2", isCorrect: true),
        NecesarioCalculator(molecula: "MG+2", isCorrect: true),
        NecesarioCalculator(molecula: "SO4-2", isCorrect: true)
        
    ]
    
    @Published var isReadyToEvaluate = false
    @Published var showBtnSolucionMadre = false
    @Published var  showNutrientsViews = false
    @Published var showSolucionMadre = false
    @Published var HCO3ToNeutralize = 0.0

    override func load() async {
        sulfurico = AcidoModel(productComparison: dataManager.sulfurico)
        nitrico = AcidoModel(productComparison: dataManager.nitrico)
        fosforico = AcidoModel(productComparison: dataManager.fosforico)
        activeView = .content
    }
    
    func operationHML(pesoEspe: String, densidad: String, riqueza: String) -> Double {
        let result = HCO3ToNeutralize * (Double(pesoEspe) ?? 0.0)
        let result1  = result  * 1 / (Double(densidad) ?? 0.0)
        let result2 = result1 * 100 / (Double(riqueza) ?? 0.0) * 0.001
        
        return result2
    }
    
    func calculator()  {
        var index = 0
        var hasError: Bool = false
        guard isReadyToEvaluate else { return }
        showBtnSolucionMadre = true
        aguaModel.forEach { molecula in
            if molecula.valueMole == 0  {
               // print("agregar valor a \(molecula.molecula)")
                aguaModel[index].isCorrect = false
                hasError = true
            } else {
                aguaModel[index].isCorrect = true
            }
            index += 1
          //  print("Termino el proceso 1")
            
        }
        index = 0
        miliEq.forEach { molecula in
            if molecula.valueMole == 0  {
              //  print("agregar valor a \(molecula.molecula)")
                miliEq[index].isCorrect = false
                hasError = true
            } else {
                miliEq[index].isCorrect = true
            }
            index += 1
           // print("Termino el proceso 2")
            
        }
        let valueHCO3 = aguaModel[6].valueMole
        let valueCo3 = aguaModel[7].valueMole
        var result = ((valueHCO3  ) + (valueCo3 * 2)) - 0.500
        
        if result < 0.500 {
            result =  0.0
        }
        print("RESULTADO", result)
        HCO3ToNeutralize = result
        doOperationRequeriedToAcidos()
        
        if !hasError {
            showNutrientsViews = true
            showBtnSolucionMadre = true
        }
        getOperationNecessary()
    }
    
    func getOperationNecessary() {
        var index = 0
        var result = 0.0
        necessaryModel = miliEq.map({ necessaries in
            var necessaries = necessaries
            if index == 5 {
                HCO3ToNeutralize = HCO3ToNeutralize.rounded(toRounded: 3)
                result =  necessaries.valueMole - aguaModel[index].valueMole - HCO3ToNeutralize
            } else {
                result = necessaries.valueMole - aguaModel[index].valueMole
            }
            result = result.rounded(toRounded: 3)
            necessaries.valueMole = result
            index += 1
            return necessaries
        })
    }
    
    func doOperationRequeriedToAcidos()  {
//        get medNeutrailar to Acidos
        sulfurico.neutralize(hco: HCO3ToNeutralize)
        nitrico.neutralize(hco: HCO3ToNeutralize)
        fosforico.neutralize(hco: HCO3ToNeutralize)
        /*
//        get HMNOL too acidos
        sulfurico.bioteksa.HMNOL = String(format: "%.3f", operationHML(pesoEspe: sulfurico.bioteksa.pesoEspesifico, densidad: sulfurico.bioteksa.densidad, riqueza: sulfurico.bioteksa.densidad))
        sulfurico.otros.HMNOL = String(format: "%.3f", operationHML(pesoEspe: sulfurico.otros.pesoEspesifico, densidad: sulfurico.otros.densidad, riqueza: sulfurico.otros.densidad))

        nitrico.bioteksa.HMNOL = String(format: "%.3f", operationHML(pesoEspe: nitrico.bioteksa.pesoEspesifico, densidad: nitrico.bioteksa.densidad, riqueza: nitrico.bioteksa.densidad))
        nitrico.otros.HMNOL = String(format: "%.3f", operationHML(pesoEspe: nitrico.otros.pesoEspesifico, densidad: nitrico.otros.densidad, riqueza: nitrico.otros.densidad))
        
        fosforico.bioteksa.HMNOL = String(format: "%.3f", operationHML(pesoEspe: fosforico.bioteksa.pesoEspesifico, densidad: fosforico.bioteksa.densidad, riqueza: fosforico.bioteksa.densidad))
        fosforico.otros.HMNOL = String(format: "%.3f", operationHML(pesoEspe: fosforico.otros.pesoEspesifico, densidad: fosforico.otros.densidad, riqueza: fosforico.otros.densidad))
        
//     get HMNOL too acidos X 100
        sulfurico.bioteksa.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: sulfurico.bioteksa.pesoEspesifico, densidad: sulfurico.bioteksa.densidad, riqueza: sulfurico.bioteksa.densidad) * 100)
        sulfurico.otros.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: sulfurico.otros.pesoEspesifico, densidad: sulfurico.otros.densidad, riqueza: sulfurico.otros.densidad) * 100)

        nitrico.bioteksa.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: nitrico.bioteksa.pesoEspesifico, densidad: nitrico.bioteksa.densidad, riqueza: nitrico.bioteksa.densidad) * 100 )
        nitrico.otros.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: nitrico.otros.pesoEspesifico, densidad: nitrico.otros.densidad, riqueza: nitrico.otros.densidad) * 100 )
        
        fosforico.bioteksa.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: fosforico.bioteksa.pesoEspesifico, densidad: fosforico.bioteksa.densidad, riqueza: fosforico.bioteksa.densidad) * 100 )
        fosforico.otros.HMNOL100 = String(format: "%.3f", operationHML(pesoEspe: fosforico.otros.pesoEspesifico, densidad: fosforico.otros.densidad, riqueza: fosforico.otros.densidad) * 100)
         */
    }
}
