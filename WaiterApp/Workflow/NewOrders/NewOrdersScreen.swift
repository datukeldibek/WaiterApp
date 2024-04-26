//
//  NewOrdersScreen.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct NewOrdersScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            ToolBarView(title: " Новые заказы")
                .padding(.bottom, 24)
            
            Text("Выберете стол")
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 24)
            
            TablesView()
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(AppColors.getColor(.backgroundColor))
    }
}

#Preview {
    NewOrdersScreen()
}
