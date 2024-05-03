//
//  ContentView.swift
//  stanford-ios-2024
//
//  Created by Heejae Seo on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    let contents: [String] = ["1", "2", "3", "4", "5", "6", "7"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
//                    텍스트 버튼 만들기
//                    Button("Remove card") {
//                        cardCount -= 1
//                    }
//                    Spacer()
//                    Button("Add card") {
//                        cardCount += 1
                    
//                    아이콘 버튼 만들기
                    Button(action: {
                        if cardCount > 1 {
                            cardCount -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.square")
                    })
                    Spacer()
                    Button(action: {
                        if cardCount < contents.count {
                            cardCount += 1
                        }
                    }, label: {
                        Image(systemName: "plus.square")
                    })
                    
                }
                .imageScale(.large)
                
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: contents[index])
                }
            }
            .foregroundColor(.blue)
        }
        .padding()
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
                .padding()
            } else {
                base.stroke(style: StrokeStyle(lineWidth: 3))
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
 5. 카드 기본 갯수 셋팅하기
 6. 카드 제거/추가를 위한 버튼 만들기
    - 텍스트 버튼 만들기
    - 아이콘 버튼 만들기
    - 버튼에 조건 추가하기
 
 Today's Keyword
 - ViewBuilder
 - implicit return
 
 Today's Lesson
 - Argument 순서를 지키기
 - I can use 3 things in a ViewBuilder: the conditionals, the list, the local variables
 - I cannot use: the for loop
 - Ranges: s..<d s…d
 */
