//
//  ViewController.swift
//  SnackBar
//
//  Created by Andre Mejia on 2020-05-13.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var navBarHeight: NSLayoutConstraint!
    @IBOutlet var plusButton: UIButton!
    
    var navBarIsOpen = false
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        if !navBarIsOpen {
            view.removeConstraint(navBarHeight)
            navBarHeight = navBarHeight.constraintWithMultiplier(0.25)
            view.addConstraint(navBarHeight)
        } else {
            view.removeConstraint(navBarHeight)
            navBarHeight = navBarHeight.constraintWithMultiplier(0.1)
            view.addConstraint(navBarHeight)
        }
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .allowUserInteraction, animations: {
            self.plusButton.transform = self.plusButton.transform.rotated(by: 45 * (CGFloat.pi / 180))
            self.view!.layoutIfNeeded()
        }, completion: nil)
        navBarIsOpen.toggle()
    }
    
}

