//
//  AcidosViewModel.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 19/09/23.
//

import Foundation
import SwiftUI



class AcidosViewModel {
    
  //  var acidos: Acido
    //@Published var Bioteksa: String = ""
    //@Published var Otros: String = ""
    //@State var tipoDeAcido: String = ""
    func tablasComparativas() {
            
        ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
        }
            
        
            
        ForEach(acidos,  id: \.descripcion) { option in Text(option.descripcion)
        }
    }
}

