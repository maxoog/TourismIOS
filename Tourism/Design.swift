import SwiftUI

enum Design {
    enum Colors {
        public static let back: Color = .init(uiColor: .init(red: 0.91, green: 0.94, blue: 0.95, alpha: 1))
        public static let mainText: Color = .init(uiColor: .init(red: 0.008, green: 0.149, blue: 0.42, alpha: 1))
        public static let pickerBg: Color = .init(uiColor: .init(red: 0.429, green: 0.572, blue: 1, alpha: 0.4))
        public static let darkBlue: Color = .init(uiColor: .init(red: 0.008, green: 0.149, blue: 0.42, alpha: 1))
        public static let mainGreen: Color = .init(uiColor: .init(red: 0, green: 0.631, blue: 0.604, alpha: 1))
        public static let lightGray: Color = .init(uiColor: .init(red: 0.73, green: 0.73, blue: 0.76, alpha: 1))
        public static let lightViolet: Color = .init(uiColor: .init(red: 0.645, green: 0.612, blue: 0.847, alpha: 1))
        public static let lightGreyOnboargind: Color = .init(uiColor: .init(red: 0.843, green: 0.843, blue: 0.867, alpha: 1))
        public static let red: Color = .init(uiColor: .init(red: 0.92, green: 0.20, blue: 0.14, alpha: 1))
        public static let yellow: Color = .init(uiColor: .init(red: 1, green: 0.836, blue: 0.254, alpha: 1))
        public static let mainBack: Color = .init(uiColor: .init(red: 0.517, green: 0.517, blue: 0.517, alpha: 1))
    }
    
    enum Gradients {
        public static let titleGradient: LinearGradient = LinearGradient(colors: [
            .init(red: 0.64, green: 0.61, blue: 0.84),
            .init(red: 0, green: 0.15, blue: 0.42)
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        public static let buttonGradient: LinearGradient = LinearGradient(colors: [
            .init(red: 0.733, green: 0.761, blue: 0.929),
            .init(red: 0.941, green: 0.765, blue: 0.776)
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    enum Fonts {
        public static let medium11: Font = Font.custom("Manrope-Medium", size: 11)
        public static let medium12: Font = Font.custom("Manrope-Medium", size: 12)
        public static let medium14: Font = Font.custom("Manrope-Medium", size: 14)
        public static let medium: Font = Font.custom("Manrope-Medium", size: 18)
        public static let extraBold: Font = Font.custom("Manrope-ExtraBold", size: 18)
        public static let extraBold24: Font = Font.custom("Manrope-ExtraBold", size: 24)
        
        public static let bold11: Font = Font.custom("Manrope-Bold", size: 11)
        public static let bold12: Font = Font.custom("Manrope-Bold", size: 12)
        public static let bold14: Font = Font.custom("Manrope-Bold", size: 14)
        public static let bold16: Font = Font.custom("Manrope-Bold", size: 14)
        public static let bold: Font = Font.custom("Manrope-Bold", size: 18)
        public static let bold24: Font = Font.custom("Manrope-Bold", size: 24)
        public static let bold16_2: Font = Font.custom("Manrope-Bold", size: 16)
        public static let extraLight: Font = Font.custom("Manrope-ExtraLight", size: 18)
        public static let light: Font = Font.custom("Manrope-Light", size: 18)
        public static let regular: Font = Font.custom("Manrope-Regular", size: 18)
        public static let semiBold: Font = Font.custom("Manrope-SemiBold", size: 18)
        public static let semiBoldMedium: Font = Font.custom("Manrope-SemiBold", size: 14)
        public static let semiBoldSmall: Font = Font.custom("Manrope-SemiBold", size: 12)
        public static let common: Font = Font.custom("Manrope", size: 18)
        public static let common14: Font = Font.custom("Manrope", size: 14)
        public static let newsSmallFont: Font = Font.custom("Manrope-SemiBold", size: 10)
        public static let common24: Font = Font.custom("Manrope", size: 24)
        public static let common16: Font = Font.custom("Manrope", size: 12)
    }
    
    enum LottieFile {
        public static let welcome: String = "welcome"
        public static let loader: String = "loader"
    }
}

