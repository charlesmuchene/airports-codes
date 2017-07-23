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
    
    var shadowOffset: CGSize = .zero {
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
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("I don't need this; but oh well xcode!")
    }
    
    private func updateView() {
        
        let shadowLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.path = path
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowPath = path
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius

        layer.addSublayer(shadowLayer)
        
        layoutViews()
        
    }
    
    func layoutViews() {
        fatalError("Must override laying out views")
    }
    
    override func draw(_ rect: CGRect) {
        updateView()
    }


}
