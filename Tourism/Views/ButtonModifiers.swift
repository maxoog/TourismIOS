//
//  ButtonModifiers.swift
//  Tourism
//
//  Created by Maksim Zenkov on 19.02.2023.
//

import SwiftUI
import Foundation

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.15 : 1)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}
