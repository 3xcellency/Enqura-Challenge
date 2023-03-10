//
//  DetailTVCell.swift
//  Enqura Challenge
//
//  Created by Ozan on 10.03.2023.
//
import UIKit
import SDWebImage
class DetailTVCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    func configure(_ element:CharacterResponseResult) {
        if let path = element.thumbnail?.path, let ext = element.thumbnail?.extensionType, let url = URL(string: path.appending(".\(ext)")) {
            imgView.sd_setImage(with: url)
        }
        title.text = element.title
        dateLbl.text = element.modified?.dateFormat()
    }
}
