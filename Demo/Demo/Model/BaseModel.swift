////
////  BaseModel.swift
////  Demo
////
////  Created by tigerguo on 2022/3/31.
////
//
// import Foundation
//
// enum BaseCase: String, CaseIterable {
//  case swiftUI
//  case web
//  case uikit
// }
//
// class BaseItem: HItem {
//  var title: String = ""
//
//  init(title: String) {
//    self.title = title
//  }
// }
//
// @objc class BaseModel: NSObject, HTableViewDataSource {
//  var title: String {
//    "Accessibility Demo"
//  }
//
//  var items: [HItem] = BaseCase.allCases.map { BaseItem(title: $0.rawValue) }
// }
