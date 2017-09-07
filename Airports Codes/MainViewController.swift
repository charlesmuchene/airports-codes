//
//  ViewController.swift
//  Airports Codes
//
//  Created by Charles Muchene on 22/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var segmentedControl: ASegmentedControl!
    
    private var airportView: AirportViewContainer!
    
    private var codesView: CodesViewContainer!
    
    private var playButtonItem: UIBarButtonItem!
    
    private var gamePlayDelegate: GamePlayDelegate!
    
    private var overlayView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Airports Codes"
        view.backgroundColor = .white
        setupView()
        
    }
    
    private func setupView() {
        
        playButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(self.playButtonClicked))
        
        navigationController?.navigationBar.tintColor = .orange
        navigationItem.rightBarButtonItem = playButtonItem
        
        let timeSwitch = UISwitch()
        timeSwitch.addTarget(self, action: #selector(self.toggleSwitch(sender:)), for: .valueChanged)
        let timeLabel = UILabel()
        timeLabel.text = "--:--"
        let scoreLabel = UILabel()
        scoreLabel.textColor = .darkGray
        scoreLabel.text = "1/10"
        let stopButton = UIButton(type: .system)
        stopButton.setTitle("Give up", for: .normal)
        stopButton.addTarget(self, action: #selector(self.stopGame), for: .touchUpInside)
        
        let playStackView = UIStackView(arrangedSubviews: [timeSwitch, timeLabel, scoreLabel, stopButton])
        playStackView.axis = .horizontal
        playStackView.alignment = .fill
        playStackView.distribution = .fillProportionally
        
        setupSegmentedControlView(playStackView)
        
        setupOverlayView()
        
    }
    
    private func setupOverlayView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
        overlayView =  UIVisualEffectView(effect: blurEffect)
        overlayView.frame = view.bounds
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Game paused"
        overlayView.contentView.addSubview(label)
        label.anchor(overlayView.centerYAnchor, left: overlayView.leftAnchor, bottom: nil, right: overlayView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupSegmentedControlView(_ playStackView: UIStackView) {
        
        segmentedControl = ASegmentedControl()
        segmentedControl.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        
        let navBarHeight = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        let margin = CGFloat(integerLiteral: 16)
        
        let headerStackView = HeaderStackView(arrangedSubviews: [playStackView, segmentedControl])
        view.addSubview(headerStackView)
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[hsv]-margin-|", options: NSLayoutFormatOptions(), metrics: ["margin": margin], views: ["hsv": headerStackView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-navbarHeightWithMargin-[hsv(<=96)]", options: NSLayoutFormatOptions(), metrics: ["navbarHeightWithMargin": navBarHeight + margin], views: ["hsv": headerStackView]))
        
        setupViewContainers(headerStackView, margin)
    }
    
    private func setupViewContainers(_ headerStackView: HeaderStackView, _ margin: CGFloat) {
        
        airportView = AirportViewContainer()
        view.addSubview(airportView)
        airportView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: airportView, attribute: .top, relatedBy: .equal, toItem: headerStackView, attribute: .bottom, multiplier: 1.0, constant: 16).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[avc]-margin-|", options: NSLayoutFormatOptions(), metrics: ["margin": margin], views: ["avc": airportView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[avc]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["avc": airportView]))
        
        codesView = CodesViewContainer()
        codesView.alpha = 0
        view.addSubview(codesView)
        codesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: codesView, attribute: .top, relatedBy: .equal, toItem: headerStackView, attribute: .bottom, multiplier: 1.0, constant: 16).isActive = true
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-margin-[cvc]-margin-|", options: NSLayoutFormatOptions(), metrics: ["margin": margin], views: ["cvc": codesView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[cvc]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["cvc": codesView]))
        
        gamePlayDelegate = airportView
    }
    
    @objc private func segmentChanged(sender: ASegmentedControl) {
        
        if gamePlayDelegate.isGameInProgress {
            showAlert(title: nil, message: "Quit game?", parent: self, presentationStyle: .actionSheet, positiveButton: "Yes", positiveAction: {
                sender.completeTransition(true)
                self.changeGame(index: sender.selectedIndex)
            }, negativeButton: "No", negativeAction: {
                sender.completeTransition(false)
            })
        } else {
            sender.completeTransition(true)
            changeGame(index: sender.selectedIndex)
        }
    }
    
    private func changeGame(index: Int) {
        switch(index) {
        case 0:
            UIView.animate(withDuration: 0.4, animations: {
                self.airportView.alpha = 1
                self.codesView.alpha = 0
            }) {
                _ in
                self.gamePlayDelegate = self.airportView
            }
            
        case 1:
            UIView.animate(withDuration: 0.3, animations: {
                self.airportView.alpha = 0
                self.codesView.alpha = 1
            }) {
                _ in
                self.gamePlayDelegate = self.codesView
            }
            
        default:
            break
        }
    }
    
    @objc private func playButtonClicked() {
        gamePlayDelegate.toggleGamePlay()
        togglePlay()
    }
    
    private func togglePlay() {
        var playButtonTitle = ""
        if gamePlayDelegate.isGameInProgress {
            overlayView.removeFromSuperview()
            playButtonTitle = "Pause"
        }
        else {
            view.addSubview(overlayView)
            playButtonTitle = "Play"
        }
        playButtonItem.title = playButtonTitle
    }

    @objc private func stopGame() {
        gamePlayDelegate.endGame()
    }
    
    @objc private func toggleSwitch(sender: UISwitch) {
        gamePlayDelegate.toggleGame(timed: sender.isOn)
    }
    
}
