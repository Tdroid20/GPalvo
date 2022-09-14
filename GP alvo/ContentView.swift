//
//  ContentView.swift
//  GP alvo
//
//  Created by user226765 on 9/8/22.
//

import SwiftUI;


struct ContentView: View{
    //@State var sliderNumber: Double = 50.0;
    
    @State var game: Game = Game();
    @State var CalcScore: (Int, Double) -> () = Game().CalcScore;
    
    @State var isAlertVisible: Bool = false;
    
    @State var isShowSecondScreen: Bool = false;
    
    @State var slideValue : Double = 50.0
    var body: some View {
        
        VStack {
        VStack {
            Text("Socore: \(game.points)\nTotal: \(game.tot)");
            
            InputText(text: "Acerte o número", color: .blue);
            Text("\(game.target)");
            
            sliderView(sliderNumber: $slideValue)
        }
                
            HStack {
                hit(slideValue: $slideValue, isAlertVisible: $isAlertVisible, game: $game)
                Button("Info") {
                    isShowSecondScreen = true;
                }
                .sheet(isPresented: $isShowSecondScreen, content: {
                    SecondView(isShowSecondViewState: $isShowSecondScreen)
                })
                
                    .alert(
                        game.Title(),
                        isPresented: $isAlertVisible,
                        actions: {
                            AlertView(isAlertVisible: $isAlertVisible, sliderNumber: $slideValue, game: game);

                        },
                        message: {
                            InputText(text: game.Message(), color: .blue)                        }
                    )
            }
        }
    }
}


struct sliderView: View {
    @Binding var sliderNumber: Double;

    var body: some View {
        HStack{
            Text("1")
            Slider(value: $sliderNumber, in: 1...100)
            Text("100")
        }
    }
}

struct AlertView : View {
    
    @Binding var isAlertVisible: Bool;
    @Binding var sliderNumber: Double;
    var game: Game = Game();

    
    
    var body: some View{
        
        if(game.points != 0) {
            Button("OK", role: .cancel) {
                print("alerta criado")
                isAlertVisible = false;
            }
            
            Button("Resetar", role: .destructive) {
                game.reset();
                game.lastSN = 0;
                game.target = Int.random(in: 1...100);
                sliderNumber = 50.0;
                
                isAlertVisible = false;
            }
        } else {
            
            Button("OK", role: .cancel) {
                game.reset();
                game.lastSN = 0;
                game.target = Int.random(in: 1...100);
                sliderNumber = 50.0;
                
                isAlertVisible = false;
            }
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
