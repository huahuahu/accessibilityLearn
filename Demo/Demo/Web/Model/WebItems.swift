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
  case imageAlt
  case tabbedInfo
  case ariaDisable
  case ariaAlert

  var item: Item {
    switch self {
    case .basic:
      return .detail(title: rawValue, vc: { WebBasicVC(htmlString: htmlString) })
    case .divAsButton:
      return .detail(title: rawValue, vc: { WebBasicVC(htmlString: htmlString) })
    case .imageAlt, .tabbedInfo, .ariaDisable, .ariaAlert:
      return .detail(title: rawValue, vc: { WebBasicVC(htmlString: htmlString) })
    }
  }

  var htmlString: String {
    switch self {
    case .basic:
      return htmlFrom(file: "Basic")
    case .divAsButton:
      return htmlFrom(file: "divButton")
    case .imageAlt:
      return htmlFrom(file: "imageAlt")
    case .tabbedInfo:
      return htmlFrom(file: "tabbedInfo")
    case .ariaDisable:
      return htmlFrom(file: "aria-disable")
    case .ariaAlert:
      return htmlFrom(file: "aria-alert")
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
