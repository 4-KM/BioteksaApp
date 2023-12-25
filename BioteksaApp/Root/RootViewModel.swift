//
//  RootViewModel.swift
//  BioteksaApp
//
//  Created by mabas on 23/12/23.
//

import BioteksaAPI
import Dependencies
import Foundation

@MainActor 
class RootViewModel: ObservableObject {
	enum ActiveView {
        case splash
		case login
		case loggedIn
	}
	
	@Dependency(\.apiManager) var apiManager
    @Dependency(\.userDefaults) var userDefaults
    
	@Published var activeView: ActiveView = .splash
	
	func getSessionState() async {
		if apiManager.isLogged {
			activeView = .loggedIn
            await load()
		} else {
			activeView = .login
		}
	}
    
    func load() async {
        do {
            let configuration = try await apiManager.fetch(GetConfiguration())
            try userDefaults.set(
                JSONEncoder().encode(configuration),
                forKey: LoginKeys.configuration
            )
        } catch {
            
        }
    }
}

struct GlobalMessage {
    enum Level {
        case developer
        case info
        case warning
        case error
    }
    
    var level: Level
    var message: String
}
