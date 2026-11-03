import SwiftUI

/// Clean-room visual tokens measured from the WHOOP 5.75.0 IPA asset catalog.
/// Only colour values are reproduced here; no compiled WHOOP code or image assets are copied.
/// Woop's existing StrandFont remains the type system for all text.
public enum WhoopReferencePalette {
    public static let greyBlue = Color(red: 26 / 255, green: 34 / 255, blue: 39 / 255)
    public static let dayStrain = Color(red: 0 / 255, green: 147 / 255, blue: 231 / 255)
    public static let sleep = Color(red: 123 / 255, green: 161 / 255, blue: 187 / 255)

    public static let recoveryHigh = Color(red: 25 / 255, green: 236 / 255, blue: 6 / 255)
    public static let recoveryMedium = Color(red: 255 / 255, green: 222 / 255, blue: 0 / 255)
    public static let recoveryLow = Color(red: 255 / 255, green: 0 / 255, blue: 38 / 255)

    public static let black15 = Color.black.opacity(0.15)
    public static let black20 = Color.black.opacity(0.20)
    public static let black30 = Color.black.opacity(0.30)
    public static let black40 = Color.black.opacity(0.40)
    public static let white20 = Color.white.opacity(0.20)
    public static let white50 = Color.white.opacity(0.50)

    public static func recovery(_ score: Double) -> Color {
        if score >= 67 { return recoveryHigh }
        if score >= 34 { return recoveryMedium }
        return recoveryLow
    }
}
