


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

struct LoginBioteksa: View {
    
    @State private var textValues: [String] = Array(repeating: "", count: 10)
    
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    var isSignInButtonDisabled: Bool {
        [loginViewModel.username, loginViewModel.password].contains(where: \.isEmpty)
    }
    var body: some View {
        // Rectangle().fill(.blue.gradient)
        //  .ignoresSafeArea()
        // NavigationView {
               
            // Navegar a la nueva vista cuando isLogged es true
          
        if loginViewModel.isLogged {
            TabBarBioteksa()
        } else {
            VStack {
                Spacer()
                Image("bioteksaLogo")
                TextField(
                    "Name",
                    text: $loginViewModel.username,
                    prompt: Text("   Usuario").foregroundColor(.white)
                )
                .keyboardType(.emailAddress)
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(1)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                }
                .padding(.horizontal)
                
                Divider()
                
                HStack {
                    Group {
                        if loginViewModel.showPassword {
                            TextField(
                                "Password",
                                text: $loginViewModel.password,
                                prompt: Text("Password").foregroundColor(.white))
                        } else {
                            SecureField(
                                "Password",
                                text: $loginViewModel.password,
                                prompt: Text("Password").foregroundColor(.white))
                        }
                        Button {
                            loginViewModel.showPassword.toggle()
                        } label: {
                            Image(systemName: loginViewModel.showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                    }.padding(.horizontal)
                        .padding(.top, 0)
                }
                .padding(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                }
                .padding(.horizontal)
                
                Spacer()
                Button("Entrar"){
                    Task {
                        await loginViewModel.login()
                    }
                }
                .foregroundColor(Color(red: 0.068, green: 0.277, blue: 0.473))
                .frame(width: 359, height: 60, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.287, green: 0.561, blue: 0.816), Color(red: 0.068, green: 0.277, blue: 0.473)]), startPoint: .top, endPoint: .bottom))
        }
    }
}
struct LoginBioteksa_Previews: PreviewProvider {
    static var previews: some View {
        LoginBioteksa()
    }
}









/*//
 //  LoginBioteksa .swift
 //  BioteksaApp
 //
 //  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
 //
 
 import SwiftUI
 
 struct LoginBioteksa: View {
 @State private var textValues: [String] = Array(repeating: "", count: 10)
 @State private var isLogged: Bool = false
 
 @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
 
 var isSignInButtonDisabled: Bool {
 [loginViewModel.username, loginViewModel.password].contains(where: \.isEmpty)
 }
 var body: some View {
 // Rectangle().fill(.blue.gradient)
 //  .ignoresSafeArea()
 NavigationView {
 VStack {
 Spacer()
 Image("bioteksaLogo")
 TextField(
 "Name",
 text: $loginViewModel.username,
 prompt: Text("   Login").foregroundColor(.white)
 )
 .padding()
 .autocapitalization(.none)
 .disableAutocorrection(true)
 .padding(1)
 .overlay {
 RoundedRectangle(cornerRadius: 10)
 .stroke(.white, lineWidth: 2)
 }
 .padding(.horizontal)
 
 Divider()
 
 HStack {
 Group {
 if loginViewModel.showPassword {
 TextField(
 "Password",
 text: $loginViewModel.password,
 prompt: Text("Password").foregroundColor(.white))
 } else {
 SecureField(
 "Password",
 text: $loginViewModel.password,
 prompt: Text("Password").foregroundColor(.white))
 }
 Button {
 loginViewModel.showPassword.toggle()
 } label: {
 Image(systemName: loginViewModel.showPassword ? "eye.slash" : "eye")
 .foregroundColor(.white)
 }
 }.padding(.horizontal)
 .padding(.top, 0)
 }
 .padding(15)
 .overlay {
 RoundedRectangle(cornerRadius: 10)
 .stroke(.white, lineWidth: 2)
 }
 .padding(.horizontal)
 
 Spacer()
 NavigationLink (
 destination: TabBarBioteksa(),
 isActive: $isLogged) {
 
 Button("Entrar")
 {
 isLogged = true
 loginViewModel.login()
 }
 .foregroundColor(Color(red: 0.068, green: 0.277, blue: 0.473))
 .frame(width: 359, height: 60, alignment: .center)
 .background(Color.white)
 .cornerRadius(10)
 }
 .navigationTitle("")
 .background(Color(red: 0.681, green: 0.695, blue: 1.000))
 .navigationBarTitleDisplayMode(.inline)
 .navigationBarHidden(true)
 
 
 Rectangle()
 .frame(height: 0)
 Spacer()
 
 }
 .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.287, green: 0.561, blue: 0.816), Color(red: 0.068, green: 0.277, blue: 0.473)]), startPoint: .top, endPoint: .bottom))
 }
 }
 }
 struct LoginBioteksa_Previews: PreviewProvider {
 static var previews: some View {
 LoginBioteksa()
 }
 }
 
 
 
 Button(action: {
 // Acciones al presionar el botón de login
 // Aquí marcamos que el usuario ha iniciado sesión
 isLogged = true
 // loginViewModel.login()
 
 
 }) {
 //  NavigationLink(destination: TabBarBioteksa()) {
 Text("Iniciar sesión")
 .foregroundColor(Color(red: 0.068, green: 0.277, blue: 0.473))
 .frame(width: 359, height: 60, alignment: .center)
 .background(Color.white)
 .cornerRadius(10)
 //}
 }
 // .frame(width:800)
 Spacer()
 
 */

