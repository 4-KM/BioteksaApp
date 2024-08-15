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
                .padding(8)
                .background(Color.anatomy.bgTextFieldGray)
            Divider()
                .background(Color.gray)
        }
    }
}

/*
struct BioteksaNumberTextField: View {
    var title: LocalizedStringKey
    @Binding var value: Double
	@FocusState var isEditing: Bool
	@State var emptyValue = ""
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
					TextField(
						title,
						value: $value,
						formatter: formatter,
						prompt: Text("0.0")
					)
					.padding(8)
					.background(Color.anatomy.bgTextFieldGray)
					.keyboardType(.decimalPad)
					.onTapGesture {
						if value == 0 {
							value = nil
						}
					}
            Divider()
                .background(Color.gray)
        }
				
    }
}
 */

struct BioteksaNumberTextField: View {
	var title: LocalizedStringKey
	@Binding var value: Double
	@State private var displayText: String = ""
	
	private let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 3
		return formatter
	}()
	
	var body: some View {
		VStack(alignment: .center, spacing: 0) {
			TextField(
				title,
				text: Binding<String>(
					get: {
						if value == 0 {
							return ""
						} else {
							return formatter.string(for: value) ?? ""
						}
					},
					set: { newValue in
						if let newValue = formatter.number(from: newValue)?.doubleValue {
							value = newValue
						} else {
							value = 0
						}
					}
				),
				prompt: Text("0.0")
			)
			.padding(8)
			.background(Color.anatomy.bgTextFieldGray)
			.keyboardType(.decimalPad)
			
			Divider()
				.background(Color.gray)
		}
	}
}

struct QuantityText: View {
    var value: Double
    var decimals: Int = 3
    
    var body: some View {
        Text(String(format: "%.\(decimals)f", value))
            .padding(8)
        
    }
}

struct ElementEditableValue: View {
    var title: String
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: .infinity)
            BioteksaNumberTextField(title: "", value: $value)
                .frame(maxWidth: .infinity)
        }
    }
}

struct TestEditablePair: View {
    @State var value: Double
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                ElementEditableValue(title: "Test s", value: $value)
                ElementEditableValue(title: "3s s", value: $value)
                ElementEditableValue(title: "Tesdsdsdst s", value: $value)
                ElementEditableValue(title: "Test s", value: $value)
                ElementEditableValue(title: " s", value: $value)
                ElementEditableValue(title: "Test s", value: $value)
                
            }
        }
    }
}

#Preview {
    TestEditablePair(value: 4)
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
            BioteksaTextField(title: "cxzcxcx", text: $row)
        }
        Button {
            print(viewModel.values)
        } label: {
            Text("Hola")
        }
    }
}

#Preview {
    TableContainer(title: "Test", backgroundColor: Color.anatomy.bgTableHeader) {
        TextList()
    }
}
