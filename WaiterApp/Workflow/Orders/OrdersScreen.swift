//
//  OrdersScreen.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct OrdersScreen: View {
    @State var selectedActionTab: Int = 0
    var body: some View {
        VStack(spacing: .zero) {
            ToolBarView(title: "Заказы")
                .padding(.bottom, 31)
            
            TabContent(selection: $selectedActionTab)
                .padding(.bottom, 24)
            
            TabView(selection: $selectedActionTab.animation()) {
                TablesView()
                .tag(0)
                Text("2")
                .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(AppColors.getColor(.backgroundColor))
    }
}

#Preview {
    OrdersScreen()
}

