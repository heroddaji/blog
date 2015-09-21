//
//  ViewController.swift
//  blog_multiple_storyboard
//
//  Created by dai on 9/16/15.
//  Copyright © 2015 dai. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loadViewController2(){
        let vc = Utility.loadViewFrom("storyboard2", viewControllerId:"ViewController2")
        presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func loadViewController3(){
        let vc = Utility.loadViewFrom("storyboard3")
        presentViewController(vc, animated: true, completion: nil)
    }


}

