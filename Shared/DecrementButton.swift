//
//  DecrementButton.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI
import WidgetKit

struct DecrementButton: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    @AppStorage("allowsNegativeNumbers", store: UserDefaults(suiteName: "group.io.bonney.counter")) var allowsNegativeNumbers = false
    
    var body: some View {
        Button(action: { self.decrementCount() }, label: {
            Image(systemName: "minus")
                .font(Font.title3.bold())
                .foregroundColor(.white)
                .imageScale(.large)
                .frame(width: 60, height: 60, alignment: .center)
                .background(Color.accentColor)
                .mask(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        })
        .animation(.easeIn)
        .opacity(self.calculateOpacity())
        .onChange(of: allowsNegativeNumbers) { (_) in
            self.adjustForNegativeNumberPreference()
        }
        .contextMenu {
            menuButton(toSub: 2)
            menuButton(toSub: 5)
            menuButton(toSub: 10)
        }
    }
    
    fileprivate func menuButton(toSub x: Int) -> some View {
        Button(action: { self.decrementCount(by: x) }) {
            Image(systemName: "\(x).circle.fill")
            Text("Subtract \(x)")
        }
    }
    
    fileprivate func decrementCount(by x: Int = 1) {
        if allowsNegativeNumbers {
            self.count -= x
            WidgetCenter.shared.reloadAllTimelines()
        } else {
            self.count = max(0, self.count - x)
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    fileprivate func adjustForNegativeNumberPreference() {
        if !allowsNegativeNumbers {
            self.count = max(0, self.count)
            WidgetCenter.shared.reloadTimelines(ofKind: "iOS_Widget")
        }
    }
    
    fileprivate func calculateOpacity() -> Double {
        (!allowsNegativeNumbers && count == 0) ? 0.5 : 1.0
    }
}

struct DecrementButton_Previews: PreviewProvider {
    static var previews: some View {
        DecrementButton()
    }
}
