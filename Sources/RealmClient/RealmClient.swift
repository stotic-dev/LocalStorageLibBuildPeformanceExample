//
//  RealmClient.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import LocalStoragePeformanceExample
import RealmModel
import SwiftUI

extension Memo: RealmEntityConvertible {
    public typealias Entity = MemoEntity
    public typealias Value = Self
    public init(entity: MemoEntity) {
        self.init(id: entity.id, text: entity.text)
    }
    public func toEntity() -> MemoEntity {
        return .init(id: id, text: text)
    }
}

public extension MemoRepository {
    static let realmClientValue: MemoRepository = .init(fetchList: {
        return await RealmModel.shared.value.fetch()
    }, save: { memo in
        await RealmModel.shared.value.save(memo)
    }, delete: { memo in
        await RealmModel.shared.value.delete(memo)
    })
}
