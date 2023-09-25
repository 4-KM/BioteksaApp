//
//  Calculadora.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct Calculadora: View {
    var body: some View {
        
            ScrollView {
                
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                   /*
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
                    .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                    
                    
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
                    .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                    
                    Text("Acido sulfurico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                                
                            .frame(width: 280, height: 30, alignment: .trailing)
                        )
                        {
                            ForEach( meq + acidos + necesario,  id: \.descripcion ) { option in Text(option.descripcion)
                                
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                    Color(red: 0.681, green: 0.695, blue: 1.000)
*/
                    Text("Acido Nitrico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                                
                            .frame(width: 280, height: 30, alignment: .trailing)
                        )
                        {
                            ForEach( meq + acidos + cantidad,  id: \.descripcion ) { option in Text(option.descripcion)
                                //.background(Color(red: 0.997, green: 0.970, blue: 0.848))
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                    
                    
                    Text("Acido Fosforico")// vistas reusables
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(red: 0.757, green: 0.916, blue: 0.025))
                        .cornerRadius(10)
                    List {
                        Section(header: Text("Bioteksa       Otros")
                                
                            .frame(width: 280, height: 30, alignment: .trailing)
                        )
                        {
                            ForEach( meq + acidos + cantidad,  id: \.descripcion ) { option in Text(option.descripcion)
                                //.background(Color(red: 0.997, green: 0.970, blue: 0.848))
                            }
                        }
                    }
                    .cornerRadius(10.0)
                    .frame(width: 350, height: 360, alignment: .center)
                    .background(Color(red: 0.681, green: 0.695, blue: 1.000))
                    NavigationLink(destination: VolumenDeRiegoView()) {
                        Text("VOLUMEN DE RIEGO M3")
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .cornerRadius(10)
                    
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



/*

*/
