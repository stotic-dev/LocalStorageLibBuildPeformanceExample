//
//  AddMemoViewPresenter.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import Foundation

@MainActor
struct AddMemoViewPresenter {
    private let state: AddMemoViewState
    
    init(state: AddMemoViewState) {
        self.state = state
    }
    
    func tappedSaveButton() async {
        let memo = Memo(id: UUID().uuidString, text: state.textFieldText)
        await RepositoryContainer.memoRepository.save(memo)
    }
}
