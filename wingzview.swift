import SwiftUI

struct wingzview: View {
    @State private var selectedImageIndex: Int? = nil
    @State private var letterOffsets: [CGSize] = [CGSize.zero, CGSize.zero, CGSize.zero]
    
    var body: some View {
        VStack{
            Text("(drag the letters")
            ZStack {
                Image("tablewingz")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding()
                    .border(Color.brown, width: 5)
                
                // Draggable letters on top of the main image
                VStack {
                    HStack(spacing: 20) {
                        DraggableLetterView(letter: "D", index: 0, offset: $letterOffsets[0], color: Color(red: 1, green: 0, blue: 0)) // Example color for red sauce
                        DraggableLetterView(letter: "R", index: 1, offset: $letterOffsets[1], color: Color(red: 0.2, green: 0.8, blue: 0.2)) // Example color for green sauce
                        DraggableLetterView(letter: "L", index: 2, offset: $letterOffsets[2], color: Color(red: 1, green: 1, blue: 0)) // Example color for blue sauce
                    }
                    .padding(.top, 50) // Adjust the top padding as needed
                    HStack{
                        DraggableLetterView(letter: "C", index: 0, offset: $letterOffsets[0], color: Color(red: 1, green: 0, blue: 0)) // Example color for red sauce
                        DraggableLetterView(letter: "W", index: 1, offset: $letterOffsets[1], color: Color(red: 0.2, green: 0.8, blue: 0.2)) // Example color for green sauce
                        DraggableLetterView(letter: "SH", index: 2, offset: $letterOffsets[2], color: Color(red: 1, green: 1, blue: 0)) // Example color for blue sauce
                    }
                    
                }
            }
            .animation(.easeInOut, value: selectedImageIndex)
            VStack{
                Image("wingzprompt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250)
                
                // Images
                VStack{
                    HStack {
                        WingzImageView(imageName: "rate", index: 0, selectedImageIndex: $selectedImageIndex)
                        WingzImageView(imageName: "date", index: 1, selectedImageIndex: $selectedImageIndex)
                        WingzImageView(imageName: "late", index: 2, selectedImageIndex: $selectedImageIndex)
                        
                    }
                    HStack {
                        WingzImageView(imageName: "would", index: 0, selectedImageIndex: $selectedImageIndex)
                        WingzImageView(imageName: "could", index: 1, selectedImageIndex: $selectedImageIndex)
                        WingzImageView(imageName: "should", index: 2, selectedImageIndex: $selectedImageIndex)
                        
                    }
                    
                }
            }
        }
    }
}

struct DraggableLetterView: View {
    let letter: String
    let index: Int
    @Binding var offset: CGSize
    let color: Color

    var body: some View {
        Text(letter)
            .bold()
            .padding()
            .background(color.opacity(1)) // Apply color with some opacity
            .cornerRadius(8)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        // Optionally, reset the position when the drag ends
                        // offset = CGSize.zero
                    }
            )
    }
}

struct WingzImageView: View {
    let imageName: String
    let index: Int
    @Binding var selectedImageIndex: Int?

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: selectedImageIndex == index ? 250 : 100)
            .border(Color.red, width: 5)
            .cornerRadius(5)
            .onTapGesture {
                withAnimation {
                    if selectedImageIndex == index {
                        selectedImageIndex = nil
                    } else {
                        selectedImageIndex = index
                    }
                }
            }
    }
}

#Preview {
    wingzview()
}
