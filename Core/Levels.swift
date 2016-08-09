//
//  Levels.swift
//  Core
//
//  Created by Kai Drayton-Yee on 7/25/16.
//  Copyright © 2016 Kai Drayton-Yee. All rights reserved.
//

import Foundation
//remember--
//rRings is the configuration of the rings
//rSpeed = duration
// rNibs = ///NOT USED YET// (sets configuration of the nibs)
// rDegrees = the counter used to define win scene (from 0 +)
// rMove = if the direction should be
//var infoForLevels = [[(rRings: Int, rSpeed: Int, rNibs: Int, rDegrees: Int, rMove: Int)]] ---- array of array of tuple of ints
class Levels{
    //high sSpeed = slower
    
    static var infoForLevels = [
        //tutorial levels
        [
            (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1)
        ],
        [
            (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        
        
        
        //2 rings
        [
            (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        [
            (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        
        
        
        
        //three rings
        [
            (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1),(sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        [
            (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 1),(sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        [
            (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 2),(sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 1),
        ],
        
        
        
        //four rings
        [
            (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1)
        ],
        [
            (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        [
            (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        
        
        //five rings
        [
            (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 8, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        [
            (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        [
            (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        [
            (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 7, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 5, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 6, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        [
            (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 3, sNibs: 0, sDegrees: 0, sMoves: 1), (sRings: 0, sSpeed: 2, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 4, sNibs: 0, sDegrees: 0, sMoves: 2), (sRings: 0, sSpeed: 1, sNibs: 0, sDegrees: 0, sMoves: 2)
        ],
        
    ]
    
    
    
}


//var person = (firstName: "John", lastName: "Smith")
//var firstName = person.firstName // John
//var lastName = person.lastName // Smith