//
//  File.swift
//  BioteksaApp
//
//  Created by Mauricio Ventura on 24/12/23.
//

import Dependencies
import SwiftUI

@MainActor
struct DemoData {
    let water = ElementSet(
        set: ElementSet.Set.water,
        nitrogeno: ElementValue(element: .nitrogeno, value: 0.27),
        fosforo: ElementValue(element: .fosforo, value: 0.01),
        potasio: ElementValue(element: .potasio, value: 0.08),
        calcio: ElementValue(element: .calcio, value: 1.3),
        magnesio: ElementValue(element: .magnesio, value: 0.66),
        asufre: ElementValue(element: .asufre, value: 0.4),
        bicarbonato: ElementValue(element: .bicarbonato, value: 3.08),
        carbonato: ElementValue(element: .carbonato, value: 1)
    )
    
    let requiredElements = ElementSet(
        set: ElementSet.Set.required,
        nitrogeno: ElementValue(element: .nitrogeno, value: 5),
        fosforo: ElementValue(element: .fosforo, value: 2),
        potasio: ElementValue(element: .potasio, value: 8),
        calcio: ElementValue(element: .calcio, value: 10),
        magnesio: ElementValue(element: .magnesio, value: 1.8),
        asufre: ElementValue(element: .asufre, value: 5),
        bicarbonato: ElementValue(element: .bicarbonato, value: 0),
        carbonato: ElementValue(element: .carbonato, value: 0)
    )

    var viewModel: CalculadoraViewModel {
        let vm = CalculadoraViewModel()
        vm.waterSet = water
        vm.requiredSet = requiredElements
        return vm
    }
}

@MainActor
class TabbarViewModel: ObservableObject {
    @Dependency(\.apiManager) var apiManager

    @Published var showLogoutAlert = false
    @Published var attemptChangeToTab: Int = 0
    @Published var selectedTab = 0
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
                //.calculadora(DemoData().viewModel)
                .calculadora(CalculadoraViewModel())
            ]
        } else {
            tabs = [
                .calculadora(CalculadoraViewModel())
            ]
        }
    }
    
    func shouldChangeTab(to newTab: Int) -> Bool {
        if newTab != 4 {
            return true
        }
        showLogoutAlert = true
        return false
    }
    
    func logout() async {
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
    
    var tag: Int {
        switch self {
        case .acidos:
            return 0
        case .nutrientes:
            return 1
        case .convertion:
            return 2
        case .calculadora:
            return 3
        }
    }
}

struct TabbarContainer: View {
    var tab: Tab
    
    var body: some View {
        Group {
            switch tab {
            case .acidos(let viewModel):
                AcidosView(viewModel: viewModel)
            case .nutrientes(let viewModel):
                NutrientesView(viewModel: viewModel)
            case .convertion(let viewModel):
                ConvertionView(viewModel: viewModel)
            case .calculadora(let viewModel):
                CalculadoraView(viewModel: viewModel)
            }
        }
        .tabItem {
            Label(tab.title, systemImage: tab.image)
                .tint(.red)
        }
        .tag(tab.tag)
    }
}
