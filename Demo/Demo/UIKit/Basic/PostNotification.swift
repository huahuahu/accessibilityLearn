//
//  PostNotification.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import Foundation
import UIKit

class TestPostNotificationVC: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .play, primaryAction: UIAction(handler: { _ in
      print("tapped play")
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        UIAccessibility.post(notification: .announcement, argument: "You are entering my app now")
      }
    }), menu: nil)
  }

  @objc func postNotification() {}
}
