//
//  KeyboardObserver.swift
//  BioteksaApp
//
//  Created by mabas on 07/01/24.
//

import UIKit
import SwiftUI

class KeyboardResponder: ObservableObject {
	@Published var isKeyboardVisible: Bool = false
	
	init() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}
	
	@objc func keyboardWillShow(notification: NSNotification) {
		isKeyboardVisible = true
		print("shoingKeyboard")
	}
	
	@objc func keyboardWillHide(notification: NSNotification) {
		isKeyboardVisible = false
		print("closingKeyboard")
	}
}

struct KeyBoardManager: ViewModifier {
	@ObservedObject private var keyboardResponder = KeyboardResponder()

	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
	func body(content: Content) -> some View {
		VStack {
			content
			if keyboardResponder.isKeyboardVisible {
				HStack {
					Spacer()
					Button("Ok") {
						hideKeyboard()
					}
					.padding()
				}
				.background(Color.anatomy.bgPrimary)
			}
		}
	}
}

extension View {
	func keyboardObserver() -> some View {
		self.modifier(KeyBoardManager())
	}
}
