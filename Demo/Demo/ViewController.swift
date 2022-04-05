//
//  ViewController.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import UIKit

class ViewController: UIViewController {
  let cellReuseID = "cellReuseID"
  var dataSource: DataSource = .init(title: "Demo", items: [
    .subItem(title: "web", item: WebItems.allCases.map(\.item)),
    .subItem(title: "uikit", item: UIKitItems.allCases.map(\.item)),
    .subItem(title: "swiftui", item: []),
  ])
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
    return tableView
  }()

//  @available(*, unavailable)
//  required init?(coder _: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    title = dataSource.title
    view.addSubview(tableView)

    // Do any additional setup after loading the view.
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    dataSource.items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
    cell.textLabel?.text = dataSource.items[indexPath.row].title
    return cell
  }

  func numberOfSections(in _: UITableView) -> Int {
    1
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = dataSource.items[indexPath.row]
    switch item {
    case let .detail(title: title, vc: vcClosure):
      let vc = vcClosure()
      vc.title = title
      navigationController?.pushViewController(vc, animated: true)
    case let .subItem(title: title, item: items):
      let vc = ViewController()
      vc.dataSource = DataSource(title: title, items: items)
      navigationController?.pushViewController(vc, animated: true)
    }

    tableView.deselectRow(at: indexPath, animated: true)
  }
}
