//
//  AccessibilityCase.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import Foundation
import UIKit

enum Item {
  case subItem(title: String, item: [Item])
  case detail(title: String, vc: UIViewController)

  var title: String {
    switch self {
    case let .subItem(title, item):
      return title
    case let .detail(title, vc):
      return title
    }
  }
}

struct DataSource {
  let title: String
  let items: [Item]
}
