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
    
    @State private var areaColor = Color.gray
    
    private func setAreaColor() -> Color {
        Color(red: sliderRedValue, green: sliderGreenValue, blue: sliderBlueValue)
    }
    
    var body: some View {
        
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                AreaColorView(color: setAreaColor())
                
                
                // Sliders and value pickers <- binding
                VStack {
                    ColorSliderView(value: $sliderRedValue, inputValue: $redInput, color: .red)
                    ColorSliderView(value: $sliderGreenValue, inputValue: $greenInput, color: .green)
                    ColorSliderView(value: $sliderBlueValue, inputValue: $blueInput, color: .blue)
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
    }
}



struct AreaColorView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .stroke(lineWidth: 6)
            .background(color)
            .foregroundColor(.white)
            .padding()
            .padding(.vertical)
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    @FocusState private var focusedField: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white)
            Spacer()
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            Spacer()
            TextField("inputValue", text: $inputValue)
                .bordered()
                .keyboardType(.numberPad)
                .focused($focusedField)
        }
//        .toolbar {
//            ToolbarItem(placement: .keyboard) {
//                Button("Done") {
//                    focusedField = false
//                }
//            }
//        }
        .padding(.horizontal)
    }
}

struct BorderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white))
            .foregroundColor(.black)
            //.padding()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
