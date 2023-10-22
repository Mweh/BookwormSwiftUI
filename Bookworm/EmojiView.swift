//
//  EmojiView.swift
//  Bookworm
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import SwiftUI

struct EmojiView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("☹️")
        case 2:
            Text("😔")
        case 3:
            Text("🙂")
        case 4:
            Text("😊")
        default:
            Text("🤩")

        }
    }
}

#Preview {
    EmojiView(rating: 3)
}
