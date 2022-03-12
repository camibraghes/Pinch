//
//  InfoPanleView.swift
//  Pinch
//
//  Created by Camelia Braghes on 08.03.2022.
//

import SwiftUI



struct InfoPanleView: View {
    // store the image scale
    var scale: CGFloat
    // offset values
    var offset: CGSize
    ///did not add any initial value for these var, because i want to inject the actual scale and offset from the main view.
    
    @State private var isInfoPanelVisible: Bool = false
        
    var body: some View {
        HStack{
            // MARK: HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                    isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            // MARK: INFO PANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            
            Spacer()
        }
    }
}

struct InfoPanleView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanleView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
