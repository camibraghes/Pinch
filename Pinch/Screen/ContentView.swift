//
//  ContentView.swift
//  Pinch
//  https://credo.academy
//  Created by Camelia Braghes on 05.03.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffSet: CGSize = .zero
    
    // MARK: FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
        imageScale = 1
        imageOffSet = .zero
        }
    }
    
    // MARK: CONTENT
    var body: some View {
        NavigationView {
            ZStack {
    // MARK: PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffSet.width, y: imageOffSet.height)
                    .scaleEffect(imageScale)
                
                // MARK: 1. - TAP GESTURE
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                             withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                             resetImageState()
                            }
                        }
                    }
                //MARK: 2. - DRAG GESTURE
                    .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffSet = value.translation
                            }
                        }
                        .onEnded { _ in
                            if imageScale <= 1 {
                               resetImageState()
                            }
                        }
                    )
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            }
            .navigationViewStyle(.stack)
        }
    }


// MARK: PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}
