//
//  ViewController.swift
//  File
//
//  Created by Fidetro on 2018/10/30.
//  Copyright © 2018 karim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        try! File.createFile(appendingPaths: [.documentDirectory,"first","second"], filename: "test.txt", content: nil)
        try! File.removeItem(atPaths: [.documentDirectory,"first"])
    }


}

