//
//  RotorDemoViewController.swift
//  Demo
//
//  Created by tigerguo on 2022/4/5.
//

import UIKit

class RotorDemoViewController: UIViewController {
  let numberOfButtons = 5

  lazy var buttons = getButtons()

  private var selectedButton = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    let stackView = UIStackView(arrangedSubviews: buttons)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 10
    stackView.axis = .vertical

    view.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])

    let distanceRotor = setupDistanceRotor()
//      self.accessibilityCustomRotors = [distanceRotor]
//      view.accessibilityCustomRotors = [distanceRotor]
    buttons.forEach { button in
      button.accessibilityCustomRotors = [distanceRotor]
    }

    // Do any additional setup after loading the view.
  }

  func getButtons() -> [UIButton] {
    (0 ..< numberOfButtons).map { index in
      let button = UIButton()
      button.setTitle("button \(index)", for: .normal)
      button.setTitleColor(.blue, for: .normal)
      button.setTitleColor(.red, for: .selected)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }
  }

  private func setupDistanceRotor() -> UIAccessibilityCustomRotor {
    let propertyRotorOption = UIAccessibilityCustomRotor(name: "Test Rotor") { predicate -> UIAccessibilityCustomRotorItemResult? in
      let forward = predicate.searchDirection == .next
      if forward {
        self.selectedButton += 1
      } else {
        self.selectedButton -= 1
      }
      self.selectedButton = (self.selectedButton + 10) % 5

      print("selectedButton \(self.selectedButton)")
      return UIAccessibilityCustomRotorItemResult(targetElement: self.buttons[self.selectedButton], targetRange: nil)
    }

    return propertyRotorOption
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
