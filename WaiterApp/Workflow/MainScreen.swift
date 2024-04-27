//
//  MainScreen.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

struct MainScreen: View {
    
    @State var selectedTeb: Int = 0
    
    // MARK: - Injection))))))))))))))
    lazy var storage = TransientStorageService()
    lazy var authService = AuthApiService(keyValueStore: storage)
    lazy var viewModel = MainViewModel(authService: authService)
    
    init() {
        viewModel.authorizeUser(user: SignInRequest(phoneNumber: "+996559009814")) { result in
            result
        }
    }
    
    var body: some View {
        ZStack {
            
            switch selectedTeb {
            case 0:
                OrdersScreen()
            case 1:
                MenuScreen()
            case 2:
                NewOrdersScreen()
                
            default:
                OrdersScreen()
            }
            
            
            CustomTabbar(selectedTab: $selectedTeb)
                .offset(y: UIScreen.main.bounds.height / 2 - 70)
        }
        .frame(maxWidth: .infinity)
        .background(AppColors.getColor(.backgroundColor))
    }
}



