//
//  acidosView.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct acidosView: View {
    @State var texto : String = "hoa"
    var body: some View {
        TextField("acidos", text: $texto)
            .background(Color(red: 0.988, green: 0.965, blue: 0.859))
    }
}

#Preview {
    acidosView()
}
