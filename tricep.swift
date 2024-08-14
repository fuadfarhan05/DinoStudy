//
//  tricep.swift
//  sightwordsflashcards
//
//  Created by Fuad Farhan on 8/1/24.
//

import SwiftUI

struct tricep: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("wingcook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                
                Text("Hello there I am a Dinosaur with wingss and I love wingss also. I'm RRrrreally good at making wings. Come look at my Cookbook with all of my secret recipes.")
                VStack {
                    
                    NavigationLink(destination: wingzview()) {
                        Image("cookbutton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                                
                            
                        }
                        
                        
                    }
                
                
            }
        }
    }
}

#Preview {
    tricep()
}
