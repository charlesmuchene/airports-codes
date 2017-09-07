//
//  GameController.swift
//  Airports Codes
//
//  Created by Charles Muchene on 20/08/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import Foundation

class GamePlay {
    
    private var timer: Timer?
    private var gameInProgress = false
    private var currentGameTime = 0.0
    
    var timedGame = false
    
    var maxGameTime = 5.0
    
    var gamePlayDelegate: GamePlayDelegate?
    
    var isGameInProgress: Bool {
        return gameInProgress
    }
    
    func playGame() {
        gameInProgress = true
        if timedGame {
            startTimer()
        }
        gamePlayDelegate?.playGame()
    }
    
    func pauseGame() {
        gameInProgress = false
        timer?.invalidate()
        gamePlayDelegate?.pauseGame()
    }
    
    func gameOver() {
        pauseGame()
        currentGameTime = 0.0
        gamePlayDelegate?.endGame()
    }
    
    func toggleGameAsTimed(timed: Bool) {
        // TODO Can't switch ui if game is in progress.
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] _ in
            self.currentGameTime += 1
            self.updateTimer()
            if self.currentGameTime == self.maxGameTime {
                self.gameOver()
            }
        })
    }
    
    private func updateTimer() {
        gamePlayDelegate?.updateTimer(time: "00:\(Int(maxGameTime - currentGameTime))")
    }

    func toggleGamePlay() {
        if gameInProgress {
            gameInProgress = false
        } else {
            gameInProgress = true
        }
    }
    
}
