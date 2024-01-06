//
//  VolumenDeriegoViewmodel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import Foundation
import Dependencies
import BioteksaAPI

class VolumenDeriegoViewmodel: ViewModel {
    @Dependency(\.apiManager) var apiManager
    
    @Published var calculatorDic : [String:Double] = [:]
    @Published var m3Multiply: Double = 100.0
    @Published var products = ProductSet()

    var calculatedSet: ElementSet
    var solucionMadre: [String: Double] = [:]
    
    init(calculatedSet: ElementSet) {
        self.calculatedSet = calculatedSet
    }
    
    override func load() async {
        isLoading = true
        defer { isLoading = false }
        activeView = .content
        do {
            Element.allCases.forEach {
                calculatorDic[$0.id] = calculatedSet[$0].value
            }
            solucionMadre = try await apiManager.fetch(Calculate(required: calculatorDic)).recommended
            print(solucionMadre)
            self.multiplyForInput()
        } catch {
            print("Error calculator" , error)
        }
    }
    
    func multiplyForInput()  {
        products.hbk.value = solucionMadre["1", default: 0.0] * m3Multiply
        products.utraN.value = solucionMadre["2", default: 0.0] * m3Multiply
        products.ultraP.value = solucionMadre["3", default: 0.0] * m3Multiply
        products.utraK.value = solucionMadre["4", default: 0.0] * m3Multiply
        products.ultraCA.value = solucionMadre["5", default: 0.0] * m3Multiply
        products.ultraMG.value = solucionMadre["6", default: 0.0] * m3Multiply
        products.hyperMn.value = solucionMadre["7", default: 0.0] * m3Multiply
        products.hyperZN.value = solucionMadre["8", default: 0.0] * m3Multiply
        products.ultraFe.value = solucionMadre["9", default: 0.0] * m3Multiply
        products.ultraS.value = solucionMadre["10", default: 0.0] * m3Multiply
    }
}
