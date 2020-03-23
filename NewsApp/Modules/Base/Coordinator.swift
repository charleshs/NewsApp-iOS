//
//  Coordinator.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func startChild(_ coordinator: Coordinator)
    func stop()
    func stopChild(_ coordinator: Coordinator)
    func stopChildren()
}

extension Coordinator {
    
    func startChild(_ coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func stopChild(_ coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) {
            self.childCoordinators.remove(at: index)
        }
    }
    
    func stopChildren() {
        self.childCoordinators.forEach { $0.stopChildren() }
        self.childCoordinators.removeAll()
    }
}
