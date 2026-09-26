# NorikaeKit

乗り換え案内アプリ Norikae のフロントエンド共通パッケージ（Domain・NorikaeData・DesignSystem・LiveGuidance・Feature）。
iPad の Swift Playgrounds から試すために切り出したもので、テストは含めていない。

API の接続先を設定しないかぎりモックのデータで動く。池袋 → 横浜で検索すると、作り込んだ経路が返る。

## Swift Playgrounds で動かす

1. 新しい「App」を作る
2. パッケージを追加する：`https://github.com/syadool/NorikaeKit`（ブランチ `main`）。プロダクトは `Feature` を選ぶ
3. アプリのエントリポイント（`MyApp.swift`）の中身をすべて消し、次の 3 行だけにする

```swift
import Feature
import SwiftUI
@main struct MyApp: App { var body: some Scene { NorikaeScene() } }
```

`ContentView.swift` は使わないので消してよい。
コードをコピーしたときに字下げが非改行スペース（U+00A0）になるとビルドできないので、字下げのない 3 行にしている。

## 制約

- iPadOS 18 以降が必要
- iPad は Live Activity に対応していないので、案内開始はエラーになる
- 起動引数を渡せないので、モックの場面は `standard` で固定
