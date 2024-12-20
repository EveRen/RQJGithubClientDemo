//
//  HeaderView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                Spacer()
                Image(systemName: "chevron.forward")
            }
            .padding()
            Divider()
        }
    }
}
