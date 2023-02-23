//
//  CounterWidgetBundle.swift
//  CounterWidget
//
//  Created by Matt Bonney on 2/22/23.
//

import WidgetKit
import SwiftUI

@main
struct CounterWidgetBundle: WidgetBundle {
    var body: some Widget {
        CounterWidget()
        CounterWidgetLiveActivity()
    }
}
