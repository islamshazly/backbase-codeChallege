//
//  Utility.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 29/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit

class Utility {
    // MARK: -
    class func setupAppAppearance() {
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.09328407794, green: 0.1158842519, blue: 0.2558170855, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1138274744, green: 0.632240355, blue: 0.8775618672, alpha: 1)
        let navigationBarFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        let barButtonFont = UIFont.systemFont(ofSize: 16)
        UINavigationBar.appearance().titleTextAttributes = [.font: navigationBarFont,
                                                            .foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        UIBarButtonItem.appearance().setTitleTextAttributes([.font: barButtonFont], for: .normal)
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
    }
}
