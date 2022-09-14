//
//  Game.swift
//  GP alvo
//
//  Created by user226765 on 9/9/22.
//

import Foundation;

class Game {
    public var target: Int = Int.random(in: 1...100)
    public var points: Int = 0;
    public var tot: Int = 0;
    public var sd: Double = 50.0;
    public var lastSN: Int = 0;

    func CalcScore(_ target: Int,_ sliderNumber: Double) {
        points = abs(target - Int(sliderNumber));

        tot += points;
    }
    
    func reset() {
        points = 0;
        tot = 0;
        target = Int.random(in: 1...100);
    }
    
    func Title() -> String {
        if(points == 0) {
            return "Parabéns!!!🎉"
        } else {
            return "❌┃Ops!!!"
        }
    }
    
    func Message() -> String {
        if(points == 0) {
            return "Você acertou!!!";
        } else {
            return "Você acertou o numero \(lastSN)\nSeus Ponto foram \(points)";
        }
    }
}
