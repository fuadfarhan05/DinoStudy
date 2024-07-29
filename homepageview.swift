//
//  homepageview.swift
//  sightwordsflashcards
//
//  Created by Fuad Farhan on 7/27/24.
//

import SwiftUI

struct homepageview: View {
    @State private var isAnimating = false
    var body: some View {
        VStack{
            NavigationView {
                       VStack {
                           Image("logo")
                           
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 300)
                           Text("Where learning is easy")
                           Text("and with you wherever...")
                           NavigationLink(destination: introview()) {
                               Image("homebutton")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width:300)

                               
                           }
                       }
                   }
          }
        }
    }


#Preview {
    homepageview()
}
