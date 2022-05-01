//
//  ContentView.swift
//  ColorPickerSUI
//
//  Created by Владимир Киселев on 30.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderRedValue = Double.random(in: 0...255)
    @State private var sliderGreenValue = Double.random(in: 0...255)
    @State private var sliderBlueValue = Double.random(in: 0...255)
    
    @State private var redInput = ""
    @State private var greenInput = ""
    @State private var blueInput = ""
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        let areaColor = Color(red: sliderRedValue/255, green: sliderGreenValue/255, blue: sliderBlueValue/255)
        
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                AreaColorView(color: areaColor)
                    
                VStack {
                    ColorSliderView(value: $sliderRedValue,
                                    inputValue: $redInput,
                                    focusedField: _focusedField,
                                    color: .red)
                    ColorSliderView(value: $sliderGreenValue,
                                    inputValue: $greenInput,
                                    focusedField: _focusedField,
                                    color: .green)
                    ColorSliderView(value: $sliderBlueValue,
                                    inputValue: $blueInput,
                                    focusedField: _focusedField,
                                    color: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focusedField = false
                            
                            sliderRedValue = Double(redInput) ?? sliderRedValue
                            sliderGreenValue = Double(greenInput) ?? sliderGreenValue
                            sliderBlueValue = Double(blueInput) ?? sliderBlueValue
                        }
                    }
                }
                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

struct BorderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
            .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderViewModifier()
        )
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
