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
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Sensei Dev works on this app!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var answerButton: UIButton {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 7
        button.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        return button
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
        questionView.backgroundColor = UIColor.orange.withAlphaComponent(0.07)
        
        answersView = containerView
        answersView.backgroundColor = UIColor.green.withAlphaComponent(0.07)

        (0..<numberOfAnswerButtons).forEach {
            let button = answerButton
            button.setTitle("SD: \($0)", for: .normal)
            answerButtons.append(button)
        }
        
    }
    
    override func layoutViews() {
        
        let containerStackView = stackView
        containerStackView.axis = .vertical
        
        [questionView, answersView].forEach { containerStackView.addArrangedSubview($0) }
        
        addSubview(containerStackView)
        
        containerStackView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 0, heightConstant: 0)
        
        layoutQuestionView()
        
        layoutOutAnswerView()
        
    }
    
    private func layoutQuestionView() {
        
        questionView.addSubview(questionLabel)
        
        questionLabel.anchor(questionView.topAnchor, left: questionView.leftAnchor, bottom: questionView.bottomAnchor, right: questionView.rightAnchor, topConstant: 32, leftConstant: 32, bottomConstant: 32, rightConstant: 32, widthConstant: 0, heightConstant: 0)
        
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
