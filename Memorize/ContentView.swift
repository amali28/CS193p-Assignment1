//
//  ContentView.swift
//  Memorize
//
//  Created by Ali Malik on 2021-11-27.
//


import SwiftUI

struct ContentView: View{
    
    let sportsEmojis = ["⚽","⚾","🏀","🏐","🏈", "🏉", "🎾", "🥏", "🎳", "🏏", "🏑", "🏒","🥍","🏓","🏸","🥊","🥋","🥅","⛳","⛸️","🎣","🎽", "🎿", "🛷" ,"🥌", "⛸️", "🏹", "🏃‍♀️"]
    let countryEmojis = ["🇦🇫", "🇦🇽", "🇦🇱", "🇦🇲", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇮🇶", "🇮🇹", "🇯🇵", "🇯🇴", "🇰🇷", "🇱🇧", "🇱🇷", "🇱🇾", "🇲🇽", "🇵🇸", "🇺🇸", "🇸🇦", "🇦🇪", "🇬🇧", "🇻🇳", "🇹🇷", "🇹🇴", "🇿🇦"]
    let vehicleEmojis = ["🚂", "🚀", "🚁", "🚜", "🏎", "🚌", "🚍","🚎", "🚐", "🚑", "🚲", "🛵", "🚚", "🛺", "🦼", "🏍", "🛻", "🚗", "🚙", "🚕", "🚛","🚔","🚠", "🛳"]
    
   var randomNumber = Array(0...24)
    
   @State var isVehicle = true
   @State var isCountry = false
   @State var isSport = false
    
    var body: some View{
        
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                if isVehicle == true{
                    ThemeView(emojiCount: 8, emojis: vehicleEmojis.shuffled().prefix(8))
                } else if isCountry == true{
                    ThemeView(emojiCount: 12, emojis: countryEmojis.shuffled().prefix(12))
                } else if isSport == true{
                    ThemeView(emojiCount: 13, emojis: sportsEmojis.shuffled().prefix(13))
                }
            }.foregroundColor(.red)
            HStack{
                vehicleTheme
                Spacer()
                sportTheme
                Spacer()
                flagTheme
            }
        }
        .padding(.horizontal)
    }
    
    var vehicleTheme: some View{
        Button {
            isVehicle = true
            isSport = false
            isCountry = false
        } label:{
            VStack{
                Image(systemName: "car").font(.largeTitle)
                Text("vehicles")
            }
        }
    }
    
    var sportTheme: some View{
        Button {
            isVehicle = false
            isSport = true
            isCountry = false
        } label:{
            VStack{
                Image(systemName: "sportscourt").font(.largeTitle)
                Text("Sports")
            }
        }
    }
    
    var flagTheme: some View{
        Button {
            isVehicle = false
            isSport = false
            isCountry = true
        } label:{
            VStack{
                Image(systemName: "flag").font(.largeTitle)
                Text("Countries")
            }
        }
    }
}

struct CardView: View {
    
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack{
            let Card = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                Card.fill().foregroundColor(.white)
                Card.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                Card.fill(.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

struct ThemeView: View {
    @State var emojiCount: Int
    @State var emojis: ArraySlice<String>
    
    var body: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
            ForEach(emojis[0...emojiCount-1], id: \.self) {emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}



