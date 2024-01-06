//
//  Page.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import SwiftUI

struct Page<Content: View>: View {
	@ObservedObject var viewModel: ViewModel
	
    private let content: () -> Content
    
	init(
		viewModel: ViewModel,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.viewModel = viewModel
        self.content = content
    }
    
    var body: some View {
		 ZStack {
             switch viewModel.activeView {
             case .fetching:
                 ProgressView()
             case .error:
                 Text("Algo salio mal")
             case .content:
                 ScrollView {
                     VStack {
                         content()
                     }
                     .padding()
                 }
					  .background(Color.anatomy.bgPurple)
                 
                 if viewModel.isLoading {
                     ProgressView()
                 }
             }
		 }
		 .alert("Error", isPresented: $viewModel.showError, actions: {
			 
		 }) {
			 Text(viewModel.error?.localizedDescription ?? "Algo salio mal")
		 }
         .task {
             await viewModel.load()
         }
    }
}

#Preview {
    Page(viewModel: ViewModel()) {
        Text("Hola")
    }
}
