//
//  ContentView.swift
//  LocalStoragePeformanceExampleProject
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import LocalStoragePeformanceExample
import RealmClient
import SwiftDataClient
import SwiftUI

struct ContentView: View {
    var body: some View {
        RootView(memoRepository: .swiftDataClientValue)
//        RootView(memoRepository: .realmClientValue)
    }
}

#Preview {
    ContentView()
}
