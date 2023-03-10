//
//  MainCoordinator.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import UIKit
import RxSwift

class MainCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() -> Observable<Void> {
        let vc = MainVC()
        let vm = MainVM()
        vc.viewModel = vm
        
        vm.goToDetail.subscribe { item in
            _ = self.coordinate(to: DetailCoordinator(rootViewController: vc, item: item))
        }.disposed(by: disposeBag)

        rootViewController.navigationController!.setNavigationBarHidden(false, animated: true)
        rootViewController.navigationController?.setViewControllers([vc], animated: true)
        return  Observable.never()
    }
}
