//
//  ToggleWithTextView.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

import UIKit

class ToggleWithTextView: UIView {
  @Published var currentValue: Bool = false

  let title: String

  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let toggle: UISwitch = {
    let toggle = UISwitch()
    toggle.translatesAutoresizingMaskIntoConstraints = false
    return toggle
  }()

  init(title: String, currentValue: Bool) {
    self.title = title
    super.init(frame: .zero)
    self.currentValue = currentValue
    config()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func config() {
    translatesAutoresizingMaskIntoConstraints = false
    let stackView = UIStackView(arrangedSubviews: [label, toggle])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .horizontal
    stackView.spacing = 20

    label.text = title
    toggle.isOn = currentValue

//        toggle.publisher(for: \.isOn)
//            .receive(on: RunLoop.main, options: nil)
//            .makeConnectable()
//            .assign(to: &$currentValue)

    toggle.addAction(UIAction(handler: { [weak self] _ in
      guard let self = self else {
        return
      }
      self.currentValue = self.toggle.isOn
    }), for: .valueChanged)
    addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

    ])
  }

//    @objc func onToggle() {
//
//    }

  /*
   // Only override draw() if you perform custom drawing.
   // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
       // Drawing code
   }
   */
}
