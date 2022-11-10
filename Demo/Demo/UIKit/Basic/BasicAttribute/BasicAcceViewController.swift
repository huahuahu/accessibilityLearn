//
//  BasicAcceViewController.swift
//  Demo
//
//  Created by tigerguo on 2022/4/4.
//

import Combine
import UIKit

class BasicAcceViewController: UIViewController {
//    var controlIsAccessibilityElement: Bool = false

  private var cancallebles = Set<AnyCancellable>()

  lazy var traitsSelector = SelectionWithTitle(title: "traits", currentValue: UIAccessibilityTraits.button, allValues: UIAccessibilityTraits.testTraints)

  lazy var lableEditor = LabelWithText(title: "label", currentValue: uiControl.accessibilityLabel)

  lazy var isAccessibilityToggle = ToggleWithTextView(title: "isAccessibilityElement", currentValue: true)

  lazy var uiControl: UIButton = {
    let control = UIButton()
    control.setTitle("Test", for: .normal)
    control.setTitleColor(.label, for: .normal)
    control.translatesAutoresizingMaskIntoConstraints = false
    return control
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    let stackView = UIStackView()
    stackView.addArrangedSubview(traitsSelector)
    stackView.addArrangedSubview(lableEditor)
    stackView.addArrangedSubview(isAccessibilityToggle)
    stackView.addArrangedSubview(uiControl)
    stackView.axis = .vertical
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.accessibilityLanguage

    stackView.setCustomSpacing(50, after: isAccessibilityToggle)
    view.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
    ])
    // Do any additional setup after loading the view.

    setupData()
  }

  private func setupData() {
    traitsSelector.$currentValue.sink { traits in
      self.uiControl.accessibilityTraits = traits
      print("isAccessibilityElement is \(traits.title)")
    }
    .store(in: &cancallebles)

    isAccessibilityToggle.$currentValue.sink { value in
      self.uiControl.isAccessibilityElement = value
      print("isAccessibilityElement is \(value)")
    }
    .store(in: &cancallebles)

    lableEditor.$currentValue.sink { label in
        print("accessibilityLabel is \(String(describing: label))")
      self.uiControl.accessibilityLabel = label
    }
    .store(in: &cancallebles)
  }

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
   }
   */
}

extension UIAccessibilityTraits: SelectableValue {
  static var testTraints: [UIAccessibilityTraits] = [
    .staticText,
    .button,
    .image,
    .keyboardKey,
  ]

  var title: String {
    switch self {
    case .staticText:
      return "staticText"
    case .button: return "button"
    case .image: return "image"
    case .keyboardKey: return "keyboaredKey"

    default:
      return "unspecified"
    }
  }
}
