//
//  ViewController.swift
//  Demo
//
//  Created by Cao Phuoc Thanh on 10/22/20.
//  Copyright © 2020 Cao Phuoc Thanh. All rights reserved.
//

import UIKit
import AccountListView

class ViewController: UIViewController {
    
    let listView: AccountHorizontalListView = {
        return AccountHorizontalListView(items: [
            ("iCloud", UIImage.add),
            ("Google", UIImage.add),
            ("Yahoo", UIImage.add),
            ("Facebook", UIImage.add),
            ("LinkedIn", UIImage.add),
            ("Apple", UIImage.add),
            ("iCloud", UIImage.add),
            ("iCloud", UIImage.add)
        ])
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view.addSubview(listView)
        self.listView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v]-0-|", options: [], metrics: nil, views: ["v": listView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v(80)]-0-|", options: [], metrics: nil, views: ["v": listView]))
        
        // Action
        self.listView.didTabOnChange = { index in
            print("didTabOnChange:", index)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

