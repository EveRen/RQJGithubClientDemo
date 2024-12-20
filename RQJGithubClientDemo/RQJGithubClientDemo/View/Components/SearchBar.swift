//
//  SearchBar.swift
//  RQJGithubClientDemo
//
//  Created by 任泡泡🫧 on 2024/12/20.
//

import SwiftUI

struct SearchBar: View {
    @FocusState private var isTextFieldFocused: Bool
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        bar
            .onAppear {
                isTextFieldFocused = true
            }
    }
    
    var bar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)
            TextField(AppString.search.localizedText, text: $text)
                .focused($isTextFieldFocused)
                .onSubmit {
                    onSearch()
                }
            RoundButton(buttonText: AppString.search.localizedText, padding: 4, action: onSearch)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
}
