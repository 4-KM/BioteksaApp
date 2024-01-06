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
    static var liveValue: DataManager = LiveDataManager()
    static var previewValue: DataManager = MockDataManager()
	/*(
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
	 */
}

extension DependencyValues {
    var dataManager: DataManager {
        get { self[DataManagerKey.self] }
        set { self[DataManagerKey.self] = newValue }
    }
}

protocol DataManager {
	var bioteksa: BioteksaAPI.Bioteksa { get set }
	var convertion: [BioteksaAPI.ConvertionNutrient] { get set }
	var nitrico: ProductComparison { get set }
	var sulfurico: ProductComparison { get set }
	var fosforico: ProductComparison { get set }
}

struct LiveDataManager: DataManager {
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

struct MockDataManager: DataManager {
	public var bioteksa: BioteksaAPI.Bioteksa
	public var convertion: [BioteksaAPI.ConvertionNutrient]
	public var nitrico: ProductComparison
	public var sulfurico: ProductComparison
	public var fosforico: ProductComparison
	
	init(
		response: String = "{\"bioteksa\":{\"1\":[{\"nutrient_id\":1,\"quantity\":125},{\"nutrient_id\":2,\"quantity\":0},{\"nutrient_id\":3,\"quantity\":212.5},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":0}],\"2\":[{\"nutrient_id\":1,\"quantity\":504.1000061035},{\"nutrient_id\":2,\"quantity\":0},{\"nutrient_id\":3,\"quantity\":0},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":0}],\"3\":[{\"nutrient_id\":1,\"quantity\":0},{\"nutrient_id\":2,\"quantity\":469.4200134277},{\"nutrient_id\":3,\"quantity\":37.0999984741},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":0}],\"4\":[{\"nutrient_id\":1,\"quantity\":154},{\"nutrient_id\":2,\"quantity\":98},{\"nutrient_id\":3,\"quantity\":252},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":0}],\"5\":[{\"nutrient_id\":1,\"quantity\":221},{\"nutrient_id\":2,\"quantity\":0},{\"nutrient_id\":3,\"quantity\":45.5},{\"nutrient_id\":4,\"quantity\":169},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":0}],\"6\":[{\"nutrient_id\":1,\"quantity\":0},{\"nutrient_id\":2,\"quantity\":22},{\"nutrient_id\":3,\"quantity\":55},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":19.7999992371},{\"nutrient_id\":6,\"quantity\":0}],\"7\":[{\"nutrient_id\":1,\"quantity\":0},{\"nutrient_id\":2,\"quantity\":0},{\"nutrient_id\":3,\"quantity\":0},{\"nutrient_id\":4,\"quantity\":0},{\"nutrient_id\":5,\"quantity\":0},{\"nutrient_id\":6,\"quantity\":375}]},\"convertion\":[{\"id\":1,\"nutrient_id\":1,\"bioteksa\":0.6000000238,\"soluble\":1,\"created_at\":\"2019-07-02T23:33:13.000000Z\",\"updated_at\":\"2019-08-22T03:47:45.000000Z\"},{\"id\":2,\"nutrient_id\":2,\"bioteksa\":0.5,\"soluble\":1,\"created_at\":\"2019-07-02T23:35:05.000000Z\",\"updated_at\":\"2019-08-06T02:05:16.000000Z\"},{\"id\":3,\"nutrient_id\":3,\"bioteksa\":0.150000006,\"soluble\":1,\"created_at\":\"2019-07-02T23:35:48.000000Z\",\"updated_at\":\"2019-07-26T21:16:02.000000Z\"},{\"id\":4,\"nutrient_id\":4,\"bioteksa\":0.3000000119,\"soluble\":1,\"created_at\":\"2019-07-02T23:35:48.000000Z\",\"updated_at\":\"2019-07-26T21:16:02.000000Z\"},{\"id\":5,\"nutrient_id\":5,\"bioteksa\":0.0199999996,\"soluble\":1,\"created_at\":\"2019-07-02T23:35:49.000000Z\",\"updated_at\":\"2019-07-26T21:16:02.000000Z\"},{\"id\":6,\"nutrient_id\":6,\"bioteksa\":0.1000000015,\"soluble\":1,\"created_at\":\"2019-07-02T23:35:49.000000Z\",\"updated_at\":\"2019-07-26T21:16:02.000000Z\"}],\"nitrico\":{\"peso_especifico\":{\"bioteksa\":63,\"greenHow\":63},\"densidad\":{\"bioteksa\":1.4,\"greenHow\":1.33},\"riqueza\":{\"bioteksa\":63,\"greenHow\":55.5}},\"sulfurico\":{\"peso_especifico\":{\"bioteksa\":49.04,\"greenHow\":41},\"densidad\":{\"bioteksa\":1.8399999999999999,\"greenHow\":1.8399999999999999},\"riqueza\":{\"bioteksa\":98,\"greenHow\":98}},\"fosforico\":{\"peso_especifico\":{\"bioteksa\":98,\"greenHow\":98},\"densidad\":{\"bioteksa\":1.6800000000000002,\"greenHow\":1.6800000000000002},\"riqueza\":{\"bioteksa\":85,\"greenHow\":85}}}"
	) {
		
		let data = response.data(using: .utf8)!
		do {
			let getConfigResponse = try JSONDecoder().decode(GetConfigurationResponse.self, from: data)
			
			self.bioteksa = getConfigResponse.bioteksa
			self.convertion = getConfigResponse.convertion
			self.nitrico = getConfigResponse.nitrico
			self.sulfurico = getConfigResponse.sulfurico
			self.fosforico = getConfigResponse.fosforico
		} catch {
		bioteksa = [
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
		]
		convertion = [
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
		]
		nitrico = ProductComparison(
			peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
		)
		sulfurico = ProductComparison(
			peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
		)
		fosforico = ProductComparison(
			peso_especifico: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			densidad: ProductComparison.Comparison(bioteksa: 1, greenHow: 2),
			riqueza: ProductComparison.Comparison(bioteksa: 1, greenHow: 2)
		)
		}
	}
}
