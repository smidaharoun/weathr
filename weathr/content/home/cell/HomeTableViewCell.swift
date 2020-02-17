//
//  HomeTableViewCell.swift
//  weathr
//
//  Created by Haroun Smida on 17/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var secondCommentLabel: UILabel!
    @IBOutlet weak var averageTemperatureLabel: UILabel!
    @IBOutlet weak var rangeTemperatureLabel: UILabel!
    
    var viewModel: HomeCellViewModel! {
        didSet {
            populate()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.makeShadow()
        container.makeRoundCorners()
        
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
        commentLabel.font = UIFont.systemFont(ofSize: 15)
        secondCommentLabel.font = UIFont.systemFont(ofSize: 15)
        averageTemperatureLabel.font = UIFont.boldSystemFont(ofSize: 40)
        rangeTemperatureLabel.font = UIFont.systemFont(ofSize: 20)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if #available(iOS 13.0, *) {
            container.backgroundColor = selected ? .systemGroupedBackground :
                .secondarySystemGroupedBackground
        } else {
            container.backgroundColor = selected ? .systemGray : .white
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if #available(iOS 13.0, *) {
            container.backgroundColor = highlighted ? .systemGroupedBackground :
            .secondarySystemGroupedBackground
        } else {
            container.backgroundColor = highlighted ? .systemGray : .white
        }
    }
    
    func populate() {
        iconImageView.load(url: viewModel.iconUrl)
        dateLabel.text = viewModel.date
        commentLabel.text = viewModel.comment
        secondCommentLabel.text = viewModel.secondComment
        averageTemperatureLabel.text = viewModel.averageTemperature
        rangeTemperatureLabel.text = viewModel.rangeTemperature
    }
    
}


extension UIImageView {
    func load(url: URL?) {
        guard let url = url else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
