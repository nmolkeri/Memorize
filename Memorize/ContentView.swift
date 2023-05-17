//
//  ContentView.swift
//  Memorize
//
//  Created by Niranjan on 5/15/23.
//

import SwiftUI

struct ContentView: View {
        @State var emojiCount = Int.random(in: 0...6)
        var vehicleEmojis = ["🚗", "🚔", "🚌", "🛴", "🚀","🚲"]
        var haloweenEmojis =  ["👻","🎃","🕷","👺","🍬","🍭","💀","🧠","👁"]
        var gamingEmojis = ["🎮","🕹","🎳","🎰","👾","🎲","🤖","🏈","🏓","🖥","💻"]
        var animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐼","🐨","🐯","🦁","🐮","🐸","🐵","🐤"]
        @State var emojis : [String]
        
        init(){
                emojis = vehicleEmojis
        }

        var body: some View {
                VStack{
                        ScrollView{
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                                        
                                        ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                                                CardView(contentText: emoji).aspectRatio(2/3, contentMode: .fit)
                                        }
                                        
                                }
                                
                        }
                        Spacer()
                        HStack{
                                ThemePicker(themeImage: "car.2", themeName: "Vehicles") {
                                        self.emojis = vehicleEmojis.shuffled()
                                        self.emojiCount = Int.random(in: 0...vehicleEmojis.count)
                                }
                                Spacer()
                                ThemePicker(themeImage: "figure.walk.motion", themeName: "Haloween") {
                                        self.emojis = haloweenEmojis.shuffled()
                                        self.emojiCount = Int.random(in: 0...haloweenEmojis.count)
                                }
                                Spacer()
                                ThemePicker(themeImage: "teddybear.fill", themeName: "Animals") {
                                        self.emojis = animalEmojis.shuffled()
                                        self.emojiCount = Int.random(in: 0...animalEmojis.count)
                                }
                                Spacer()
                                ThemePicker(themeImage: "gamecontroller", themeName: "Gaming") {
                                        self.emojis = gamingEmojis.shuffled()
                                        self.emojiCount = Int.random(in: 0...gamingEmojis.count)
                                }
                        }.font(.largeTitle).padding(.horizontal)
                }.padding(.horizontal)
        }
}

struct ThemePicker : View{
        var themeImage: String
        var themeName: String
        var buttonAction: () -> Void
        
        var body: some View{
                Button(action: {
                        buttonAction()
                }, label: {
                        VStack{
                                Image(systemName: themeImage)
                                Text(themeName)
                                        .font(.system(size: 16))
                        }
                })
        }
}

struct CardView: View{
        var contentText: String
        @State var isFaceUp = true
        var body: some View{
                ZStack{
                        let shape = RoundedRectangle(cornerRadius: 10)
                        if isFaceUp {
                                
                                shape.fill()
                                        .foregroundColor(.white)
                                shape.strokeBorder(lineWidth: 3)
                                        .foregroundColor(.red)
                                Text(contentText)
                        } else {
                                shape.fill()
                                        .foregroundColor(.red)
                        }
                }
                .onTapGesture {
                        isFaceUp = !isFaceUp
                }
        }
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
                
                ContentView()
                        .preferredColorScheme(.dark)
        }
}
