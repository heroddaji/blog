//
//  ViewController.swift
//  truyencotich
//
//  Created by daitran on 8/9/15.
//  Copyright © 2015 daitran. All rights reserved.
//

import UIKit

extension UITextView{
    @IBInspectable var dk_Editable:Bool {
        get{
           return editable
        }
        set{
            editable = newValue
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var txtViewStory: UITextView!{
        didSet{
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    var scrollingTimer = NSTimer()
    @IBAction func scroll(sender: UIButton) {
        scrollingTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "startScrolling", userInfo: nil, repeats: true)
        scrollingTimer.fire()

    }
    
    func startScrolling(){
        var currentOffset = txtViewStory.contentOffset
        currentOffset = CGPointMake(currentOffset.x, currentOffset.y + 1)
        txtViewStory.setContentOffset(currentOffset, animated: false)
    }
   
}

