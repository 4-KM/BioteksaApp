//
//  TableContainer.swift
//  ReusableViews
//
//  Created by Mauricio Ventura on 01/12/23.
//

import SwiftUI

struct TableContainer<Content: View>: View {
    var title: LocalizedStringKey
    var secondaryTitle: LocalizedStringKey?
    var backgroundColor: Color
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            if let secondaryTitle {
                HStack {
                    Text(title)
                        
                    Spacer()
                    Text(secondaryTitle)
                }
                .padding()
                .frame(height: 50)
                .background(backgroundColor)
					 .foregroundColor(.anatomy.white)
                .font(.title2)
            } else {
                Text(title)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .foregroundColor(.anatomy.white)
						  .font(.title2)
            }
            
            content()
        }
        .background(Color.anatomy.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    HStack {
        TableContainer(title: "Title", secondaryTitle: nil, backgroundColor:Color.anatomy.bgTitleBlue) {
            Text("test")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.anatomy.bgTitleBlue)
            Divider()
            Text("test")
            Text("test")
            Text("test")
            Text("test")
        }
    }
    .background(Color.yellow)
}
