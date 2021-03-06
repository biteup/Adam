//
//  RightCutomSegue.swift
//  adam
//
//  Created by Kittikorn Ariyasuk on 7/5/15.
//  Copyright (c) 2015 gobbl. All rights reserved.
//

import UIKit

class RightCustomSegue: UIStoryboardSegue {
   
    override func perform() {
        var sourceVCView = self.sourceViewController.view as UIView!
        var destinationVCView = self.destinationViewController.view as UIView!
        
        if let tabBarController = self.sourceViewController.tabBarController as UITabBarController? {
            sourceVCView = tabBarController.view as UIView
        }
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        destinationVCView.frame = CGRectMake(screenWidth, 0.0, screenWidth, screenHeight)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(destinationVCView, aboveSubview: sourceVCView)
        
        
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                sourceVCView.frame         = CGRectOffset(sourceVCView.frame, -screenWidth, 0.0)
                destinationVCView.frame    = CGRectOffset(destinationVCView.frame, -screenWidth, 0.0)
        }) { (finished) -> Void in
            self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController, animated:false, completion: nil)
        }
        
    }
}
