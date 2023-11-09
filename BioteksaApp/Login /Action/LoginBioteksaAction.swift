//
//  LoginBioteksaAction.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import BioteksaAPI
import Foundation


struct LoginAction {
    
    var parameters: LoginRequest
    
    func call(completion: @escaping (LoginResponse) -> Void) {
        
        let scheme: String = "https"
        let host: String = "https://bioteksa.anuncia.space/api"
        let path = "/auth/signup"
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
      //  guard let url = components.url else {
        //    return
        //}
        
        var request = URLRequest(url: URL(string: "https://bioteksa.anuncia.space/api/auth/signup")!)
        request.httpMethod = "post"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            print(data, error)
            if let data = data {
                let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                
                if let response = response {
                    completion(response)
                } else {
                    // Error: Unable to decode response JSON
                    
                }
            } else {
                // Error: API request failed
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
