//
//  SwiftDataClient.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import LocalStoragePeformanceExample
import SwiftDataModel

extension Memo: SwiftDataEntityConvertible {
    public typealias SwiftDataEntity = MemoEntity
    public typealias Value = Self
    public init(entity: MemoEntity) {
        self.init(id: entity.id, text: entity.text)
    }
    public func toEntity() -> MemoEntity {
        return .init(id: id, text: text)
    }
}

public extension MemoRepository {
    static let swiftDataClientValue: MemoRepository = .init(fetchList: {
        return await SwiftDataModel.shared.fetch()
    }, save: { memo in
        await SwiftDataModel.shared.save(memo)
    }, delete: { memo in
        await SwiftDataModel.shared.delete(memo)
    })
}
