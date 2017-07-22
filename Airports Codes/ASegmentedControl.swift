//
//  ASegmentedControl.swift
//  Airports Codes
//
//  Created by Charles Muchene on 22/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class ASegmentedControl: UIControl {
    
    var buttons = [UIButton]()
    
    var selector: UIView!
    
    var selectedIndex: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not using this initializer")
    }
    
    private func setup() {
        borderWidth = 1
        selectedIndex = 0
        borderColor = .brown
        backgroundColor = .clear
        buttonTitles = "Airports|Codes"
        layer.cornerRadius = frame.height / 2
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    var buttonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    var buttonTitleColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    
    var selectorColor: UIColor = .gray {
        didSet {
            updateView()
        }
    }
    
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        let titles = buttonTitles.components(separatedBy: "|")
        titles.forEach { (title) in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(buttonTitleColor, for: .normal)
            button.addTarget(self, action: #selector(self.buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        let selectorWidth = frame.width / CGFloat(buttons.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.frame = bounds
        addSubview(stackView)
    }
    
    @objc private func buttonTapped(button: UIButton) {
        for (buttonIndex, butt) in buttons.enumerated() {
            butt.setTitleColor(buttonTitleColor, for: .normal)
            if butt == button {
                if selectedIndex != buttonIndex {
                    selectedIndex = buttonIndex
                    sendActions(for: .valueChanged)
                    let startPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.selector.frame.origin.x = startPosition
                    })
                }
                butt.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
}
