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
    
    private var answersView: UIView!
    private var questionView: UIView!
    
    private var margin: CGFloat = 16
    
    private let numberOfAnswerButtons = 4
    private let numberOfAnswerColumns = 2
    
    private var containerView: UIView {
        let view = UIView()
        view.layer.cornerRadius = 7
        view.backgroundColor = .gray
        return view
    }
    
    private var stackView: UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 16
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        questionView = containerView
        questionView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        
        answersView = containerView
        answersView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)

        (0..<numberOfAnswerButtons).forEach {
            let button = UIButton(type: .system)
            button.setTitle("SD: \($0)", for: .normal)
            answerButtons.append(button)
        }
        
    }
    
    override func layoutViews() {
        
        let containerStackView = stackView
        containerStackView.axis = .vertical
        containerStackView.distribution = .fill
        
        let borderView = UIView()
        borderView.backgroundColor = .gray
        borderView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        [questionView, borderView, answersView].forEach { containerStackView.addArrangedSubview($0) }
        
        addSubview(containerStackView)
        
        containerStackView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        layoutQuestionView()
        
        layoutOutAnswerView()
        
    }
    
    private func layoutQuestionView() {
        
    }
    
    private func layoutOutAnswerView() {
    
        var stackViews: [UIStackView] = {
            var views = [UIStackView]()
            let rows = answerButtons.count / numberOfAnswerColumns
            (0..<rows).forEach { _ in
                views.append(stackView)
            }
            return views
        }()

        answerButtons.enumerated().forEach { stackViews[$0/numberOfAnswerColumns].addArrangedSubview($1) }
        
        let answersStackView = stackView
        answersStackView.axis = .vertical
        stackViews.forEach { answersStackView.addArrangedSubview($0) }
        
        answersView.addSubview(answersStackView)
        
        answersStackView.anchor(answersView.topAnchor, left: answersView.leftAnchor, bottom: answersView.bottomAnchor, right: answersView.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
    }
    
}
