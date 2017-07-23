//
//  ContainerView.swift
//  Airports Codes
//
//  Created by Charles Muchene on 23/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class ContainerView: UIView {

    
    var shadowColor: UIColor = .gray {
        didSet {
            updateView()
        }
    }
    
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            updateView()
        }
    }
    
    var shadowOpacity: Float = 0.4 {
        didSet {
            updateView()
        }
    }
    
    var shadowRadius: CGFloat = 1 {
        didSet {
            updateView()
        }
    }
    
    var cornerRadius: CGFloat = 7 {
        didSet {
            updateView()
        }
    }
    
    var borderWidth: CGFloat = 1 {
        didSet {
            updateView()
        }
    }
    
    var borderColor: UIColor = .gray {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("I don't need this; but oh well xcode!")
    }
    
    private func updateView() {
        
        backgroundColor = .clear
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        
        let cornerView = UIView()
        cornerView.backgroundColor = .white
        cornerView.frame = bounds
        cornerView.layer.cornerRadius = cornerRadius
        cornerView.layer.masksToBounds = true
        addSubview(cornerView)
        
        layoutViews()
    }
    
    func layoutViews() {
        fatalError("Must override")
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }


}
