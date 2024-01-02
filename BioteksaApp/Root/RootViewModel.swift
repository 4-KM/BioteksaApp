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
	@Dependency(\.configurationRepository) var configurationRepository
    
	@Published var activeView: ActiveView = .splash
	
	func getSessionState() async {
		if apiManager.isLogged {
			_ = try? await configurationRepository.getConfiguration()
			activeView = .loggedIn
		} else {
			activeView = .login
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
