//
//  PageViewController.swift
//  GetToKnowBeyza
//
//  Created by Alex Cheung on 11/11/2018.
//  Copyright © 2018 Alex Cheung. All rights reserved.
//

import UIKit

var mainVC =  PageViewController()

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
//    var imageView: UIImageView?
    
    var pageControl = UIPageControl()
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc("AboutBeyzaController")
                ,self.newVc("AboutBeyza2Controller")
                ,self.newVc("AboutBeyza3Controller")
                ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let win:UIWindow = UIApplication.shared.delegate!.window!!
        win.backgroundColor = .white
        
        self.delegate = self
        self.dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward, animated: true, completion: nil)
        }
        
        

        configurePageControl()
        
    }

    
    func configurePageControl(){
        //property of pageControl
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50 , width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = UIColor(displayP3Red: 120/255, green: 235/255, blue: 1, alpha: 1)
        self.view.addSubview(pageControl)
    }
    
    func newVc(_ viewController: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    //pageviewcontroller before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }   
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
//            return orderedViewControllers.last // for infitite scrolling
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
//        showNavigationBar()
        return orderedViewControllers[previousIndex]
        
    }
    
    //pageviewcontrollerafter
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard orderedViewControllers.count != nextIndex else {
//            return orderedViewControllers.first
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    //delegate page control
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    //segue for unwinding
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
        // Do nothing
    }
    
}
    


