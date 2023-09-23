//
//  AcidosTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct AcidosTabBar: View {
    @State var comparativa: String = "0"
    
    // var acidosViewModel = AcidosViewModel()
    var body: some View {
        
        ScrollView {
                
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    
                    Text("acido sulfurico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                        List {
                            Section(header: Text("Bioteksa       Otros")//,footer: Rectangle()
                                    //.background(Color(red: 0.754, green: 0.916, blue: 0.026))
                                    
                                .frame(width: 280, height: 30, alignment: .trailing)
                            )
                            {
                                ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
                                        //.background(Color(red: 0.997, green: 0.970, blue: 0.848))
                                }
                            }
                        }
                        .cornerRadius(10.0)
                        .frame(width: 350, height: 220, alignment: .center)
                    
                    
                    Text("acido Nitrico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        
                        Section(header: Text("Bioteksa       Otros")//,footer: Rectangle()
                                //.background(Color(red: 0.754, green: 0.916, blue: 0.026))
                                
                            .frame(width: 280, height: 30, alignment: .trailing)
                        )
                        {
                            ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 220, alignment: .center)
                    
                    
                    Text("acido Fosforico") // vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")//,footer: Rectangle()
                                //.background(Color(red: 0.754, green: 0.916, blue: 0.026))
                                
                            .frame(width: 280, height: 30, alignment: .trailing)
                        )
                        {
                            ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 220, alignment: .center)
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                }
                .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
        .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        .navigationTitle("Calculadora")

    }
}

struct AcidosTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AcidosTabBar()
    }
}



