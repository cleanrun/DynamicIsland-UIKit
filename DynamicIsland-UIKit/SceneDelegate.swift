//
//  SceneDelegate.swift
//  DynamicIsland-UIKit
//
//  Created by cleanmac-ada on 10/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let vc = DynamicIslandVC()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

