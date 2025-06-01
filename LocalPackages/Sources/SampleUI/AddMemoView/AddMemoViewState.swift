//
//  AddMemoViewState.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import Foundation

@Observable
final class AddMemoViewState: Identifiable {
    var id: ObjectIdentifier { ObjectIdentifier(self) }
    var textFieldText = ""
    var isEnabledSaveButton = false
}
