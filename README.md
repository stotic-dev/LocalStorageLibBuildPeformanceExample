# LocalStorageLibBuildPeformanceExample

Swift のローカルストレージライブラリのビルド速度を検証するリポジトリ

# 検証ライブラリ

- [Realm](https://github.com/realm/realm-swift)
- [SwiftData](https://developer.apple.com/documentation/swiftdata)

# 検証環境

- Xcode16.3
- Swift6.1
- Realm: v20.0.2

# ベンチマーク

| scheme（※）     | 依存ライブラリ | ビルド速度 |
| --------------- | -------------- | ---------- |
| RealmClient     | Realm          | 82.5s      |
| SwiftDataClient | SwiftData      | 2.6s       |

※ scheme は`LocalStoragePeformanceExample`の Package.swift 内にあるターゲットのことで、このターゲットをビルドした時の速度を計測しています。
