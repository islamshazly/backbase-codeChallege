//
//  StoryboardConstants.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

// MARK: - StoryBoard Constansts

extension C {
    enum Storyboard: String {
        case main
        
        var name: String {
            return self.rawValue.capitalized
        }
    }
}
