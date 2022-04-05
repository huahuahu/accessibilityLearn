//
//  basic.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

import Foundation
import UIKit
import WebKit

class WebBasicVC: UIViewController {
  let htmlString: String

  init(htmlString: String) {
    self.htmlString = htmlString
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let webView: WKWebView = {
    let webview = WKWebView()
    webview.translatesAutoresizingMaskIntoConstraints = false
    return webview
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(webView)

    NSLayoutConstraint.activate([
      view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: webView.leadingAnchor), view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: webView.trailingAnchor),
      view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: webView.topAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: webView.bottomAnchor),
    ])

    loadHtml()
  }

  private func loadHtml() {
    webView.loadHTMLString(htmlString, baseURL: nil)
  }
}
