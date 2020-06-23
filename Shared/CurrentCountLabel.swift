//
//  CurrentCountLabel.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

struct CurrentCountLabel: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    
    var body: some View {
        VStack {
            Text("Count")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("\(count)")
                .font(.system(size: 80, weight: .regular, design: .rounded))
                .foregroundColor(.primary)
        }
    }
}

struct CurrentCountLabel_Previews: PreviewProvider {
    static var previews: some View {
        CurrentCountLabel()
    }
}
