//
//  Calculadora.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct Calculadora: View {
    var body: some View {
        NavigationView{
            ScrollView {
                
                Group {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    
                    Text("NECESARIO")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        ForEach( necesario,  id: \.molecula ) { option in Text(option.molecula)
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    
                    
                    Text("Milequivalentes requeridos por el cultivo")
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.021, green: 0.286, blue: 0.557))
                        .cornerRadius(10)
                    List {
                        ForEach( necesario,  id: \.molecula ) { option in Text(option.molecula)
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    
                    Text("Acido sulfurico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                            .frame(width: 280, height: 30, alignment: .trailing))
                        {
                            ForEach( meq + acidos + cantidad, id: \.descripcion ) { option in Text(option.descripcion)
                                
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    
                    
                    Text("Acido Nitrico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                            .frame(width: 280, height: 30, alignment: .trailing))
                        {
                            ForEach( meq + acidos + cantidad, id: \.descripcion ) { option in Text(option.descripcion)
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    
                    
                    
                    Text("Acido Fosforico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                            .frame(width: 280, height: 30, alignment: .trailing))
                        {
                            ForEach( meq + acidos + cantidad,  id: \.descripcion ) { option in Text(option.descripcion)
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    
                    
                    NavigationLink(destination: VolumenDeRiegoView()) {
                        Text("VOLUMEN DE RIEGO M3")
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .cornerRadius(10)
                        
                    }
                    .navigationTitle("VOLUMEN DE RIEGO M3")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
                }
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
    }
}
struct Calculadora_Previews: PreviewProvider {
    static var previews: some View {
        Calculadora()
    }
}


