//
//  ContentView.swift
//  CatchMe
//
//  Created by Mike Morales on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var xCoor: CGFloat = 200
    @State private var yCoor: CGFloat = 200
    @State private var score: Int = 0
    @State private var gameOver: Bool = false
    @State private var isGame: Bool = true
    @State private var color: Color = Color.purple
    @State private var restartBtnTxt: String = "Play Again"
    
    var body: some View {
        
        VStack {
            ZStack {
                Text("Score: \(score)")
                    .font(.title3)
                    .bold()
                
                HStack {
                    Spacer()
                    Button(action: {
                        isGame = true
                        score = 0
                        color = Color.purple
                        restartBtnTxt = "Restart"
                    }) {
                        Text(restartBtnTxt)
                            
                    }
                    .padding(.trailing, 15.0)
                    .disabled(gameOver)
                    
                }
            }
            GeometryReader { geometry in
                Button(action: {
                    
                    if (isGame) {
                        xCoor = CGFloat.random(in: 150...(geometry.size.width - 150))
                        
                        yCoor = CGFloat.random(in:150...(geometry.size.height - 150))
                        
                        score += 1
                        
                        if (xCoor > ((geometry.size.width / 2) - 30) && xCoor < ((geometry.size.width / 2) + 30) && yCoor > ((geometry.size.height / 2) - 30) && yCoor < ((geometry.size.height / 2) + 30)) {
                            isGame = false
                            color = Color.green
                            restartBtnTxt = "Play Again"
                        }
                    }
                    
                }) {
                    Text("CATCH ME IF YOU CAN")
                        .fontWeight(.regular)
                        .font(.footnote)
                        .padding()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 200, height: 150)
                        
                }
                .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/)
                .background(color)
                .cornerRadius(600)
                .position(x: (xCoor), y: yCoor)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
