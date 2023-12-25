//
//  File.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import Dependencies
import Foundation

@MainActor
class TabbarViewModel: ObservableObject {
    @Dependency(\.apiManager) var apiManager

    var onLogout: () -> Void
    
    init(onLogout: @escaping() -> Void) {
        self.onLogout = onLogout
    }
    
    func logout() async {
        do {
            try await apiManager.logout()
            onLogout()
        } catch {
            
        }
    }
}
