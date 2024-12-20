//
//  ViewModifier.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct BorderModifier: ViewModifier {
    let color: Color
    let width: CGFloat

    func body(content: Content) -> some View {
        content
          .overlay(
                RoundedRectangle(cornerRadius: 5)
                 .stroke(color, lineWidth: width)
            )
    }
}

extension View {
    func addBoarder(color: Color = .gray, width: CGFloat = 0.5) -> some View {
        self.modifier(BorderModifier(color: color, width: width))
    }
}
