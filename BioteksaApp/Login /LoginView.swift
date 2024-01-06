


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
                VStack(spacing: 16) {
                    Image("bioteksaLogo")
                        .padding(32)
                    TextField(
                        "Name",
                        text: $viewModel.username,
                        prompt: Text("Usuario").foregroundColor(.white)
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
                                prompt: Text("Password").foregroundColor(.white))
                        } else {
                            SecureField(
                                "Password",
                                text: $viewModel.password,
                                prompt: Text("Password").foregroundColor(.white))
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
            BioteksaButton(title: "Entrar") {
                await viewModel.login()
            }
            .padding()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.287, green: 0.561, blue: 0.816), Color(red: 0.068, green: 0.277, blue: 0.473)]), startPoint: .top, endPoint: .bottom))
    }
}

struct Cornered: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.white, lineWidth: 2)
            }
            .tint(.white)
            .foregroundColor(.white)
    }
}

extension View {
    func cornered() -> some View {
        self.modifier(Cornered())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(onSuccessfulLogin: {}))
    }
}
