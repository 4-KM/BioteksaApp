//
//  NutrientesTabBar.swift
//  BioteksaApp
//
//  Created by Eduardo Gersai Garcia Ventura on 18/09/23.
//

import SwiftUI

struct NutrientesTabBar: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Color(red: 0.681, green: 0.695, blue: 1.000)
                    Text("hooa")
                    List {
                        ForEach( necesario,  id: \.molecula ) { option in Text(option.molecula)
                            Text("hooa")

                        }
                        ForEach( necesario,  id: \.molecula ) { option in Text(option.molecula)
                            Text("hooa")
                        }
                        Text("hooa1")

                    }
                    Text("hooa2")
                }
                Text("hooa3")
            }
            .background(Color(red: 0.681, green: 0.695, blue: 1.000))
        }
    }
}
struct NutrientesTabBar_Previews: PreviewProvider {
    static var previews: some View {
        NutrientesTabBar()
    }
}

