//
//  Builder.swift
//  CHECK24
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 islam Elshazly. All rights reserved.
//

import UIKit

// MARK: - Builder

protocol Builder {
    associatedtype ViewType: UIViewController
    func build() -> ViewType
    func buildWithNavigationController() -> UINavigationController
}
 
// MARK: - Builder Default Implementation

extension Builder {
    func buildWithNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: build())
    }
}
