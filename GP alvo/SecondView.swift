//
//  SecondView.swift
//  GP alvo
//
//  Created by user226765 on 9/12/22.
//

import SwiftUI

struct SecondView: View {
    @Binding var isShowSecondViewState: Bool;
    @State var isAlertVisible: Bool = false
    
    var body: some View {
        InputText(text: "PoweredBy Skyrus", color: Color("skyrusGreen"))
        Button("Close") {
            isAlertVisible = true;
        }
        
        .alert("❗┃Deseja sair dessa tela?", isPresented: $isAlertVisible, actions: {
            Button("Permanecer", role: .cancel) {
                isAlertVisible = false;
            }
            Button("Sair", role: .destructive) {
                isAlertVisible = false;
                isShowSecondViewState = false
            }
        },
               message: {
            Text("Ao sair dessa tela todas as informações serão perdidas")
        })
    }
}
/*
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
} */
