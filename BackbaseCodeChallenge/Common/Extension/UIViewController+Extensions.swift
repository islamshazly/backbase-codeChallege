//
//  AlertView.swift
//  TrueCallerAssignment
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2019 IslamElshazly. All rights reserved.
//

import UIKit

protocol StoryboardInitializable: Identifiable {
    static func initFromStoryboard(storyboard: C.Storyboard) -> Self
}

extension StoryboardInitializable where Self: UIViewController {
    static func
        initFromStoryboard(storyboard: C.Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

extension UIViewController: StoryboardInitializable {}

extension UIViewController {
    func showErrorAlert(error: Error) {
        self.showAlert(string: error.localizedDescription)
    }
    
    func showAlert(string: String) {
        let alert = UIAlertController(title: "OPS",
                                      message: string,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
