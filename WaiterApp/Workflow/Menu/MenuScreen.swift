//
//  MenuScreen.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        VStack {
            ToolBarView(title: "Меню")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(AppColors.getColor(.backgroundColor))
    }
}

#Preview {
    MenuScreen()
}

