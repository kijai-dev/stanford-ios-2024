//
//  ContentView.swift
//  stanford-ios-2024
//
//  Created by Heejae Seo on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    let contents: [String] = ["1", "2", "3", "4", "5"]
    var body: some View {
//      수동 반복
//        VStack {
//            ForEach(0..<4, id: \.self) { index in
//                CardView(content: contents[index])
//            }
//        }
//      Array 안의 데이터 갯수만큼 자동 반복
        VStack {
            ForEach( contents.indices, id: \.self) { index in
                CardView(content: contents[index])
            }
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
 4. ForEach 사용하기 ( id: \.self 포함하기 )
    - 0~3까지 수동으로 반복하기
    - Array.indicies를 이용해 자동으로 반복하기
 
 Today's Keyword
 - View builder
 
 Today's Lesson
 - Argument 순서를 지키기
 - I can use 3 things in a view builder: the conditionals, the list, the local variables
 - I cannot use: the for loop
 - Ranges: s..<d s…d
 */
