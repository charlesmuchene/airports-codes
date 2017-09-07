//
//  GamePlayTests.swift
//  Airports CodesTests
//
//  Created by Charles Muchene on 27/08/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import XCTest
@testable import Airports_Codes

class GamePlayTests: XCTestCase {
    
    func testGamePlayProgress() {
        let gamePlay = GamePlay()
        gamePlay.playGame()
        XCTAssertTrue(gamePlay.isGameInProgress)
        gamePlay.gameOver()
    }
}
