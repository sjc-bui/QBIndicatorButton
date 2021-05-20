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
        button1.touch({ btn1 in
            self.btnClick(btn1)
        }, for: .touchUpInside)

        button2.tag = 2
        button2.touch({ btn2 in
            self.btnClick(btn2)
        }, for: .touchUpInside)

        button3.tag = 3
        button3.touch({ btn3 in
            self.btnClick(btn3)
        }, for: .touchUpInside)

        button4.tag = 4
        button4.touch({ btn in
            self.btnClick(btn)
        }, for: .touchUpInside)

        button5.tag = 5
        button5.touch({ btn5 in
            btn5.start {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    btn5.stop()
                }
            }
        }, for: .touchUpInside)
    }

    func btnClick(_ sender: QBIndicatorButton) {
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
