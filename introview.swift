//
//  introview.swift
//  sightwordsflashcards
//
//  Created by Fuad Farhan on 7/29/24.
//

import SwiftUI

struct introview: View {
    var body: some View {
        VStack{
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
    NavigationView {
        VStack{
            Image("dino")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .padding()
            Text("Hi there, I'm Dino, Nice to meet you!!!")
                .font(.headline)
            Text("Let's learn some new words together")
                .font(.headline)
                .padding()
            Text("(press the 'rawrr')")
                .font(.headline)
            VStack {
                
                NavigationLink(destination: ContentView()) {
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
    introview()
}
