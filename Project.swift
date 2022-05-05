import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains AdoptingTuist1 App target and AdoptingTuist1 unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers

let target = Target(
    name: "Adopting_Tuist", // 타겟 이름
    platform: .iOS,
    product: .app,
    productName: "AdoptingTuist", // 앱 이름
    bundleId: "com.minan.Adopting-Tuist", // Bundle Id
    deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
    infoPlist: .file(path: .relativeToRoot("Targets/AdoptingTuist1/Sources/Info.plist")),
    sources: ["Targets/AdoptingTuist1/Sources/**"],
    resources: ["Targets/AdoptingTuist1/Resources/**"],
    dependencies: [
        .external(name: "Alamofire")
        // .framework(path: .relativeToCurrentFile("여기에 Framework 경로"))
    ],
    settings: .settings(
        base: [
            "MARKETING_VERSION": "1.0", // 버전
            "CURRENT_PROJECT_VERSION": "1" // 빌드
        ],
        configurations: [],
        defaultSettings: .recommended
    )
)

let Simul_Target = Target(
    name: "Simul_Adopting_Tuist", // 타겟 이름
    platform: .iOS,
    product: .app,
    productName: "Simul_Adopting_Tuist", // 앱 이름
    bundleId: "com.minan.Adopting-Tuist", // Bundle Id
    deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
    infoPlist: .file(path: .relativeToRoot("Targets/AdoptingTuist1/Sources/Info.plist")),
    sources: ["Targets/AdoptingTuist1/Sources/**"],
    resources: ["Targets/AdoptingTuist1/Resources/**"],
    dependencies: [
        .external(name: "Alamofire"),
    ],
    settings: .settings(
        base: [
            "MARKETING_VERSION": "1.0", // 버전
            "CURRENT_PROJECT_VERSION": "1", // 빌드
            "OTHER_SWIFT_FLAGS":"-D SIMUL",
        ],
        configurations: [],
        defaultSettings: .recommended
    )
)

let project = Project(
    name: "Adopting_Tuist",
    settings: .settings(configurations: [
        .debug(name: .configuration("Dev"), xcconfig: .relativeToRoot("Config/Dev.xcconfig")),
        .debug(name: .configuration("Prod"), xcconfig: .relativeToRoot("Config/Prod.xcconfig"))
    ]),
    targets: [target, Simul_Target]
)
