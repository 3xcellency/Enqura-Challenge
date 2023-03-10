//
//  ViewController.swift
//  Enqura Challenge
//
//  Created by Ozan on 8.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class MainVC: BaseVC<MainVM> {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ana Sayfa"
        
        tableView.registerCell(cell: CharacterTVCell.self)
        
        viewModel?.section.bind(to: self.tableView.rx.items(cellIdentifier: CharacterTVCell.className, cellType: CharacterTVCell.self)) { row, element, cell in
            cell.configure(element)
        }.disposed(by: self.disposeBag)

        tableView.rx
             .willDisplayCell
             .subscribe(onNext: { [weak self] cell, indexPath in
                 guard let sectionCount = self?.viewModel?.section.value.count else { return }
                 if sectionCount - 1 == indexPath.row {
                     self?.viewModel?.getCharacters(offset: 30)
                 }
             }) .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              guard let item =  self?.viewModel?.section.value[indexPath.row] else { return }
              self?.viewModel?.goToDetail.onNext(item)
          }).disposed(by: self.disposeBag)
        
        self.viewModel?.getCharacters()
    }
    override func viewWillAppear(_ animated: Bool) {
        AnalyticsHelper.shared.sendAnalyticsEvents(data: AnalyticsModel(screenName: MainVC.className, event: AnalyticsEvents.opened.rawValue))
    }
    override func viewDidAppear(_ animated: Bool) {
        AnalyticsHelper.shared.sendAnalyticsEvents(data: AnalyticsModel(screenName: MainVC.className, event: AnalyticsEvents.closed.rawValue))
    }
}

