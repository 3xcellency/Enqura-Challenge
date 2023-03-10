//
//  AppCoordinator.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import RxSwift
import UIKit
class AppCoordinator: ReactiveCoordinator<Void> {
    var window : UIWindow
    
    init(window : UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        let splashViewController = LauncherVC()
        let navigationController = UINavigationController(rootViewController: splashViewController)
        navigationController.setNavigationBarHidden(true, animated: true)
        let splashCoordinator = LauncherCoordinator(rootViewController: splashViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return coordinate(to: splashCoordinator)
    }
}
