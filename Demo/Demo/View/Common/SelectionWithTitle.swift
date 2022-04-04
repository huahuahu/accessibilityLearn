//
//  SelectionWithTitle.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

protocol SelectableValue: Equatable {
  var title: String { get }
}

import UIKit

class SelectionWithTitle<T: SelectableValue>: UIView {
  @Published var currentValue: T

  let title: String

  let allValues: [T]

  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var selectionButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.setTitleColor(.label, for: .normal)
    return button

  }()

  init(title: String, currentValue: T, allValues: [T]) {
    self.title = title
    self.currentValue = currentValue
    self.allValues = allValues
    super.init(frame: .zero)

    assert(allValues.contains(currentValue))
    config()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func config() {
    translatesAutoresizingMaskIntoConstraints = false
    let stackView = UIStackView(arrangedSubviews: [label, selectionButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 20

    label.text = title

    selectionButton.showsMenuAsPrimaryAction = true
    selectionButton.menu = UIMenu(title: title, image: nil, identifier: nil, options: .displayInline, children: getMenu())
    selectionButton.setTitle(currentValue.title, for: .normal)

    addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

    ])
  }

  func getMenu() -> [UIAction] {
    allValues.map { value in
      UIAction(title: value.title) { _ in
        self.currentValue = value
        self.selectionButton.setTitle(value.title, for: .normal)
      }
    }
  }
}
