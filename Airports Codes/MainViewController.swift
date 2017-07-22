//
//  ViewController.swift
//  Airports Codes
//
//  Created by Charles Muchene on 22/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var segmentedControl: ASegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Airports Codes"
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        
        let timeSwitch = UISwitch()
        timeSwitch.setOn(true, animated: true)
        let timeLabel = UILabel()
        timeLabel.text = "07:32"
        let scoreLabel = UILabel()
        scoreLabel.textColor = .darkGray
        scoreLabel.text = "13/20"
        let playButton = UIButton(type: .system)
        playButton.setTitle("Play", for: .normal)
        let stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop", for: .normal)
        let playStackView = UIStackView(arrangedSubviews: [timeSwitch, timeLabel, scoreLabel, playButton, stopButton])
        playStackView.axis = .horizontal
        playStackView.alignment = .fill
        playStackView.distribution = .fillProportionally
        
        segmentedControl = ASegmentedControl()
        segmentedControl.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        
        let navBarHeight = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        let margin = CGFloat(integerLiteral: 16)
        
        let headerStackView = HeaderStackView(arrangedSubviews: [playStackView, segmentedControl])
        view.addSubview(headerStackView)
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[hsv]-margin-|", options: NSLayoutFormatOptions(), metrics: ["margin": margin], views: ["hsv": headerStackView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-navbarHeightWithMargin-[hsv]", options: NSLayoutFormatOptions(), metrics: ["navbarHeightWithMargin": navBarHeight + margin], views: ["hsv": headerStackView]))
    }

    @objc private func segmentChanged(sender: ASegmentedControl) {
        
        switch(sender.selectedIndex) {
        default:
            print("Default case")
        }
    }

}

