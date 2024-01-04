//
//  ViewModel.swift
//  BioteksaApp
//
//  Created by mabas on 28/12/23.
//

import BioteksaAPI
import Dependencies
import Foundation
import SwiftUI

enum ActiveView {
    case fetching
    case error
    case content
}

@MainActor
class ViewModel: ObservableObject {
	@Dependency(\.configurationRepository) var configurationRepository

	@Published var isLoading: Bool = false
	@Published var error: Error?
	@Published var showError: Bool = false
    @Published var activeView: ActiveView = .fetching
    
	func load() async {
		print("This function should be overrided")
	}
	
	func sendConfig(config: SetConfigurationParams) async {
		do {
			isLoading = true
			_ = try await configurationRepository.updateConfiguration(config: config)
			await load()
		} catch {
			showError = true
			self.error = error
		}
		isLoading = false
	}
}
