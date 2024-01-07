//
//  BiioteksaGradientBackground.swift
//  BioteksaApp
//
//  Created by mabas on 07/01/24.
//

import SwiftUI

struct BioteksaGradientBackground: ViewModifier {
	func body(content: Content) -> some View {
		content.background {
			LinearGradient(
				gradient: Gradient(
					colors: [
						Color.anatomy.gradientBlue1,
						Color.anatomy.gradientBlue2
					]
				),
				startPoint: .top,
				endPoint: .bottom
			)
			.clipped()
		}
	}
}

extension View {
	func gradientBackground() -> some View {
		self.modifier(BioteksaGradientBackground())
	}
}
