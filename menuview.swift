//
//  menuview.swift
//  sightwordsflashcards
//
//  Created by Fuad Farhan on 7/31/24.
//

import SwiftUI

struct menuview: View {
    var body: some View {
            
            NavigationView {
                ZStack{
                VStack{
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:300)
                    
                    Image("gamechooser")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:300)
                    VStack{
                        NavigationLink(destination: introview()) {
                            Image("dinowordscards")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .border(Color.blue)
                                .border(Color.green, width: 5)
                                .cornerRadius(10)
                        }
                        Image("mid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:250)
                        
                    }
                    VStack{
                        NavigationLink(destination: introfossil()) {
                            Image("fossils")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .border(Color.blue)
                                .border(Color.green, width: 5)
                                .cornerRadius(10)
                        }
                        Image("easy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:250)
                    }
                    VStack{
                        NavigationLink(destination: tricep()) {
                            Image("wingcook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .border(Color.blue)
                                .border(Color.green, width: 5)
                                .cornerRadius(10)
                        }
                        Image("mid")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:250)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    menuview()
}
