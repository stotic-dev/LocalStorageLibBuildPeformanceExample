//
//  MemoListView.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import SwiftUI

struct MemoListView: View {
    @State private var state: MemoListViewState
    private let presenter: MemoListViewPresenter
    
    init(state: MemoListViewState) {
        self.state = state
        presenter = .init(state: state)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(state.savedTextList) { memo in
                        Text(memo.text)
                    }
                }
                .refreshable {
                    await presenter.refreshList()
                }
                Button {
                    presenter.tappedAddButton()
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(24)
            }
            .navigationTitle("Memo List")
            .searchable(text: $state.textFieldText)
        }
        .sheet(item: $state.addMemoState) {
            Task {
                await presenter.onDismissFromAddView()
            }
        } content: { state in
            AddMemoView(state: state)
        }
        .task {
            await presenter.onAppear()
        }
    }
}

#Preview {
    MemoListView(state: .init())
}
