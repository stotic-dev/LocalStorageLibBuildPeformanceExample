//
//  ContentView.swift
//  LocalStoragePeformanceExampleProject
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import RealmClient
import SampleUI
//import SwiftDataClient
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Sample")
//        RootView(memoRepository: .swiftDataClientValue)
        RootView(memoRepository: .realmClientValue)
    }
}

#Preview {
    ContentView()
}
