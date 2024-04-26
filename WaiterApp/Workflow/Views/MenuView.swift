//
//  MenuView.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct MenuView: View {
    @State var text: String = ""
    var body: some View {
        SearchBar(text: $text, placeHolder: "Поиск")
        
        ScrollView(showsIndicators: false) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(0...10, id: \.self) { _ in
                        Rectangle()
                            .frame(width: 79)
                            .cornerRadius(12)
                            .foregroundColor(.yellow)
                    }
                }
                .frame(height: 32)
            }
            
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    MenuView()
}


