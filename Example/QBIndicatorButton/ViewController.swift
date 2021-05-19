//
//  ViewController.swift
//  QBIndicatorButton
//
//  Created by sjc-bui on 05/19/2021.
//  Copyright (c) 2021 sjc-bui. All rights reserved.
//

import UIKit
import QBIndicatorButton

class ViewController: UIViewController {

    @IBOutlet weak var button1: QBIndicatorButton!
    @IBOutlet weak var button2: QBIndicatorButton!
    @IBOutlet weak var button3: QBIndicatorButton!
    @IBOutlet weak var button4: QBIndicatorButton!
    @IBOutlet weak var button5: QBIndicatorButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        button1.tag = 1
        button1.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)

        button2.tag = 2
        button2.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)

        button3.tag = 3
        button3.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)

        button4.tag = 4
        button4.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        
        button5.tag = 5
        button5.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
    }

    @objc func btnClick(_ sender: QBIndicatorButton) {
        sender.start {
            print("button \(sender.tag) is starting...")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sender.stop {
                print("button \(sender.tag) is stopping...")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
