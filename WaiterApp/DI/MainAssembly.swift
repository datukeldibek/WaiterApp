//
//  AuthAssembly.swift
//  WaiterApp
//
//  Created by Yryskeldi Nurlanbek on 27/4/24.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class MainAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(AuthViewModelType.self, initializer: MainViewModel.init)
            .inObjectScope(.transient)
        
        container.register(MainScreen.self) { r in
            MainScreen(vm: r~>)
        }.inObjectScope(.container)
    }
}
