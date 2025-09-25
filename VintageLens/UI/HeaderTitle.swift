//
//  HeaderTitle.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct HeaderTitle: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(text)
                    .underline()
                Image(systemName: "chevron.forward")
                Spacer()
            }
            .font(.system(size: 18, weight: .medium, design: .rounded))
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderTitle(text: "Hello World", action: {})
}
