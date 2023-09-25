//
//  Bioteksa&Otros.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct Bioteksa_Otros: View {
    var body: some View {
        NavigationView {
            
            
            List {
                Section(header: Text("Bioteksa       Otros")
                    .frame(width: 280, height: 30, alignment: .trailing))
                {
                    ForEach( meq  + (acidos + cantidad), id: \.descripcion ) { option in Text(option.descripcion)
                        
                    }
                }
            }
            .cornerRadius(10.0)
            .frame(width: 350, height: 360, alignment: .center)
            
            
            /*
             List {
             NavigationLink ( destination: TabBarBioteksa()) {
             Text("Entrar")
             .foregroundColor(Color(red: 0.068, green: 0.277, blue: 0.473))
             .frame(width: 359, height: 60, alignment: .center)
             .background(Color.white)
             .cornerRadius(10)
             }
             
             NavigationLink(destination: VolumenDeRiegoView()) {
             Text("VOLUMEN DE RIEGO M3")
             .frame(width: 350, height: 50, alignment: .center)
             .foregroundColor(.black)
             .background(Color.gray)
             .cornerRadius(10)
             
             
             NavigationLink("Option Menu 1",
             destination: Text("Some information"))
             NavigationLink("Option Menu 2",
             destination: Button("Tap me!", action: {
             print("Hello iOS Developer!")})
             )
             
             Text("Option Menu 3")
             Text("Option Menu 4")
             }
             .navigationBarItems(trailing: Button("Done", action: {
             print("Right Buttton")
             }))
             .navigationTitle("Menu")
             .navigationBarTitleDisplayMode(.automatic)
             .navigationBarHidden(false)
             }
             }*/
        }
    }
}
#Preview {
    Bioteksa_Otros()
}
