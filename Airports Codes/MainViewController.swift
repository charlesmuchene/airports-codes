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
        let navBarHeight = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        let margin = CGFloat(integerLiteral: 16)
        let controlFrame = CGRect(x: margin, y: navBarHeight + margin, width: view.frame.width - margin * 2, height: margin * 2)
        segmentedControl = ASegmentedControl(frame: controlFrame)
        self.view.addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
    }

    @objc private func segmentChanged(sender: ASegmentedControl) {
        
        switch(sender.selectedIndex) {
        default:
            print("Default case")
        }
    }

}

