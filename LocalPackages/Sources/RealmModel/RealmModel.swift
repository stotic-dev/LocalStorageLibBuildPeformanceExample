//
//  RealmModel.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import RealmSwift

public final class MemoEntity: Object {
    @Persisted(primaryKey: true) public var id: String
    @Persisted public var text: String
    
    public convenience init(id: String, text: String) {
        self.init()
        self.id = id
        self.text = text
    }
}

public protocol RealmEntityConvertible<Entity> {
    associatedtype Entity: Object
    associatedtype Value
    init(entity: Entity)
    func toEntity() -> Entity
}

@globalActor
public enum RealmActor {
    public static let shared = ActorType()
    public actor ActorType {}
}

@RealmActor
public final class RealmModel {
    
    public static let shared: Task<RealmModel, Never> = Task {
        do {
            let realm = try await Realm(actor: RealmActor.shared)
            return await .init(realm: realm)
        }
        catch {
            preconditionFailure("error: \(error)")
        }
    }
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    public func fetch<Output: RealmEntityConvertible>() -> [Output] {
        return realm
            .objects(Output.Entity.self)
            .map { .init(entity: $0) }
    }
    
    public func save<Entity: RealmEntityConvertible>(_ entity: Entity) {
        try! realm.write {
            realm.add(entity.toEntity(), update: .all)
        }
    }
    
    public func delete<Entity: RealmEntityConvertible>(_ entity: Entity) {
        try! realm.write {
            realm.delete(entity.toEntity())
        }
    }
}
