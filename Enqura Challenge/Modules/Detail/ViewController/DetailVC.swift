//
//  DetailVC.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
class DetailVC: BaseVC<DetailVM> {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var titleLbl: UILabel!
    @IBOutlet private weak var descLbl: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    private  var favButton: UIBarButtonItem  {
        let button = UIBarButtonItem(image: UIImage(systemName: self.isFav ? "heart.fill" : "heart"), style: .done, target: self, action: #selector(likeAction))
        button.tintColor = .systemPink
           return button
       }
    
    var isFav: Bool {  RealmFavs.instance.getFavs().contains(where: {$0.charId == self.item?.id ?? 0}) }
    public var item: CharacterResponseResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detay"
        navigationItem.rightBarButtonItem = favButton
        tableView.registerCell(cell: DetailTVCell.self)
        
        viewModel?.section.bind(to: self.tableView.rx.items(cellIdentifier: DetailTVCell.className, cellType: DetailTVCell.self)) { row, element, cell in
            cell.configure(element)
        }.disposed(by: self.disposeBag)
        
        if let path = item?.thumbnail?.path, let ext = item?.thumbnail?.extensionType, let url = URL(string: path.appending(".\(ext)")) {
            imgView.sd_setImage(with: url)
        }
        titleLbl.text = "Karakter Adı: \(item?.name ?? "")"
        descLbl.text = (item?.description ?? "").isEmpty ? "-" : item?.description

    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewModel?.getComics(id: item?.id ?? 0)
        AnalyticsHelper.shared.sendAnalyticsEvents(data: AnalyticsModel(screenName: DetailVC.className, event: AnalyticsEvents.opened.rawValue))
    }
    override func viewDidAppear(_ animated: Bool) {
        AnalyticsHelper.shared.sendAnalyticsEvents(data: AnalyticsModel(screenName: DetailVC.className, event: AnalyticsEvents.closed.rawValue))
    }
    @objc func likeAction(){
        isFav ? RealmFavs.instance.deleteFav(charId: item?.id) : RealmFavs.instance.setFav(charId: item?.id)
        navigationItem.rightBarButtonItem = favButton
        AnalyticsHelper.shared.logEvent(name: "charId: \(item?.id ?? 0)", title: "isFav:\(isFav)")
    }
}

