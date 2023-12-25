//
//  VolumenDeriegoViewmodel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import Foundation
import Dependencies
import BioteksaAPI


class VolumenDeriegoViewmodel: ObservableObject {
    @Dependency(\.apiManager) var apiManager
    @Published var calculatorDic : [String:Double] = ["test":2.2]
    @Published var arrayCalculo: [VolumenDeRiegoModel] = productosVolumenRiengo
    @Published var m3Multiply: Double = 100.0
    var product:[CalculadoraViewModel.NecesarioCalculator]?
    
    
    init(products: [CalculadoraViewModel.NecesarioCalculator]? ) {
        guard let product = products else { return }
        self.product = product
        var index = 1
        self.product?.forEach { item in
            calculatorDic["\(index)"] = Double(item.valueMole)
            index += 1
        }
        
    }
    
    func calculatorM3() async  {
        do {
            let calculator = try await apiManager.fetch(Calculate(required: calculatorDic))
            DispatchQueue.main.async {
                self.multiplyForInput(response: calculator)

            }

        } catch {
            print("Error calculator" , error)
        }
    }
    
    func multiplyForInput(response: Calculate.CalculateResponse)  {
        var index = 1
        arrayCalculo.forEach { VolumenDeRiegoModel in
            arrayCalculo[index - 1].valueProduct = String(((response.recommended["\(index)"] ?? 0.0) * m3Multiply).rounded(toRounded: 3) )
            index += 1
        }
    }
}