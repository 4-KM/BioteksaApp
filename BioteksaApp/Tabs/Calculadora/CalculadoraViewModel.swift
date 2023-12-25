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
            }
        }
    }
    
    @Published var sulfurico: Acido!
    @Published var nitrico: Acido!
    @Published  var fosforico: Acido!
    @Published var selectedAcid: Int = 0

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
        var valueMole: Double = 0.0
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
    @Published var HCO3ToNeutralize = 0.0

    
    
    init() {
        @Dependency(\.dataManager) var dataManager

        let sulfuricoResponse = dataManager.sulfurico
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
        
        let nitricoResponse = dataManager.nitrico
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
        
        let fosforicoResponse = dataManager.fosforico
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
        sulfurico.bioteksa.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        sulfurico.otros.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        nitrico.bioteksa.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        nitrico.otros.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        fosforico.bioteksa.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        fosforico.otros.medNeutrailar = String(format:"%.3f", HCO3ToNeutralize)
        
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
    }
}
