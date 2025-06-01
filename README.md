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

上記比較で、これほどビルド速度に差が出たのは、Realm はコンパイルしているが、SwiftData はコンパイル済みのバイナリが標準で入っているため、コンパイルの必要がないためでした。

Realm を xcFramework 化してコンパイル時間を省いた状態でビルド比較すると、同じ条件でビルド速度の検証ができるますので、その比較もしてみた結果が以下です。

| scheme（※）     | 依存ライブラリ | ビルド速度 |
| --------------- | -------------- | ---------- |
| RealmClient     | Realm          | 1.9s       |
| SwiftDataClient | SwiftData      | 2.6s       |

こうみると、ビルド速度の違いはほとんどなかったです。

※ scheme は`LocalStoragePeformanceExample`の Package.swift 内にあるターゲットのことで、このターゲットをビルドした時の速度を計測しています。
