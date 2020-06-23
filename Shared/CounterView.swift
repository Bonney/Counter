//
//  CounterView.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

struct CounterView: View {
    
    var body: some View {
        VStack {
            CurrentCountLabel()
            HStack {
                DecrementButton()
                Spacer()
                IncrementButton()
            }
            Divider().padding(.vertical)
            NegativeNumberToggle()
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
