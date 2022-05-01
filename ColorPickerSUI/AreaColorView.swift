//
//  AreaColorView.swift
//  ColorPickerSUI
//
//  Created by Владимир Киселев on 01.05.2022.
//

import SwiftUI

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
struct AreaColorView_Previews: PreviewProvider {
    static var previews: some View {
        AreaColorView(color: .blue)
    }
}
