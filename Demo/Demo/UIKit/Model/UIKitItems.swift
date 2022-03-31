//
//  UIkitItems.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import Foundation
import UIKit

enum UIKitItems: String, CaseIterable {
  case text

  var item: Item {
    switch self {
    case .text:
      return .detail(title: rawValue, vc: UIViewController())
    }
  }
}
