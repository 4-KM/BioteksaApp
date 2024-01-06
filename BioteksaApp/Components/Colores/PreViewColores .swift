//
//  PreViewColores .swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 23/09/23.
//

import SwiftUI

struct PreViewColores_: View {
    var body: some View {
        ScrollView {
            Text("verde titulos #C0EA07")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(Color.anatomy.bgTitleGreen)
                .cornerRadius(10)
            
            Text("azul degradado #114679 y  #498FD0 ")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.287, green: 0.561, blue: 0.816), Color(red: 0.068, green: 0.277, blue: 0.473)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
            
            Text("morado de fondo #AEB1FF ")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                .cornerRadius(10)
            
            Text("azul de titulos #03498E ")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(Color.anatomy.bgTitleBlue)
                .cornerRadius(10)
            
            Text("carnita de subrayar #FDF7D9 ")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(Color(red: 0.997, green: 0.970, blue: 0.848))
                .cornerRadius(10)
            
            Text("gris tex fiel de subrayar #F2F2F7 ")
                .frame(width: 350, height: 150, alignment: .center)
                .foregroundColor(.black)
                .background(Color(red: 0.949, green: 0.949, blue: 0.967))
                .cornerRadius(10)
        }
    }
}



#Preview {
    PreViewColores_()
}
