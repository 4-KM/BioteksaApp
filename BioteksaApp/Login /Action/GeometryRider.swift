//
//  GeometryRider.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 14/10/23.
//
import SwiftUI
import Foundation

struct ScreenSize: View {
    
    //@State var sizeWidth: Double
    //@State var sizeHeigth: Double
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                Text("Width: \(proxy.size.width)")
                    .background(Color.orange)
                    .padding()
                Text("Height: \(proxy.size.height)")
                    .background(Color.orange)
                    .padding()
            }
        }
        .background(Color.red)
    }
}



#Preview {
    ScreenSize()
}
