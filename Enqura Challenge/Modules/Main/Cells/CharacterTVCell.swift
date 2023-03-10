//
//  CharacterTVCell.swift
//  Enqura Challenge
//
//  Created by Ozan on 9.03.2023.
//
import UIKit
import SDWebImage
class CharacterTVCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    func configure(_ element:CharacterResponseResult) {
        if let path = element.thumbnail?.path, let ext = element.thumbnail?.extensionType, let url = URL(string: path.appending(".\(ext)")) {
            imgView.sd_setImage(with: url)
        }
        title.text = element.name
        dateLbl.text = element.modified?.dateFormat()
    }
}
