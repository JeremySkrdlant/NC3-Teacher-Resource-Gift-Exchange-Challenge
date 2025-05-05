//
//  LeftPersonView.swift
//  Gift Exchange Challenge Trial
//
//  Created by admin on 5/4/25.
//

import SwiftUI

struct PersonView: View {
    var name:String
    var body: some View {
        HStack {
            Spacer()
            Text(name)
                .font(.system(size: 20))
                .kerning(5)
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.white.shadow(radius: 4))
            .padding()
    }
}

#Preview {
    PersonView(name: "Bob Ross")
}
