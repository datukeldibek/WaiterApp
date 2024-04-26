//
//  TablesView.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct TablesView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Rectangle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .cornerRadius(3)
                
                Text("Занято")
                    .font(.system(size: 16))
                    .padding(.trailing, 38)
                
                Rectangle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.green)
                    .cornerRadius(3)
                
                Text("Свободно")
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.bottom, 16)
            
            HStack(spacing: 8) {
                TableCell(isBusy: true, tableNumber: "1")
                TableCell(isBusy: false, tableNumber: "2")
                TableCell(isBusy: false, tableNumber: "3")
            }
            HStack {
                TableCell(isBusy: true, tableNumber: "4")
                TableCell(isBusy: false, tableNumber: "5")
                TableCell(isBusy: true, tableNumber: "6")
            }
            Spacer()
        }
    }
}

