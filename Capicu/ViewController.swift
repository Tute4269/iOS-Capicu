//
//  ViewController.swift
//  Capicu
//
//  Created by Anthony Benitez on 1/31/17.
//  Copyright © 2017 SymphoLife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(0), for: UIBarMetrics.default)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

