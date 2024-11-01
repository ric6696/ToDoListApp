//
//  ButtonView.swift
//  ToDoList
//
//  Created by Richard Kim on 13/10/2024.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let backgroundColor: Color
    let action: () ->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                    
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}

#Preview {
    ButtonView(title: "Value", backgroundColor: .blue) {
        // Attempt Log in
    }
}
