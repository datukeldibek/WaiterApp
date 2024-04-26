//
//  ToolBarView.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct ToolBarView: View {
    let title: String
    
    var body: some View {
        HStack {
            AppImages.getImage(.iconProfile)
            Spacer()
            
            Text(title)
            
            Spacer()
            AppImages.getImage(.iconNotification)
        }
    }
}

#Preview {
    ToolBarView(title: "hello")
}

