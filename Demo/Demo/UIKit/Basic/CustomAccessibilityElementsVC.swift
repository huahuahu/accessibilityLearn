//
//  CustomAccessibilityElementsVC.swift
//  Demo
//
//  Created by tigerguo on 2022/12/9.
//

import Foundation
import UIKit

class CustomAccessibilityElementsVC: UIViewController {
    override func loadView() {
        super.loadView()
        self.view = CustomView()


    }
}

class CustomView: UIView {
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.isAccessibilityElement = true
        view.accessibilityLabel = "container"
        return view
    }()

    let centerButton: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
//        button.accessibilityViewIsModal = true
        return button
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        let twoChildView = TwoChildView()

        addSubview(twoChildView)
        addSubview(containerView)
        addSubview(centerButton)

        self.backgroundColor = .white
        containerView.frame = .init(x: 20, y: 20, width: 200, height: 200)
        centerButton.frame = .init(x: 100, y: 100, width: 50, height: 50)
        twoChildView.frame = .init(x: 20, y: 120, width: 200, height: 200)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override var accessibilityElements: [Any]? {
//        set {
//
//        }
//        get {
//            return [containerView, centerButton]
//        }
//    }
}

class TwoChildView: UIView {
    let firstLabel: UILabel = {
        let label = UILabel()
        label.text = "first"
        label.textColor = .black
        label.backgroundColor = .yellow
        label.accessibilityElementsHidden = true
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "second"
        label.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(firstLabel)
        addSubview(secondLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        firstLabel.frame = .init(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height / 2)
        secondLabel.frame = .init(x: 0, y: firstLabel.frame.maxY, width: bounds.size.width, height: bounds.size.height / 2)

    }

}
