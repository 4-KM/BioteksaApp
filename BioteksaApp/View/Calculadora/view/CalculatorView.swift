//
//  CalculatorView.swift
//  BioteksaApp
//
//  Created by Aldroid on 11/12/23.
//

import SwiftUI





struct CalculatorView: View {
    var title: String
//    @ObservedObject var CalculadoraVM: CalculadoraViewModel usar cuando se pase ViewModel a las vistas
    var calculatorTypeView: CalculatorTypeView
    @Binding var arrValues: [CalculadoraViewModel.NecesarioCalculator]

    
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Text(title)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.title3)
                
                
                VStack {
                    ForEach(Array($arrValues.enumerated()),id: \.offset) { index, $option in
                        
                        CalculatorRow(entry: $option.valueMole,isValid: $option.isCorrect, nameRow: option.molecula)
                        
                        Divider().frame(height: 2)
                        
                    }
                    
                /*    if calculatorTypeView == .water {
                        ForEach(Array($arrValues.enumerated()),id: \.offset) { index, $option in
                            
                            CalculatorRow(entry: $option.valueMole,isValid: $option.isCorrect, nameRow: option.molecula)
                            
                            Divider().frame(height: 2)
                            
                        }
                        
                    } else if calculatorTypeView == .h3ToNeutralizer {
                        ForEach(Array($CalculadoraVM.aguaModel.enumerated()),id: \.offset) { index, $option in
                            
                            CalculatorRow(entry: $option.valueMole,isValid: $option.isCorrect, nameRow: option.molecula)
                            
                            Divider().frame(height: 2)
                            
                        }
                    } else if calculatorTypeView == .milEq {
                        ForEach(Array($CalculadoraVM.miliEq.enumerated()),id: \.offset) { index, $option in
                            
                            CalculatorRow(entry: $option.valueMole,isValid: $option.isCorrect, nameRow: option.molecula)
                            
                            Divider().frame(height: 2)
                            
                        }
                    } else if calculatorTypeView == .necessary{
                        ForEach(Array($CalculadoraVM.necessaryModel.enumerated()),id: \.offset) { index, $option in
                            
                            CalculatorRow(entry:  $option.valueMole ,isValid: $option.isCorrect, nameRow: option.molecula)

                            Divider().frame(height: 2)
                            
                        }
                    }*/
                    
                }.background(.white)
            }
        }.cornerRadius(10)
            .padding()
    }
}

enum CalculatorTypeView {
    case water
    case milEq
    case h3ToNeutralizer
    case necessary
     
}

struct CalculatorRow: View {
    
    @Binding var entry: String
    @Binding var isValid: Bool
    var nameRow: String
    
    
    var body: some View {
        HStack {
            Text(nameRow).frame(width: 140, height: 35)
            
            TextField("", text: $entry)
                .keyboardType(.decimalPad)
                .frame(width: 140, height: 45)
                .background(isValid ? Color(red: 200/255, green: 200/255, blue: 200/255,opacity: 0.5) : Color(red: 242/255, green: 97/255, blue: 58/255,opacity: 0.5))
            
            
            
        }
        .frame(maxWidth: .infinity)
        
    }
}







/*
#Preview {
    HStack {
        if #available(iOS 17.0, *) {
            CalculatorView(title: "Agua", CalculadoraVM: CalculadoraViewModel(), calculatorTypeView: .water, arrValues: [])
        } else {
            // Fallback on earlier versions
        }
    }.background(Color.yellow)
    
}*/
