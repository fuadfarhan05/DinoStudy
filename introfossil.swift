//
//  introfossil.swift
//  sightwordsflashcards
//
//  Created by Fuad Farhan on 8/1/24.
//

import SwiftUI

struct introfossil: View {
    var body: some View {
            
        NavigationView {
            VStack{
                Image("prompt2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("dino")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .padding()
                Text("Hi there, I'm Dino, Nice to meet you!!!")
                    .font(.headline)
                Text("In this game you will find the fossil that matches the word. Let RaaaAaaWWRRrr!!")
                    .font(.headline)
                    .padding()
                Text("(press the 'rawrr')")
                    .font(.headline)
                VStack {
                    
                    NavigationLink(destination: WordFossil()) {
                        Image("button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                                
                            
                        }
                        
                        
                    }
                }
              }
                
            }
        
    }


#Preview {
    introfossil()
}
