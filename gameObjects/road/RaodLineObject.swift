//
//  SpeedUp.swift
//  race_sssr
//
//  Created by Eugene sch on 8/17/20.
//  Copyright © 2020 Eugene sch. All rights reserved.
//

import UIKit


class RoadLineObject: RaceObject {
    
    override var raceMap:[[CGPoint]] {
        set { }
        get {
            return [
                [ // 1 begin
                    CGPoint(x: 10,  y: -11),
                    CGPoint(x: 150, y: -11),
                    CGPoint(x: 275, y: -11),
                    CGPoint(x: 400, y: -11)
                ],
                [ // 6 out line
                    CGPoint(x: 10,  y: 710),
                    CGPoint(x: 150, y: 710),
                    CGPoint(x: 275, y: 710),
                    CGPoint(x: 400, y: 710)
                ],
            ]
        }
    }
    
    override func size() -> CGSize {
        return CGSize(width: 32, height: 32)
    }
    
    override func contactWithCar(){
        //ignore
    }

    override func getImage(position: Int) -> UIImage {
        guard let image = UIImage(named: "Road lines white broken") else {
            return UIImage()
        }
        return image
    }
    
    override func move() {
        super.move()
      
        if self.point.y == 2 {
            let next = RoadLineObject()
            next.add(to: Int(self.point.x))
        }
    }
}
