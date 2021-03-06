//
//  ControlImageView.swift
//  Pinch
//
//  Created by Camelia Braghes on 09.03.2022.
//

import SwiftUI

struct ControlImageView: View {
    //the name of the magnifyingglass 
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
