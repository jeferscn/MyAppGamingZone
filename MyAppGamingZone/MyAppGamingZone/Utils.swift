//
//  Utils.swift
//  MyAppGamingZone
//
//  Created by Jeferson Pereira on 30/09/23.
//

import Foundation
import SwiftUI

struct TextFieldDefault: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 25)
            .foregroundColor(Color.black)
            .font(.system(size: 20))
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .disableAutocorrection(true)
            .autocapitalization(.none)

    }
}
    
extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

func MyTextStyle(configuration: Text) -> some View {
    configuration
        .font(.system(size: 20, weight: .medium, design: .default))
}

struct GrowingButtonPurple: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: 0x550099))
            .foregroundStyle(.white)
            .clipShape(Rectangle())
            .cornerRadius(10)
            .font(.system(size: 18, weight: .medium, design: .default))
    }
}

struct GrowingButtonBlack: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(Rectangle())
            .cornerRadius(10)
            .font(.system(size: 18, weight: .medium, design: .default))
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

