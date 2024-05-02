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
        }
        .padding(16)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)
            
            if isFaceUp {
                base.stroke(style: StrokeStyle(lineWidth: 3))
                base.fill(.white)
                VStack {
                    Text("안녕").foregroundColor(Color.blue)
                }
            } else {
                base.fill(.blue)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}







#Preview {
    ContentView()
}



/* To-do list
 1. RoundedRectangle 변수화해서 재사용하기
 2. onTapGesture 이벤트 추가하기
 
 Today's Keyword
 - Struct
 - View
 - @State
 */
