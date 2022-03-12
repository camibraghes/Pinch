//
//  PageModel.swift
//  Pinch
//
//  Created by Camelia Braghes on 10.03.2022.
//  https://credo.academy

import Foundation

struct Page: Identifiable {
    // the identification number
    let id: Int
    // the file name  
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
