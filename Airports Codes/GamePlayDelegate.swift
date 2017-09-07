//
//  GamePlayDelegate.swift
//  Airports Codes
//
//  Created by Charles Muchene on 27/08/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

protocol GamePlayDelegate {
    var isGameInProgress: Bool { get }
    func pauseGame()
    func playGame()
    func endGame()
    func toggleGame(timed: Bool)
    func toggleGamePlay()
}
