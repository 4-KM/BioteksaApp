//
//  LoginBioteksa .swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

// usuario : william3@gmail.com
// contraseña

// has las letras blancas dentro del los text field

import SwiftUI

struct LoginView: View {
	@ObservedObject var viewModel: LoginViewModel
	
	var isSignInButtonDisabled: Bool {
		[viewModel.username, viewModel.password].contains(where: \.isEmpty)
	}
	
	var body: some View {
		VStack {
			ScrollView {
				VStack(spacing: 100) {
					Spacer()
					Image("logotipo")
						.padding(32)
					VStack {
						TextField(
							"Name",
							text: $viewModel.username,
							prompt: Text("Usuario").foregroundColor(.blue)
						)
						.keyboardType(.emailAddress)
						.autocapitalization(.none)
						.disableAutocorrection(true)
						.cornered()
						HStack {
							if viewModel.showPassword {
								TextField(
									"Password",
									text: $viewModel.password,
									prompt: Text("Password").foregroundColor(.blue))
							} else {
								SecureField(
									"Password",
									text: $viewModel.password,
									prompt: Text("Password").foregroundColor(.blue))
							}
							Button {
								viewModel.showPassword.toggle()
							} label: {
								Image(systemName: viewModel.showPassword ? "eye.slash" : "eye")
									.foregroundColor(.white)
							}
						}
						.cornered()
					}
				}
				.padding()
			}
			BioteksaButton(title: "Entrar") {
				await viewModel.login()
			}
			.padding()
		}
		.background {
			VStack {
				Image("bg_home-800")
				Spacer()
			}
		}
	}
}

struct Cornered: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding()
			.tint(.blue)
			.foregroundColor(.blue)
			.overlay {
				RoundedRectangle(cornerRadius: 10)
					.stroke(Color.blue, lineWidth: 2)
			}
	}
}

struct BioteksaGradientBackground: ViewModifier {
	func body(content: Content) -> some View {
		content.background {
			LinearGradient(
				gradient: Gradient(
					colors: [
						Color(
							red: 0.287,
							green: 0.561,
							blue: 0.816
						),
						Color(
							red: 0.068,
							green: 0.277,
							blue: 0.473
						)
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
	func cornered() -> some View {
		self.modifier(Cornered())
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(viewModel: LoginViewModel(onSuccessfulLogin: {}))
	}
}

