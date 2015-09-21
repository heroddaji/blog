//
//  Utility.swift
//  blog_multiple_storyboard
//
//  Created by dai on 9/16/15.
//  Copyright © 2015 dai. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func loadViewFrom(storyboardId:String, viewControllerId:String? = nil) -> UIViewController {
        let sb = UIStoryboard(name: storyboardId, bundle: nil)
        var vc:UIViewController!
        
        if viewControllerId == nil {
            vc = sb.instantiateInitialViewController()
        }else{
            vc = sb.instantiateViewControllerWithIdentifier(viewControllerId!)
        }
        
        return vc
    }
}
