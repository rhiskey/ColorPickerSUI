//
//  ContentView.swift
//  ColorPickerSUI
//
//  Created by Владимир Киселев on 30.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0, green: 0.3765624762, blue: 0.7304599881, alpha: 1)).ignoresSafeArea()
                
                VStack(spacing: 40) {
                    ColorView(red: red, green: green, blue: blue)
                    
                    VStack {
                        ColorSliderView(sliderValue: $red, color: .red)
                        ColorSliderView(sliderValue: $green, color: .green)
                        ColorSliderView(sliderValue: $blue, color: .blue)
                    }
                    .frame(height: 150)
                    .focused($focusedField)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                focusedField = false
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
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
