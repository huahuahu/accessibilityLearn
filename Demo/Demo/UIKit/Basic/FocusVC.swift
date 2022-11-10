//
//  FocusVC.swift
//  Demo
//
//  Created by tigerguo on 2022/11/10.
//
//https://medium.com/airbnb-engineering/mastering-the-tvos-focus-engine-f8a13b371083
import UIKit

class FocusVC: UIViewController {

    var selectedButton: UIButton?
    let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("button1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.accessibilityValue = "button1"
        return button
    }()

    let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("button2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.accessibilityValue = "button2"
        return button
    }()

    let button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBackground
        button.setTitle("button3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.accessibilityValue = "button3"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)

        button1.frame = .init(x: 20, y: 150, width: 100, height: 20)
        button2.frame = .init(x: 20, y: 250, width: 100, height: 20)
        button3.frame = .init(x: 20, y: 350, width: 100, height: 20)

        button1.addTarget(self, action: #selector(onButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(onButton2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(onButton3), for: .touchUpInside)
    }

    @objc func onButton1() {
        print("\(#function)")
//        print("\(UIWindowScene.focusSystem?.focusedItem)")
        button1.isHidden = false
        button2.isHidden = false
    }

    @objc func onButton2() {
        print("\(#function)")
        button2.isHidden = true
        button3.isHidden = false
        selectedButton = button3
//        preferredFocusEnvironments = [button3]
        setNeedsFocusUpdate()
    }

    @objc func onButton3() {
        print("\(#function)")
        print("\(UIScreen.main.focusedView)")
        button2.isHidden = false
        button3.isHidden = true
        selectedButton = button2
        print("\(UIScreen.main.focusedView), perferr \(preferredFocusEnvironments)")

//        view.preferredFocusEnvironments = [button2]
        setNeedsFocusUpdate()
//        updateFocusIfNeeded()

    }

    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        if let selectedButton {
            return [selectedButton]
        }

        return super.preferredFocusEnvironments
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
