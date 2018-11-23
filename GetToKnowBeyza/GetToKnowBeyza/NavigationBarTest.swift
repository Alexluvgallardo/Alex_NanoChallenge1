//
//  NavigationBarTest.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 12/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

class NavigationBarTest: UINavigationBar {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    window?.rootViewController = UINavigationController(rootViewController: UIViewController())
    
    window?.backgroundColor = .magenta
    
    window?.makeKeyAndVisible()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect)   {
        // Drawing code
    }
    */

}
