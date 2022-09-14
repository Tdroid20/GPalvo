//
//  StructViews.swift
//  GP alvo
//
//  Created by user226765 on 9/12/22.
//

import SwiftUI;

struct InputText: View {
    
    var text: String;
    var color: Color;
    
    var body: some View{
        Text(text)
                .foregroundColor(color)
    }
}


struct StructViews_Previews: PreviewProvider {
    static var previews: some View {
        InputText(text: "Preview", color: .gray)
    }
}
