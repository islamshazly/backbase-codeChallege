//
//  Identifiable.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit

// MARK: - Identifiable

protocol Identifiable {
    static var identifier: String { get }
}

// MARK: - Identifiable Default implementation

extension Identifiable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
