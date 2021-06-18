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
    
    
    var body: some View {
        
        VStack {
            ZStack {
                Text("Score: \(score)")
                    .font(.title3)
                    .bold()
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Play Again")
                            
                    }
                    .padding(.trailing, 15.0)
                    .disabled(gameOver)
                    
                }
            }
            GeometryReader { geometry in
                Button(action: {
                    
                    xCoor = CGFloat.random(in: 150...(geometry.size.width - 150))
                    
                    yCoor = CGFloat.random(in:150...(geometry.size.height - 150))
                    
                    score += 1
                    
                }) {
                    Text("Catch me if you can")
                        .fontWeight(.regular)
                        .font(.footnote)
                        .padding()
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(width: 200, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        
                        
                }
                .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/)
                .background(Color.purple)
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
