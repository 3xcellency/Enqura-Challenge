//
//  DetailCoordinator.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import UIKit
import RxSwift

class DetailCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private let item: CharacterResponseResult
    
    init(rootViewController: UIViewController, item: CharacterResponseResult) {
        self.rootViewController = rootViewController
        self.item = item
    }
    
    override func start() -> Observable<Void> {
        let vc = DetailVC()
        let vm = DetailVM()
        vc.viewModel = vm
        vc.item = item
        rootViewController.navigationController!.setNavigationBarHidden(false, animated: true)
        rootViewController.navigationController?.pushViewController(vc, animated: true)
        return  Observable.never()
    }
}
