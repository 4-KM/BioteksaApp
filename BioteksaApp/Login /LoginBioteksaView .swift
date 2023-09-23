//
//  LoginBioteksa .swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct LoginBioteksa: View {
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    @State var name: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    
    var isSignInButtonDisabled: Bool {
        [name, password].contains(where: \.isEmpty)
    }
    
    var body: some View {
       // Rectangle().fill(.blue.gradient)
          //  .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("bioteksaLogo")
                TextField("Name",
                          text: $name ,
                          prompt: Text("Login").foregroundColor(.white)
                )
                .padding()
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(1)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
                }                .padding(.horizontal)

                
                Divider()
                
                HStack {
                    Group {
                        if showPassword {
                            TextField("Password",
                                      text: $password,
                                      prompt: Text("Password").foregroundColor(.white))
                        } else {
                            SecureField("Password",
                                        text: $password,
                                        prompt: Text("Password").foregroundColor(.white))
                        }

                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
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
                NavigationLink(destination: TabBarBioteksa()) {
                    Text("Entrar")
                        .foregroundColor(Color(red: 0.068, green: 0.277, blue: 0.473))
                        .frame(width: 359, height: 60, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                    Rectangle()
                        .frame(height: 0)
                    Spacer()
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.287, green: 0.561, blue: 0.816), Color(red: 0.068, green: 0.277, blue: 0.473)]), startPoint: .top, endPoint: .bottom))
    }
}

struct LoginBioteksa_Previews: PreviewProvider {
    static var previews: some View {
        LoginBioteksa()
    }
}



