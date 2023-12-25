//
//  Page.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import SwiftUI

struct Page<Content: View>: View {
    private let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            VStack {
                content()
            }
            .padding()
        }
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
    }
}

#Preview {
    Page {
        Text("Hola")
    }
}
