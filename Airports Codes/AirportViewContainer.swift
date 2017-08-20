//
//  AirportViewContainer.swift
//  Airports Codes
//
//  Created by Charles Muchene on 23/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class AirportViewContainer: ContainerView {

    var answerButtons = [UIButton]()
    
    private var margin: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        for _ in 1...4 {
            let button = UIButton(type: .system)
            button.setTitle("SenseiDev", for: .normal)
            answerButtons.append(button)
        }
    }
    
    override func layoutViews() {
        
        let questionsView = UIView()
        questionsView.layer.cornerRadius = 7
        questionsView.backgroundColor = .brown
        
        let answerView = UIView()
        answerView.layer.cornerRadius = 7
        answerView.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
        
        let stackView = UIStackView(arrangedSubviews: [questionsView, answerView])
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 16
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[stack]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stack":stackView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[stack]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["stack":stackView]))
        
    }
    
}
