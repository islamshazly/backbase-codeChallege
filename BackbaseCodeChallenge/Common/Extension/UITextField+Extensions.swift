//
//  UITextField+Publisher.swift
//  CombineDemo
//
//  Created by Michal Cichecki on 03/07/2019.
//  Copyright © 2019 codeuqest. All rights reserved.
//

import UIKit
import Combine

extension UITextField {
    
    enum Direction {
        case left
        case right
    }

    var textDidChangePublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .map { $0.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
    
    func addPadding(By value: CGFloat, for direction: Direction) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: frame.height))
        switch direction {
        case .left:
            leftView = paddingView
            leftViewMode = .always
        case .right:
            rightView = paddingView
            rightViewMode = .always
        }
    }
    
    func addPaddingIcon(_ image: UIImage, padding: CGFloat, for direction: Direction) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        let viewSize = CGSize(width: image.size.width + padding, height: image.size.height)
        switch direction {
        case .left:
            leftView = imageView
            leftView?.frame.size = viewSize
            leftViewMode = .always
        case .right:
            rightView = imageView
            rightView?.frame.size = viewSize
            rightViewMode = .always
        }
    }
}
