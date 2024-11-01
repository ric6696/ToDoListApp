//
//  HeaderView.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", backgroundColor: .blue)
}
