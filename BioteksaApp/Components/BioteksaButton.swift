//
//  BioteksaButton.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import SwiftUI

struct BioteksaButton: View {
    var title: LocalizedStringKey
    var action: () async -> Void
    
    var body: some View {
        Button(action: {
            Task {
                await action()
            }
        }, label: {
            HStack {
                Text(title)
            }
            .padding(10)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .background(.gray)
            .cornerRadius(10)
        })
    }
}

#Preview {
    VStack {
        BioteksaButton(title: "Test") {
            
        }
        .padding()
    }
    
}
