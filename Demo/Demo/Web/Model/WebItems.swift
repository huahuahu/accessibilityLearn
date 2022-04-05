//
//  WebItems.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

import Foundation

enum WebItems: String, CaseIterable {
  case basic
  case divAsButton

  var item: Item {
    switch self {
    case .basic:
      return .detail(title: rawValue, vc: { WebBasicVC(htmlString: htmlString) })
    case .divAsButton:
      return .detail(title: rawValue, vc: { WebBasicVC(htmlString: htmlString) })
    }
  }

  var htmlString: String {
    switch self {
    case .basic:
      return htmlFrom(file: "Basic")
    case .divAsButton:
      return htmlFrom(file: "divButton")
    }
  }

  func htmlFrom(file: String) -> String {
    guard let url = Bundle.main.url(forResource: file, withExtension: "html"),
          let str = try? String(contentsOf: url)
    else {
      fatalError("no html from \(file)")
    }
    return str
  }
}
