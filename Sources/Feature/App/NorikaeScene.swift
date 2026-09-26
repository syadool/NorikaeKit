import LiveGuidance
import SwiftUI

/// アプリ本体の Scene。Swift Playgrounds のアプリから 1 行で使えるようにしたもの（中身は App/NorikaeApp.swift と同じ）
public struct NorikaeScene: Scene {
    @State private var dependencies: AppDependencies

    public init() {
        let dependencies = AppDependencies.makeFromLaunchEnvironment()
        _dependencies = State(initialValue: dependencies)
        // LiveActivityIntent（「1本後に変更」「案内終了」）はアプリ本体のプロセスで実行される（frontend.md 9.2）
        GuidanceIntentBridge.shared.handler = dependencies.guidance
    }

    public var body: some Scene {
        WindowGroup {
            NorikaeRootView()
                .environment(dependencies)
        }
    }
}
