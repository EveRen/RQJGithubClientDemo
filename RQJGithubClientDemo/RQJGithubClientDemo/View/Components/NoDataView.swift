//
//  NoDataView.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/19.
//

import SwiftUI

struct NoDataView: View {
    var body: some View {
        VStack {
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                .resizable()
                .frame(width: 88, height: 88)
                .padding()
            Text(AppString.noData.localizedText)
        }
    }
}

#Preview {
    NoDataView()
}
