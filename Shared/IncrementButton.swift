//
//  IncrementButton.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI
import WidgetKit

struct IncrementButton: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    
    var body: some View {
        Button(action: { self.incrementCount() }, label: {
            Image(systemName: "plus")
                .font(Font.title3.bold())
                .foregroundColor(.white)
                .imageScale(.large)
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color.accentColor)
                .mask(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        })
        .animation(.easeIn)
        .contextMenu {
            menuButton(toAdd: 2)
            menuButton(toAdd: 5)
            menuButton(toAdd: 10)
        }
    }
    
    fileprivate func menuButton(toAdd x: Int) -> some View {
        Button(action: { self.incrementCount(by: x) }) {
            Image(systemName: "\(x).circle.fill")
            Text("Add \(x)")
        }
    }
    
    fileprivate func incrementCount(by x: Int = 1) {
        self.count += x
        WidgetCenter.shared.reloadAllTimelines()
    }
}

struct IncrementButton_Previews: PreviewProvider {
    static var previews: some View {
        IncrementButton()
    }
}
