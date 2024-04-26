//
//  Colors.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

public enum PrimaryColor: UInt32 {
    case clear = 0
    case primaryPurple = 0x8876C5
    case backgroundColor = 0xF6F6F6
    case searchbarGray = 0xF2F2F2
}

public class OpacityColor {
    public static let opacity1: CGFloat = 1.0
    public static let opacity80: CGFloat = 0.8
    public static let opacity60: CGFloat = 0.6
    public static let opacity50: CGFloat = 0.5
    public static let opacity40: CGFloat = 0.4
    public static let opacity30: CGFloat = 0.3
    public static let opacity20: CGFloat = 0.2
    public static let opacity10: CGFloat = 0.1
    public static let opacity08: CGFloat = 0.08
    public static let opacity0001: CGFloat = 0.001
}

public class AppColors {
    public static func getColor(
        _ color: PrimaryColor,
        opacity: CGFloat = OpacityColor.opacity1
    ) -> Color {

        guard color != .clear else {
            return Color.clear
        }

        return Color(hex: color.rawValue, opacity: opacity)
    }
}

extension Color {
    init(hex: UInt32, opacity: CGFloat = 1.0) {
        if #available(iOS 15.0, *) {
            self.init(
                uiColor: .init(
                    red: CGFloat(0xFF & (hex >> 0x10)) / 0xFF,
                    green: CGFloat(0xFF & (hex >> 0x08)) / 0xFF,
                    blue: CGFloat(0xFF & (hex >> 0x00)) / 0xFF,
                    alpha: opacity
                )
            )
        } else {
            self.init(
                UIColor(
                    red: CGFloat(0xFF & (hex >> 0x10)) / 0xFF,
                    green: CGFloat(0xFF & (hex >> 0x08)) / 0xFF,
                    blue: CGFloat(0xFF & (hex >> 0x00)) / 0xFF,
                    alpha: opacity
                ).cgColor
            )
        }
    }
}

public extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        let a, r, g, b: UInt64
        
        Scanner(string: hex).scanHexInt64(&int)
        
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
