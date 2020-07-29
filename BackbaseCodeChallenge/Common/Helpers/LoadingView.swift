//
//  LoadingView.swift
//  NeugelbTask
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit

// MARK: - LoadingViewable

protocol LoadingViewable {
    func startLoadingIndicator()
    func stopLoadingIndicator()
}

// MARK: - LoadingView

final class LoadingView {
    
    class func showAdded(to view: UIView, topDistance: CGFloat) {
        
        guard view.viewWithTag(C.loadingViewTag) == nil else { return }
        let loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = UIColor.white
        loadingView.tag = C.loadingViewTag
        
        let frame = CGRect( x: 0 , y: 0 , width: 100 , height: 100 )
        let activityIndicatorView = UIActivityIndicatorView(frame: frame)
        activityIndicatorView.center = CGPoint(x: loadingView.center.x,
                                               y: loadingView.center.y - topDistance)
        
        loadingView.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        view.addSubview(loadingView)
    }
    
    class func stopLoadingIndicator(for view: UIView) {
        view.viewWithTag(C.loadingViewTag)?.removeFromSuperview()
    }
    
}

// MARK: - LoadingViewable Default Implementation

extension LoadingViewable where Self: UIViewController {
    
    func startLoadingIndicator() {
        LoadingView.showAdded(to: self.view, topDistance: self.topDistance)
    }
    
    func stopLoadingIndicator() {
        LoadingView.stopLoadingIndicator(for: self.view)
    }
    
    var topDistance : CGFloat {
        get {
            let barHeight = self.navigationController?.navigationBar.frame.height ?? 0
            let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            return barHeight + statusBarHeight
        }
    }
}

// MARK: - UIViewController implements LoadingViewable

extension UIViewController: LoadingViewable {}
