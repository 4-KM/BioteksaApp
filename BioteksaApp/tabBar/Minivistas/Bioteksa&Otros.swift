//
//  Bioteksa&Otros.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 22/09/23.
//

import SwiftUI

struct Bioteksa_Otros: View {
    @State private var textValues: [String] = Array(repeating: "", count: 10)
    @State private var selectedTab = 0

    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<textValues.count, id: \.self) { index in
                    TextField(" text", text: $textValues[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
            }
            .navigationTitle("TextField List")
        }
    
    
            TabView(selection: $selectedTab) {
                PreviousScreen()
                    .tabItem {
                        Text("Anterior")
                        Image(systemName: "arrow.left")
                    }
                    .tag(0)
                
                NextScreen()
                    .tabItem {
                        Text("Siguiente")
                        Image(systemName: "arrow.right")
                    }
                    .tag(1)
            }
    
    
    
    
   
        NavigationView {
            List {
                    Section {
                        Text("hola")
                        
                        Section {
                            Section(header: Text("Bioteksa       Otros")
                                .frame(width: 280, height: 30, alignment: .trailing))
                            {
                                ForEach( meq  + (acidos + cantidad), id: \.descripcion ) { option in Text(option.descripcion)
                                    
                                }
                            
                        }
                            .padding(10)
                        .cornerRadius(10.0)
                        .frame(width: 350, height: 60, alignment: .leading)
                    }
                    .navigationTitle("hola mundo")
                }
            }
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
        //.navigationBarTitleDisplayMode(.automatic)
       // .navigationBarTitleDisplayMode(.inline)

    }
}

struct NextScreen: View {
    var body: some View {
        VStack {
            Text("Siguiente Pantalla")
                .font(.largeTitle)
            
            // Botón para ir a la siguiente pantalla
            Button(action: {
                // Acciones para ir a la siguiente pantalla
            }) {
                Text("Ir a la siguiente pantalla")
            }
        }
    }
}


struct PreviousScreen: View {
    var body: some View {
        VStack {
            Text("Pantalla Anterior")
                .font(.largeTitle)
            
            // Botón para ir a la pantalla previa
            Button(action: {
                // Acciones para ir a la pantalla previa
            }) {
                Text("Ir a la pantalla previa")
            }
        }
    }
}



#Preview {
   // WindowGroup {
        Bioteksa_Otros()
  //  }
}
