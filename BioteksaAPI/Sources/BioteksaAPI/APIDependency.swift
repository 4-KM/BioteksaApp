//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 07/10/23.
//

import Dependencies
import Foundation
import Networking

public enum APIManagerKey: DependencyKey {
    public static var liveValue: BioteksaAPIManager = LiveBioteksaAPI()
}

public extension DependencyValues {
    var apiManager: BioteksaAPIManager {
        get { self[APIManagerKey.self] }
        set { self[APIManagerKey.self] = newValue }
    }
}
