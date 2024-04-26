//
//  SearchBar.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

public struct SearchBar: View {
    @Binding private var text: String
    private let placeHolder: String
    private let isEnable: Bool

    public init(
        text: Binding<String>,
        isEnable: Bool = true,
        placeHolder: String
    ) {
        self._text = text
        self.placeHolder = placeHolder
        self.isEnable = isEnable
    }
    
    public var body: some View {
        HStack {
            TextField("",
                    text: $text,
                    prompt: Text(placeHolder)
                        .foregroundColor(.gray)
            )
                .foregroundColor(.black)
                .disabled(!isEnable)
                .font(.system(size: 16, weight: .medium))
                .padding(.horizontal, 40)
                .overlay(
                    HStack {
                        AppImages.getImage(.iconProfile)
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                        
                        if !text.isEmpty {
                            Button(action: {
                                text.removeAll()
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 16)
                            })
                           
                        }
                       
                    }
                )
        }
        .frame(height: 50)
        .background(AppColors.getColor(.searchbarGray))
        .cornerRadius(10)
    }
}

#Preview {
    SearchBar(text: .constant("hello"), placeHolder: "placeholder")
}
