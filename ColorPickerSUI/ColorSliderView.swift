//
//  ColorSliderView.swift
//  ColorPickerSUI
//
//  Created by Владимир Киселев on 01.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            ColorValueTextView(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: sliderValue) { isOnFocus in
                    textValue = "\(lround(isOnFocus))"
                }
            ColorValueTFView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorSliderView(sliderValue: .constant(100), color: .red)
        }
    }
}
