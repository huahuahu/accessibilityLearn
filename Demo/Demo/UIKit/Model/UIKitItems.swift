//
//  UIkitItems.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import Foundation
import UIKit

enum UIKitItems: String, CaseIterable {
  case postNotification
  case tableViewCell
  case basicAttributes
  case rotor
case focus
    case customeAccessibilityElements

  var item: Item {
    switch self {
    case .postNotification:
      return .detail(title: rawValue, vc: { TestPostNotificationVC() })
    case .tableViewCell:
      return .detail(title: rawValue, vc: { TestTableViewVC() })
    case .basicAttributes:
      return .detail(title: rawValue, vc: { BasicAcceViewController() })
    case .rotor:
      return .detail(title: rawValue, vc: {
        RotorDemoViewController()
      })
    case .focus:
        return .detail(title: rawValue, vc: {FocusVC()})
    case .customeAccessibilityElements:
        return .detail(title: rawValue, vc: { CustomAccessibilityElementsVC() })
    }
  }
}
