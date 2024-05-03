//
//  ContentView.swift
//  stanford-ios-2024
//
//  Created by Heejae Seo on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    let contents: [String] = ["1", "2", "3", "4"]
    var body: some View {
        VStack {
            CardView(content: contents[0], isFaceUp: true)
            CardView(content: contents[1])
            CardView(content: contents[2])
            CardView(content: contents[3])
        }
        .padding(16)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)
            
            if isFaceUp {
                base.stroke(style: StrokeStyle(lineWidth: 3))
                base.fill(.white)
                VStack {
                    Text(content).font(.largeTitle)
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



/*
To-do list
 1. CardView 안에 content 생성하기
 2. ContentView 에서 content 안에 값을 직접 넣기
 3. ContentView 에서 Array 안에 값을 넣어 이용하기 ( 두 가지 표기법 )
    - Array를 만들어서 컨텐츠 담기
    - Array에서 꺼내서 쓰기
 
 Today's Lesson
 - Argument 순서를 지키기
 */
