//
//  ActivityView.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation
import UIKit

class ActivityView: NSObject {
    
    static let shared = ActivityView()
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    func show(from controller: UIViewController) {
        container.frame = controller.view.frame
        container.center = controller.view.center
        container.backgroundColor = .clear
        
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
        loadingView.center = controller.view.center
        loadingView.backgroundColor = UIColor(hex: "000000", alpha: 0.3)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        controller.view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func show(from controller: UIViewController, with frame: CGRect) {
        container.frame = frame
        container.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        container.backgroundColor = .clear
        
        loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
        loadingView.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        loadingView.backgroundColor = UIColor(hex: "000000", alpha: 0.3)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        controller.view.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hide() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
}

extension NSObject {
    class func className() -> String {
        return String(describing: self)
    }
}
