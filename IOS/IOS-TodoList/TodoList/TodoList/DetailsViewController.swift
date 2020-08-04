//
//  DetailsViewController.swift
//  TodoList
//
//  Created by Andre Mejia on 2020-05-06.
//  Copyright © 2020 Andre Mejia. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var task: Task!
    
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskPriority: UILabel!
    @IBOutlet var taskInfo: UILabel!
    @IBOutlet var checkImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskName.text = task.name
        taskPriority.text = String(task.priority)
        
        if task.isCompleted {
            let attributedString = NSMutableAttributedString(string: task.info)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
            taskInfo.attributedText = attributedString
            checkImage.image = UIImage(named: "circleChecked")
        } else {
            taskInfo.attributedText = nil
            taskInfo.text = task.info
            checkImage.image = UIImage(named: "circle")
        }
    }
}
