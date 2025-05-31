//
//  MemoListViewState.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import Foundation

@Observable
final class MemoListViewState {
    var textFieldText = ""
    var savedTextList: [Memo] = []
    var addMemoState: AddMemoViewState?
}
