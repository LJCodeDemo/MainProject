//
//  DemoViewController.swift
//
//  Created by casa on 2020/2/21.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import A_Extension
import CTMediator

class DemoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "B Demo"
        view.backgroundColor = .red
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(callA), for: .touchUpInside)
        button.setTitle("call A", for: .normal)
        button.frame = CGRect(x: 30, y: 100, width: 50, height: 30)
        view.addSubview(button)
    }
    
    @objc fileprivate func callA() {
        if let vc = CTMediator.sharedInstance().A_demo(name: "From B Call A", callback: { (name) in
            print("\(name)")
        }) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
