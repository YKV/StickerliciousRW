//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Yevhen Kim on 2016-10-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    @IBAction func handleChocoholicChanged(_ sender: UISwitch) {
        for vc in childViewControllers {
            if let vc = vc as? Chocoholicable {
                vc.setChocoholic(sender.isOn)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
