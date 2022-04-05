//
//  LabelWithText.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

import UIKit

class LabelWithText: UIView {
  @Published var currentValue: String?

  let title: String

  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let textField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.returnKeyType = .done
    return textField
  }()

  init(title: String, currentValue: String?) {
    self.title = title
    self.currentValue = currentValue
    super.init(frame: .zero)
    config()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func config() {
    translatesAutoresizingMaskIntoConstraints = false
    let stackView = UIStackView(arrangedSubviews: [label, textField])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20

    label.text = title
    textField.text = currentValue

    textField.addAction(UIAction(handler: { [weak self] _ in
      guard let self = self else {
        return
      }
      self.currentValue = self.textField.text
    }), for: .editingChanged)

    textField.addAction(UIAction(handler: { _ in
      self.textField.resignFirstResponder()
    }), for: .editingDidEndOnExit)
    addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}
