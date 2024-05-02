//
//  ContentView.swift
//  stanford-ios-2024
//
//  Created by Heejae Seo on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }.padding(16)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp == false {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 1))
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                VStack {
                    Text("얘들아 안녕").foregroundColor(Color.black)
                    Text("호호 할머니")
                }
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue)
                VStack {
                    Text("얘들아 안녕").foregroundColor(Color.white)
                    Text("호호 할머니").foregroundColor(Color.white)
                }
            }
        }
        .padding(4)
    }
}







#Preview {
    ContentView()
}
