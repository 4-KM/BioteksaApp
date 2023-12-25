// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

enum APIError: Error {
    case wrongURL
    case deletingError
}

public protocol APIManager {
    var domain: String { get }
    var authProvider: AuthenticationProvider? { get }
}

public extension APIManager {
    var authProvider: Unauthenticated? { nil }
    
    var url: URL? {
        guard let url = URL(string: domain) else { return nil }
        return url
    }
    
    func fetch<T: RestEndpoint>(_ endpoint: T) async throws -> T.ResponseType {
        guard var url = url else {
            throw APIError.wrongURL
        }
        url.append(path: endpoint.path)
        if let queryItems = endpoint.queryParams?.map({ (key, value) in
            URLQueryItem(name: key, value: value.description)
        }) {
            url.append(queryItems: queryItems)
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = endpoint.method.rawValue
        if let token = authProvider?.token {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }
        if let bodyEncodable = endpoint.bodyParams {
            let encoder = JSONEncoder()
            let body: Data = try encoder.encode(bodyEncodable)
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let response = try await URLSession.shared.data(for: request)
        return try endpoint.decode(response.0)
    }
}
