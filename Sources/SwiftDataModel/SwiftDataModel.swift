//
//  SwiftDataModel.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import SwiftData

@Model
public final class MemoEntity {
    public var id: String
    public var text: String
    
    public init(id: String, text: String) {
        self.id = id
        self.text = text
    }
}

public protocol SwiftDataEntityConvertible<SwiftDataEntity> {
    associatedtype SwiftDataEntity: PersistentModel
    associatedtype Value
    init(entity: SwiftDataEntity)
    func toEntity() -> SwiftDataEntity
}

public final actor SwiftDataModel {
    
    public static let shared = SwiftDataModel()
    
    let context: ModelContext
    
    init() {
        do {
            let container = try ModelContainer(for: MemoEntity.self)
            self.context = ModelContext(container)
        }
        catch {
            preconditionFailure("error: \(error)")
        }
    }
    
    public func fetch<Entity: SwiftDataEntityConvertible>() -> [Entity] {
        do {
            return try context
                .fetch(FetchDescriptor<Entity.SwiftDataEntity>())
                .map { .init(entity: $0) }
        }
        catch {
            print("fetch error: \(error)")
            return []
        }
    }
    
    public func save<Entity: SwiftDataEntityConvertible>(_ entity: Entity) {
        context.insert(entity.toEntity())
    }
    
    public func delete<Entity: SwiftDataEntityConvertible>(_ entity: Entity) {
        context.delete(entity.toEntity())
    }
}
