//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 02/10/23.
//

import Foundation

public enum RestMethod: String {
    case get
    case post
}

public typealias QueryParams = [String: CustomStringConvertible]

public protocol RestEndpoint {
    associatedtype ResponseType: Codable
    associatedtype BodyType: Codable
    
    var path: String { get }
    var method: RestMethod { get }
    var queryParams: QueryParams? { get }
    var bodyParams: BodyType? { get }
}

public extension RestEndpoint {
    var method: RestMethod { .get }
    var queryParams: QueryParams? { nil }
    var bodyParams: EmptyCodable? { nil }
    
    func decode(_ data: Data) throws -> ResponseType {
        let decoder = JSONDecoder()
        return try decoder.decode(ResponseType.self, from: data)
    }
}

/// A "stub" Codable struct for type declarations,
/// not intended for use, so it's uninitializable.
public struct EmptyCodable: Codable {
    @available(*, unavailable)
    init() {}
}
