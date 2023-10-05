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

