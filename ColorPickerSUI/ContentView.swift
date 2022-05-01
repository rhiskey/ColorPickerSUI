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
    
    
    var body: some View {
        let areaColor: Color = Color(red: sliderRedValue/255, green: sliderGreenValue/255, blue: sliderBlueValue/255)
        
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                AreaColorView(color: areaColor)
                    
                VStack {
                    ColorSliderView(value: $sliderRedValue, inputValue: $redInput, color: .red)
                    ColorSliderView(value: $sliderGreenValue, inputValue: $greenInput, color: .green)
                    ColorSliderView(value: $sliderBlueValue, inputValue: $blueInput, color: .blue)
                }
                
                Spacer()
            }
        }
    }
}



struct AreaColorView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(color)
            .frame(height: 150)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 6)
                    .foregroundColor(.white)
            )
            .padding()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var inputValue: String
    @FocusState private var focusedField: Bool
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.white).frame(width: 40, height: 60)
            Spacer()
            Slider(value: $value, in: 0...255, step: 1).accentColor(color)
            Spacer()
            TextField("", text: $inputValue)
                .bordered()
                .keyboardType(.numberPad)
                .focused($focusedField)
                .frame(width: 70, height: 60)
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
