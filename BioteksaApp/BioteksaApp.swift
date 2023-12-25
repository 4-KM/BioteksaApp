//
//  BioteksaAppApp.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

@main
struct BioteksaApp: App {
    var body: some Scene {
        WindowGroup {
			  RootView(viewModel: RootViewModel())
                
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
