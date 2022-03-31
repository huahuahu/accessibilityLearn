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

  var item: Item {
    switch self {
    case .postNotification:
      return .detail(title: rawValue, vc: TestPostNotificationVC())
    }
  }
}
