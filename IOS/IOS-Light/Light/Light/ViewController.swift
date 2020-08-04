//
//  ViewController.swift
//  Light
//
//  Created by Andre Mejia on 2020-04-18.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lightOn = true

    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
        
        button.setTitle(lightOn ? "Turn Off" : "Turn On", for: .normal)
    }
    
}

