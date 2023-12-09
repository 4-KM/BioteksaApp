//
//  BioteksaTextField.swift
//  ReusableViews
//
//  Created by Mauricio Ventura on 01/12/23.
//

import SwiftUI

struct BioteksaTextField: View {
    var title: LocalizedStringKey
    @Binding var text: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TextField(title, text: $text)
                .frame(height: 40)
                .background(Color(red: 0, green: 0, blue: 0, opacity: 0.05))
            Divider()
                .frame(minHeight: 1)
                .background(Color.gray)
        }
        .padding()
        
    }
}
struct EditableValue: Hashable {
    var id: String
    @State var value: String
    
    init(id: String, value: String) {
        self.id = id
        self.value = value
    }
    
    static func == (lhs: EditableValue, rhs: EditableValue) -> Bool {
        lhs.id == rhs.id &&
        lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


// Demo
class ListVM: ObservableObject {
    
    @Published var one = "3"
    @Published var values = ["1", "2", "3"]//[EditableValue(id: "1", value: ""), EditableValue(id: "2", value: ""), EditableValue(id: "3", value: "")]
}

struct TextList: View {
    @ObservedObject var viewModel = ListVM()
    var body: some View {
        ForEach($viewModel.values, id: \.self) { $row in
            BioteksaTextField(title: "", text: $row)
        }
        Button {
            print(viewModel.values)
        } label: {
            Text("Hola")
        }

    }
}

#Preview {
    
    TableContainer(title: "Test", backgroundColor: .blue) {
        TextList()
    }
}
