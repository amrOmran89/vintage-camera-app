//
//  SearchView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery: String = ""
    var body: some View {
        List {
            
        }
        .searchable(text: $searchQuery)
    }
}

#Preview {
    SearchView()
}
