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
    
    func updateTimer(time: String) {
        
    }
    
    func toggleGameAsTimed(timed: Bool) {
        
    }
    
    func toggleGamePlay() {
        
    }
    
}
