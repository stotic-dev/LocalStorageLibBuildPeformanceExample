// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct MemoRepository: Sendable {
    public init(
        fetchList: @Sendable @escaping () async -> [Memo],
        save: @Sendable @escaping (_: Memo) async -> Void,
        delete: @Sendable @escaping (_: Memo) async -> Void
    ) {
        self.fetchList = fetchList
        self.save = save
        self.delete = delete
    }
    
    let fetchList: @Sendable () async -> [Memo]
    let save: @Sendable (_ memo: Memo) async -> Void
    let delete: @Sendable (_ memo: Memo) async -> Void
}

public struct Memo: Identifiable, Sendable {
    public init(id: String, text: String) {
        self.id = id
        self.text = text
    }
    
    public let id: String
    public let text: String
}

public struct RootView: View {
    
    public init(memoRepository: MemoRepository) {
        RepositoryContainer.memoRepository = memoRepository
    }
    
    public var body: some View {
        MemoListView(state: .init())
    }
}

public enum RepositoryContainer {
    nonisolated(unsafe) public static var memoRepository: MemoRepository = .init {
        print("call dummy memoRepository(fetch())")
        return []
    } save: { _ in
        print("call dummy memoRepository(save(:))")
    } delete: { _ in
        print("call dummy memoRepository(delete(:))")
    }
}
