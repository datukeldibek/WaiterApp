//
//  TableCell.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct TableCell: View {
    var isBusy: Bool
    var tableNumber: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isBusy ? .gray : .green)
                .frame(width: AppSizes.Size.tableCellSize, height: AppSizes.Size.tableCellSize)
                .cornerRadius(12)
            
            Text(tableNumber)
                .foregroundColor(.white)
                .font(.system(size: 56, weight: .medium))
        }
    }
}
