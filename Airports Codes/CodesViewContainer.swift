//
//  CodesViewContainer.swift
//  Airports Codes
//
//  Created by Charles Muchene on 23/07/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

class CodesViewContainer: ContainerView {

    fileprivate let gamePlay = GamePlay()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        
    }
    
    override func layoutViews() {
        
        let label = UILabel()
        label.text = "Coming soon!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
                     topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }

}

extension CodesViewContainer: GamePlayDelegate {
    
    var isGameInProgress: Bool {
        return gamePlay.isGameInProgress
    }
    
    func pauseGame() {
        
    }
    
    func playGame() {
        
    }
    
    func endGame() {
        
    }
    
    func toggleGame(timed: Bool) {
        
    }
    
    func toggleGamePlay() {
        gamePlay.toggleGamePlay()
    }
    
}
