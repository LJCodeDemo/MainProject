//
//  ViewController.swift
//  MainProject
//
//  Created by lingjie on 2020/10/22.
//

import UIKit
import A_Extension
import B_Extension
import CTMediator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }

    func setupUI() {
        let buttons: [(String, Selector, CGFloat)] = [
            ("Call A", #selector(showA), 100),
            ("Call B", #selector(showB), 140)
        ]
        
        for i in 0..<buttons.count {
            let (title, action, y) = buttons[i]
            addButton(title: title, action: action, y: y)
        }
    }
    
    func addButton(title: String, action: Selector, y: CGFloat) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: 30, y: y, width: 50, height: 30)
        button.addTarget(self, action: action, for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func showA() {
        if let vc = CTMediator.sharedInstance().A_demo(name: "A-LJ", callback: { (name) in
            print("callback->\(name)")
        }) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func showB() {
        if let vc = CTMediator.sharedInstance().B_demo(name: "B-LJ", callback: { (name) in
            print("callback->\(name)")
        }) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

