//
//  CustomTabbar.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct CustomTabbar: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack{
            HStack{
                Button{
                    selectedTab = 0
                } label: {
                    AppImages.getImage(.tabItemOrders)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 0 ? .accentColor : .gray)
                        .frame(width: 35, height: 35)
                }
                
                Spacer()
                
                Button{
                    selectedTab = 1
                } label: {
                    AppImages.getImage(.tabItemMenu)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 1 ? .accentColor : .gray)
                        .frame(width: 35, height: 35)
                }
                
                Spacer()
                
                Button{
                    selectedTab = 2
                } label: {
                    AppImages.getImage(.tabItemNewOrders)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == 2 ? .accentColor : .gray)
                        .frame(width: 35, height: 35)
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 70)
        .background(.white)
        .cornerRadius(35)
        .padding(.horizontal, 33)
    }
}

#Preview {
    CustomTabbar(selectedTab: .constant(0))
}



