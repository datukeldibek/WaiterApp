//
//  Images.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

public enum AppImage: String {
    case tabItemOrders = "PencilLine"
    case tabItemMenu = "Notebook"
    case tabItemNewOrders = "PlusCircle"
    case iconNotification = "notification"
    case iconProfile = "userProfile"
    case iconSearch = "magnifyingGlass"
    
}

public class AppImages {
    public static func getImage(_ image: AppImage) -> Image {
        return Image(
            image.rawValue,
            bundle: Bundle(for: AppImages.self)
        )
    }
    
    public static func getUIImage(_ image: AppImage) -> UIImage? {
        return UIImage(named: image.rawValue, in: Bundle(for: AppImages.self), with: nil)
    }
}


