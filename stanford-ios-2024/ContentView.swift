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
            cardCountAdjuster
            ScrollView {
                cards
                    .padding(5)
            }
            Spacer()
        }
        .padding()
    }
    
    var cardCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > contents.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.square")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.square")
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: contents[index])
                    .aspectRatio(3/4, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 5)
            
            Group {
                base.stroke(style: StrokeStyle(lineWidth: 2))
                base.fill(.white)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            base.stroke(style: StrokeStyle(lineWidth: 2))
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
 7. 코드 쪼개기
 8. 제거/추가 버튼 합치기
    - 함수 만들기
 9. Grid 만들기
    - LasyVGrid 이용하기
    - GridItem에 최소 너비 적용하기
    - GridItem에 비율 적용하기
    - ScrollView 적용하기
10. 카드가 뒷면일 때 작아지는 문제 해결하기
    - 조건문을 Group으로 대체해 컨텐츠를 항시 불러오기
    - Group에 카드가 뒷면일 때 컨텐츠를 투명하게 하는 조건문을 적용하기
 
 Today's Keyword
 - ViewBuilder
 - Implicit return
 - `.imageScale`
 - `func`
 - `.disabled`
 - `LasyVGrid` & `GridItem`
 - `.aspectRatio`
 - `ScrollView`
 - `Group`
 
 Today's Lesson
 - Argument 순서를 지키기
 - I can use 3 things in a ViewBuilder: the conditionals, the list, the local variables
 - I cannot use: the for loop
 - Ranges: s..<d s…d
 - 코드는 12줄 미만으로 쪼개는 습관 만들기
 */
