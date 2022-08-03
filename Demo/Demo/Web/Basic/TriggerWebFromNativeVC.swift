//
//  TriggerWebFromNative.swift
//  Demo
//
//  Created by tigerguo on 2022/8/2.
//

import UIKit

class TriggerWebFromNativeVC: WebBasicVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .action, target: self, action: #selector(onClicked))

    }

    @objc func onClicked() {
        webView.evaluateJavaScript("fromNative()") { result, err in
            print("\(result), err: \(err)")
        }
    }
    



}
