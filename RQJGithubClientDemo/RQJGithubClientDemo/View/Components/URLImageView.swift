//
//  URLImageView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct URLImageView: View {
    let urlString: String

    var body: some View {        
        return AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case.success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                
            default:
                Color.gray
            }
        }
    }
}
