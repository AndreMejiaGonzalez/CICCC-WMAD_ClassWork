//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
    
  let purpleView: UIView = {
    let main = UIView()
    main.frame(forAlignmentRect: CGRect.zero)
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .purple
    return main
  }()
    
  let topBlueView: UIView = {
    let main = UIView()
    main.frame(forAlignmentRect: CGRect.zero)
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .blue
    main.heightAnchor.constraint(equalToConstant: 50).isActive = true
    main.widthAnchor.constraint(equalToConstant: 50).isActive = true
    return main
  }()
    
  let middleBlueView: UIView = {
    let main = UIView()
    main.frame(forAlignmentRect: CGRect.zero)
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .blue
    main.heightAnchor.constraint(equalToConstant: 50).isActive = true
    main.widthAnchor.constraint(equalToConstant: 50).isActive = true
    return main
  }()
    
  let bottomBlueView: UIView = {
    let main = UIView()
    main.frame(forAlignmentRect: CGRect.zero)
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .blue
    main.heightAnchor.constraint(equalToConstant: 50).isActive = true
    main.widthAnchor.constraint(equalToConstant: 50).isActive = true
    return main
  }()
    
    let redView: UIView = {
        let main = UIView()
        main.frame(forAlignmentRect: CGRect.zero)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .red
        main.heightAnchor.constraint(equalToConstant: 50).isActive = true
        main.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return main
    }()
    
    let leftOrangeView: UIView = {
        let main = UIView()
        main.frame(forAlignmentRect: CGRect.zero)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .orange
        main.heightAnchor.constraint(equalToConstant: 30).isActive = true
        main.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return main
    }()
    
    let rightOrangeView: UIView = {
        let main = UIView()
        main.frame(forAlignmentRect: CGRect.zero)
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .orange
        main.heightAnchor.constraint(equalToConstant: 30).isActive = true
        main.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return main
    }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(mainView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
    
    let blueStackView = UIStackView(arrangedSubviews: [topBlueView, middleBlueView, bottomBlueView])
    blueStackView.translatesAutoresizingMaskIntoConstraints = false
    blueStackView.axis = .vertical
    blueStackView.alignment = .center
    blueStackView.distribution = .equalSpacing
    
    view.addSubview(blueStackView)
    NSLayoutConstraint.activate([
        blueStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50),
        blueStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -100),
        blueStackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        blueStackView.widthAnchor.constraint(equalToConstant: 100)
    ])
    
    view.addSubview(purpleView)
    purpleView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -25).isActive = true
    purpleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25).isActive = true
    purpleView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.60, constant: 0).isActive = true
    purpleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    view.addSubview(redView)
    redView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
    redView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
    
    let orangeStackView = UIStackView(arrangedSubviews: [leftOrangeView, rightOrangeView])
    orangeStackView.translatesAutoresizingMaskIntoConstraints = false
    orangeStackView.axis = .horizontal
    orangeStackView.alignment = .center
    orangeStackView.distribution = .equalSpacing
    
    view.addSubview(orangeStackView)
    NSLayoutConstraint.activate([
        orangeStackView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
        orangeStackView.centerYAnchor.constraint(equalTo: redView.centerYAnchor),
        orangeStackView.widthAnchor.constraint(equalToConstant: 90)
    ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
        self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true

      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

