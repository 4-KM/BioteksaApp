//
//  File.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import Dependencies
import Foundation

@MainActor
class TabbarViewModel: ObservableObject {

    var tabs: [Tab]
    var onLogout: () -> Void
    
    init(onLogout: @escaping() -> Void) {
        @Dependency(\.apiManager) var apiManager

        self.onLogout = onLogout
        if apiManager.authProvider?.rol == 0 {
            tabs = [
                .acidos(AcidosViewModel()),
                .nutrientes(NutrientesViewModel()),
                .convertion(ConvertionViewModel()),
                .calculadora(CalculadoraViewModel())
            ]
        } else {
            tabs = [
                .calculadora(CalculadoraViewModel())
            ]
        }
    }
    
    func logout() async {
        @Dependency(\.apiManager) var apiManager

        do {
            try await apiManager.logout()
            onLogout()
        } catch {
            
        }
    }
}

enum Tab {
    case acidos(AcidosViewModel)
    case nutrientes(NutrientesViewModel)
    case convertion(ConvertionViewModel)
    case calculadora(CalculadoraViewModel)
    
    var title: String {
        switch self {
        case .acidos:
            return "Acidos"
        case .nutrientes:
            return "Nutrientes"
        case .convertion:
            return "Convertion"
        case .calculadora:
            return "Calculadora"
        }
    }
    
    var image: String {
        switch self {
        case .acidos:
            return "flask"
        case .nutrientes:
            return "circle.hexagongrid"
        case .convertion:
            return "rectangle.2.swap"
        case .calculadora:
            return "minus.forwardslash.plus"
        }
    }
}
