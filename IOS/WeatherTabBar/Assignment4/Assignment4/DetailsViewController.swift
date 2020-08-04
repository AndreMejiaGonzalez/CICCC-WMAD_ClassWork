//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by Andre Mejia on 2020-04-24.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var city: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let countryLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 250, width: 100, height: 50))
        countryLabel.text = "Country"
        countryLabel.textAlignment = .center
        countryLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let flag = UILabel(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 220, width: 100, height: 100))
        flag.text = city.icon
        flag.textAlignment = .center
        flag.font = UIFont(name: "Helvetica Neue", size: 50)
        
        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 120, width: 100, height: 50))
        cityLabel.text = "City"
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let cityName = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 70, width: 200, height: 50))
        cityName.text = city.name
        cityName.textAlignment = .center
        cityName.font = UIFont(name: "Helvetica Neue", size: 24)
        
        let tempLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 60, y: view.bounds.height / 2, width: 120, height: 50))
        tempLabel.text = "Temperature"
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let temp = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 + 60, width: 200, height: 50))
        temp.text = String(city.temp) + "°C"
        temp.textAlignment = .center
        temp.font = UIFont(name: "Helvetica Neue", size: 24)
        
        let summaryLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 60, y: view.bounds.height / 2 + 110, width: 120, height: 50))
        summaryLabel.text = "Summary"
        summaryLabel.textAlignment = .center
        summaryLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        
        let summary = UILabel(frame: CGRect(x: view.bounds.width / 2 - 102, y: view.bounds.height / 2 + 170, width: 200, height: 50))
        summary.text = city.summary
        summary.textAlignment = .center
        summary.font = UIFont(name: "Helvetica Neue", size: 24)
        
        view.addSubview(countryLabel)
        view.addSubview(flag)
        view.addSubview(cityLabel)
        view.addSubview(cityName)
        view.addSubview(tempLabel)
        view.addSubview(temp)
        view.addSubview(summaryLabel)
        view.addSubview(summary)
    }

}
