//
//  backgroundViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 12/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

class firstbackgroundViewController: UIViewController {

    var imageView: UIImageView?
    var have_bg: Bool = false
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        
        super.viewDidLoad()
        showNavigationBar()
        
        addingImageBackground()
   
        
//            if let foundView = view.viewWithTag(200) {
////                foundView.backgroundColor = .black
//
////                print(foundView)
////                addingImageBackground(foundView)
////    //            self.view.bringSubviewToFront(foundView)
////                foundView.layer.zPosition = 10
//            }
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
        
        
//        imageView!.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//        imageView!.bounds = CGRect(x: 0, y: 0, width: 200, height: 500)
        
        imageView!.alpha = 0.1
        imageView!.tag = 100
        imageView!.contentMode = .scaleAspectFill
        
        
        self.view.addSubview(imageView!)
        self.view.sendSubviewToBack(imageView!)
    }
 
    

}


