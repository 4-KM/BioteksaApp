//
//  File.swift
//  
//
//  Created by Mauricio Ventura on 02/10/23.
//

import Foundation

public protocol APIResource {
    associatedtype API: APIManager
    associatedtype Model: Codable, Identifiable
    associatedtype CreateModel: Codable
    
    var api: API { get }
    
    var path: String { get }
}

public extension APIResource {
    func createRequest(
        pathComponents: [String] = [],
        queryParams: QueryParams? = nil
    ) -> URLRequest? {
        guard var url = api.url else { return nil }
        
        url.append(path: path)
        url.append(path: pathComponents.joined(separator: "/"))
        
        let queryItems = queryParams?.map({ (key, value) in
            URLQueryItem(name: key, value: value.description)
        }) ?? []
        url.append(queryItems: queryItems)
        
        var request = URLRequest(url: url)
        if let token = api.authProvider?.token {
            request.setValue(token, forHTTPHeaderField: "Authentication")
        }
        return request
    }
    
    func create(model: CreateModel) async throws -> Model {
        guard var request = createRequest() else { throw APIError.wrongURL }
        request.httpMethod = RestMethod.post.rawValue
        request.httpBody = try JSONEncoder().encode(model)
        
        let response = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(Model.self, from: response.0)
    }
    
    func list<T: Codable>(
        queryParams: QueryParams? = nil
    ) async throws -> T {
        guard var request = createRequest(queryParams: queryParams) else { throw APIError.wrongURL }
        request.httpMethod = RestMethod.get.rawValue
        
        let response = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(T.self, from: response.0)
    }
    
    func read(
        id: Model.ID,
        queryParams: QueryParams? = nil
    ) async throws -> Model {
        let pathComponents = ["\(id)"]
        guard var request = createRequest(pathComponents: pathComponents, queryParams: queryParams) else { throw APIError.wrongURL }
        request.httpMethod = RestMethod.get.rawValue
        
        let response = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(Model.self, from: response.0)
    }
    
    func update(_ model: Model) async throws -> Model {
        let pathComponents = ["\(model.id)"]
        guard var request = createRequest(pathComponents: pathComponents) else { throw APIError.wrongURL }
        request.httpMethod = RestMethod.post.rawValue
        request.httpBody = try JSONEncoder().encode(model)
        
        let response = try await URLSession.shared.data(for: request)
        
        return try JSONDecoder().decode(Model.self, from: response.0)
    }
    
    func delete(id: Model.ID) async throws {
        let pathComponents = ["\(id)"]
        guard var request = createRequest(pathComponents: pathComponents) else { throw APIError.wrongURL }
        request.httpMethod = RestMethod.get.rawValue
        
        if let response = try await URLSession.shared.data(for: request).1 as? HTTPURLResponse,
           response.statusCode == 204 {
            return
        } else {
            throw APIError.deletingError
        }
    }
}

/*
 Pruebas de implementacion
 //
 //  BioteksaAPI.swift
 //  NetworkingDemo
 //
 //  Created by Mauricio Ventura on 01/10/23.
 //
 
 import Foundation
 import Networking
 
 struct TestServer: AppServer {
 var domain: String = "https://reqres.in"
 }
 
 class TestAPI: APIManager {
 typealias Server = TestServer
 
 var appServer = TestServer()
 }
 
 struct UserResource: APIResource {
 
 typealias Model = User
 
 typealias CreateModel = CreatePerson
 
 
 let api = TestAPI()
 let path: String = "api/users"
 
 
 }
 
 extension TestAPI {
 struct GetUser: RestEndpoint {
 struct Response: Codable {
 var data: User
 }
 
 typealias ResponseType = Response
 
 var path: String = "api/users"
 var queryParams: Networking.QueryParams?
 
 init(userId: Int) {
 path.append("/\(userId)")
 }
 }
 
 struct GetUsers: RestEndpoint {
 struct Response: Codable {
 var data: [UserListItem]
 }
 
 typealias ResponseType = Response
 
 var path: String = "api/users"
 var queryParams: Networking.QueryParams?
 
 init(page: Int) {
 queryParams = [
 "page": page
 ]
 }
 }
 
 struct CreateUSer: RestEndpoint {
 typealias ResponseType = Person
 
 var method: RestMethod = .post
 var path: String = "api/users"
 var bodyParams: CreatePerson
 
 init(user: CreatePerson) {
 bodyParams = user
 }
 }
 }
 
 struct ListUserResponse: Codable {
 var data: [UserListItem]
 }
 
 struct CreatePerson: Codable {
 var name: String
 var job: String
 }
 
 struct Person: Codable {
 var id: String
 }
 
 struct User: Codable, Identifiable {
 let id: Int
 let email: String
 }
 
 struct UserListItem: Codable, Hashable {
 let id: Int
 let email: String
 let avatar: String
 }

 */
