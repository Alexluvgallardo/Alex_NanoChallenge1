//
//  backgroundViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 12/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

class backgroundViewController: UIViewController {

    var imageView: UIImageView?
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        
        super.viewDidLoad()
        showNavigationBar()
        
        addingImageBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        removeSubview()
    }
    
    func addingImageBackground(){
//        imageView = UIImageView(image: #imageLiteral(resourceName: "MyBackground_bg"))
        
        imageView = UIImageView(frame: view.bounds) //not overlapping
        imageView = UIImageView(image: UIImage(named:"MyBackground_bg")!)
        
        imageView!.alpha = 0.1
        imageView!.tag = 100
        imageView!.contentMode = .scaleAspectFill
        
        
        self.view.addSubview(imageView!)
        self.view.sendSubviewToBack(imageView!)
    }
}


