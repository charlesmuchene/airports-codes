//
//  AirportViewContainer.swift
//  Airports Codes
//
//  Created by Charles Muchene on 23/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class AirportViewContainer: ContainerView {

    var questionsView: UIView!
    
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
        let questionsViewFrame = CGRect(x: margin, y: margin, width: frame.width - margin * 2, height: frame.height / 2 - margin * 1.5)
        let answersViewFrame = CGRect(x: margin, y: margin + frame.height / 2, width: frame.width - margin * 2, height: frame.height / 2 - margin * 1.5)
        
        questionsView = UIView(frame: questionsViewFrame)
        addSubview(questionsView)
        questionsView.backgroundColor = .brown
        
        let answerView = UIView(frame: answersViewFrame)
        addSubview(answerView)
        answerView.backgroundColor = .green
    
    }
    
}
