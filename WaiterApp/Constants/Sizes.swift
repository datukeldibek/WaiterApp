//
//  Sizes.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import Foundation
import SwiftUI

public class AppSizes {
    
    public enum CornerRadius {
        public static let corner4: CGFloat = 4
        public static let corner1: CGFloat = 1
        public static let corner3: CGFloat = 3
        public static let corner5: CGFloat = 5
        public static let standartCorner: CGFloat = 8
        public static let corner7: CGFloat = 7
        public static let corner10: CGFloat = 10
        public static let corner12: CGFloat = 12
        public static let corner16: CGFloat = 16
        public static let corner20: CGFloat = 20
        public static let corner100: CGFloat = 100
        public static let corner30: CGFloat = 30
        public static let corner32: CGFloat = 32
        public static let corner40: CGFloat = 40
    }
    
    public enum Blur {
        public static let blur5: CGFloat = 5
    }

    public static let pinBoxWidth: CGFloat = 58
    public static let pinBoxHeight: CGFloat = 64
    
    public static let checkBoxWidth: CGFloat = 24
    public static let checkBoxHeight: CGFloat = 24
    
    public static let pinCircleWidth: CGFloat = 10
    public static let pinCircleHeight: CGFloat = 10
    
    public static let buttonHeight: CGFloat = 49
    
    public static let welcomeButtonWidth: CGFloat = 50
    public static let welcomeButtonHeight: CGFloat = 50
    
    public enum Size {
        public static let deviceWidth: CGFloat = UIScreen.main.bounds.width
        public static let deviceHeight: CGFloat = UIScreen.main.bounds.height
        
        public static let tableCellSize: CGFloat = (UIScreen.main.bounds.width - 48) / 3
        
    }
    
    public static var otpBoxWidth: CGFloat = UIScreen.main.bounds.width / 6
    public static var otpBoxHeight: CGFloat = UIScreen.main.bounds.height / 5.5
    
    public static let windowWidth: CGFloat = UIScreen.main.bounds.width
    public static let windowHeight: CGFloat = UIScreen.main.bounds.height
    public static let fullScreenBottomSheetHeight = windowHeight * 0.95

    public static func setWidth(padding: CGFloat) -> CGFloat {
        UIScreen.main.bounds.width - padding
    }

    public init() {}

    public static let transferTypeSheet: CGFloat = windowHeight / 3
    public static let greenBottomSheetHeight: CGFloat = 200
    public static let redBottonSheetHeight: CGFloat = windowHeight / 3
    public static let redOneButtonSheetHeight: CGFloat = windowHeight / 4
    public static let transfersCustomBottomSheetHeight: CGFloat = UIScreen.main.bounds.size.height / 3.5
    public static let redBottomSheetHeight: CGFloat = windowHeight/3
}

public enum AppSizeEnum: CGFloat {
    case size932 = 932
    case size896 = 896
    case size844 = 844
    case size812 = 912
    case size736 = 736
    case size667 = 667
    case size320 = 320
    case size300 = 300
    case size280 = 280
    case size265 = 265
    case size200 = 200
    case size180 = 180
    case size140 = 140
    case size120 = 120
    case size100 = 100
    case size88 = 88
    case size80 = 80
    case size75 = 75
    case size74 = 74
    case size68 = 68
    case size64 = 64
    case size60 = 60
    case size58 = 58
    case size50 = 50
    case size48 = 48
    case size44 = 44

    case size40 = 40
    case size38 = 38
    case size37_5 = 37.5
    case size35 = 35
    case size34 = 34
    case size32 = 32
    case size30 = 30
    case size28 = 28
    case size25 = 25
    case size24 = 24
    case size22 = 22
    case size20 = 20
    case size18 = 18
    case size16 = 16
    case size15 = 15
    case size14 = 14
    case size12 = 12
    case size10 = 10
    case size6 = 6
}

