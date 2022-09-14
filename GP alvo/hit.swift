//
//  hit.swift
//  GP alvo
//
//  Created by user226765 on 9/13/22.
//

import SwiftUI

struct hit: View {
    @Binding var slideValue: Double;
    @Binding var isAlertVisible: Bool;
    @Binding var game: Game;
    
    var body: some View {
        Button("Acertar") {
            print("\(slideValue)")
            game.lastSN = Int(slideValue);
            game.CalcScore(game.target, slideValue);
            game.target = Int.random(in: 1...100);
            slideValue = 50.0;
            print("\(game.points)");
            
            isAlertVisible = true;
        }
    }
}

