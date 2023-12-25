//
//  LocalConfigurationManager.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 25/12/23.
//

import BioteksaAPI
import Dependencies
import Foundation

enum DataManagerKey: DependencyKey {
    static var liveValue: DataManager = DataManager()
    static var previewValue: DataManager = DataManager(
        bioteksa: [
            "1": [
                Nutrient(nutrient_id: 1, quantity: 23),
                Nutrient(nutrient_id: 2, quantity: 23),
                Nutrient(nutrient_id: 3, quantity: 23),
            ],
            "2": [
                Nutrient(nutrient_id: 4, quantity: 23),
                Nutrient(nutrient_id: 5, quantity: 23),
                Nutrient(nutrient_id: 6, quantity: 23),
            ]
        ],
        convertion: [
            BioteksaAPI.ConvertionNutrient(
                id: 1,
                nutrient_id: 1,
                bioteksa: 3,
                soluble: 3
            ),
            BioteksaAPI.ConvertionNutrient(
                id: 2,
                nutrient_id: 2,
                bioteksa: 3,
                soluble: 3
            )
        ],
        nitrico: ProductComparison(
            peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
        ),
        sulfurico: ProductComparison(
            peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
        ),
        fosforico: ProductComparison(
            peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
            riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
        )
    )
}

extension DependencyValues {
    var dataManager: DataManager {
        get { self[DataManagerKey.self] }
        set { self[DataManagerKey.self] = newValue }
    }
}

struct DataManager {
    public var bioteksa: BioteksaAPI.Bioteksa
    public var convertion: [BioteksaAPI.ConvertionNutrient]
    public var nitrico: ProductComparison
    public var sulfurico: ProductComparison
    public var fosforico: ProductComparison
    
    init(
        bioteksa: BioteksaAPI.Bioteksa,
        convertion: [BioteksaAPI.ConvertionNutrient],
        nitrico: ProductComparison,
        sulfurico: ProductComparison,
        fosforico: ProductComparison
    ) {
        self.bioteksa = bioteksa
        self.convertion = convertion
        self.nitrico = nitrico
        self.sulfurico = sulfurico
        self.fosforico = fosforico
    }
    
    init() {
        @Dependency(\.userDefaults) var userDefaults
        let configurationData = userDefaults.data(forKey: LoginKeys.configuration)!
        let configuration = try! JSONDecoder().decode(GetConfigurationResponse.self, from: configurationData)
        bioteksa = configuration.bioteksa
        convertion = configuration.convertion
        sulfurico = configuration.sulfurico
        nitrico = configuration.nitrico
        fosforico = configuration.fosforico
    }
}
