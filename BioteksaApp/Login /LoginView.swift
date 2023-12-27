


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
			 Spacer()
			 Image("bioteksaLogo")
			 TextField(
				"Name",
				text: $viewModel.username,
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
					 if viewModel.showPassword {
						 TextField(
							"Password",
							text: $viewModel.password,
							prompt: Text("Password").foregroundColor(Color.anatomy.white))
					 } else {
						 SecureField(
							"Password",
							text: $viewModel.password,
							prompt: Text("Password").foregroundColor(Color.anatomy.white))
					 }
					 Button {
						 viewModel.showPassword.toggle()
					 } label: {
						 Image(systemName: viewModel.showPassword ? "eye.slash" : "eye")
							 .foregroundColor(Color.anatomy.white)
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
					 await viewModel.login()
				 }
			 }
             .foregroundColor(Color.anatomy.bgTitleBlue)
			 .frame(width: 359, height: 60, alignment: .center)
			 .background(Color.white)
			 .cornerRadius(10)
			 
			 Spacer()
		 }
		 .background(LinearGradient(gradient: Gradient(colors: [Color.anatomy.grandientBlue2, Color.anatomy.grandientBlue1]), startPoint: .top, endPoint: .bottom))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
		 LoginView(viewModel: LoginViewModel(onSuccessfulLogin: {}))
    }
}
