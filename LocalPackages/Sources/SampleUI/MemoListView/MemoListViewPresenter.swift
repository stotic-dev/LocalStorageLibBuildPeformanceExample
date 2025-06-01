//
//  MemoListViewPresenter.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import Foundation

@MainActor
struct MemoListViewPresenter {
    private let state: MemoListViewState
    
    init(state: MemoListViewState) {
        self.state = state
    }
    
    func onAppear() async {
        state.savedTextList = await RepositoryContainer.memoRepository.fetchList()
    }
    
    func onDismissFromAddView() async {
        state.savedTextList = await RepositoryContainer.memoRepository.fetchList()
    }
    
    func refreshList() async {
        state.savedTextList = await RepositoryContainer.memoRepository.fetchList()
    }
    
    func tappedAddButton() {
        state.addMemoState = .init()
    }
    
    func onDeleteRow(_ index: Int) {
        
    }
}
