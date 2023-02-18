import SwiftUI

extension View {
    func defaultShadow() -> some View {
        self.shadow(color: .black.opacity(0.1), radius: 10)
    }
}
