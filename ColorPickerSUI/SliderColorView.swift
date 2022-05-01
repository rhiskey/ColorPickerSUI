//
//  SliderColorView.swift
//  ColorPickerSUI
//
//  Created by Владимир Киселев on 01.05.2022.
//

import SwiftUI


struct SliderColorView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    @FocusState var focusedField: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white).frame(width: 40, height: 60)
            Spacer()
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            Spacer()
            TextField("", text: $inputValue)
                .bordered()
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
                .focused($focusedField)
                .frame(width: 70, height: 60)
        }
        .padding(.horizontal)
    }
}
