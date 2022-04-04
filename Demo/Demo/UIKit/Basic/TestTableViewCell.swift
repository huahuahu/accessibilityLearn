//
//  TestTableViewCell.swift
//  Demo
//
//  Created by tigerguo on 2022/3/31.
//

import Foundation
import UIKit

// 1. Default behavior for cells is as follows: VO sets focus on the whole cell and reads all the labels in one go. The focus is then moved in turn to every button.
//
// 2. What if I don’t want the cell to be read as a whole at all, just all the items in turn?
//  approach a: You should specify isAccessibilityElement values for all subviews explicitly. Every label left out of this will be read as part of the whole cell’s accessibiltiyLabel. If all the elements are accessible on their own, there’s no need for the whole cell’s accessibiltiyLabel at all, and it isn’t read.
//  approach b: Or you could specify all the elements you want to be read separately in accessibilityElements of the cell itself for the same result.
//
// 3. What if I want my own accessibility label for the whole cell?
// – Set it on cell itself:
//
// cell.isAccessibilityElement = true (default is false)
// cell.accessibilityLabel = "Posted by \(nameLabel.text), they say: \(commentLabel.text)"

// 4. What if I like the default behaviour but want to exclude just a couple of elements?
// – Just set isAccessibilityElement = false to items you don’t want.

// Seem logic
// accessibilityElements?
//
class HLabel: UILabel {
  override var isAccessibilityElement: Bool {
    get {
      super.isAccessibilityElement
    }
    set {
      print("set isAccessibilityElement to \(newValue)")
      super.isAccessibilityElement = newValue
    }
  }
}

private class HCell: UITableViewCell {
//  override var accessibilityElements: [Any]? {
//    set {
//      super.accessibilityElements = newValue
//    }
//    get {
//      print("\(super.accessibilityElements)")
//      return [upperLabel]
//    }
//  }

  let upperLabel: HLabel = {
    let label = HLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .red
    label.font = .preferredFont(forTextStyle: .body)
    return label
  }()

  let lowerLabel: HLabel = {
    let label = HLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .yellow
    label.font = .preferredFont(forTextStyle: .callout)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

//        upperLabel.isAccessibilityElement = true
//        lowerLabel.isAccessibilityElement = true

    let stackView = UIStackView(arrangedSubviews: [upperLabel, lowerLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stackView)
    stackView.axis = .vertical

    NSLayoutConstraint.activate([
      contentView.readableContentGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      contentView.readableContentGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      contentView.topAnchor.constraint(equalTo: stackView.topAnchor),
      contentView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
    ])
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setUp(with str: String) {
    upperLabel.text = "Upper \(str)"
    print("upperlable isAccessibilityElement \(isAccessibilityElement)")
    lowerLabel.text = "lower \(str)"
//      self.isAccessibilityElement = true
//      self.accessibilityLabel = "\(upperLabel.text) \(lowerLabel.text)"
  }
}

class TestTableViewVC: UIViewController {
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(HCell.self, forCellReuseIdentifier: "test")
    tableView.estimatedRowHeight = UITableView.automaticDimension
    return tableView
  }()

  let items = (0 ... 20).map(\.description)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension TestTableViewVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! HCell

    cell.setUp(with: items[indexPath.row])
    return cell
  }
}
