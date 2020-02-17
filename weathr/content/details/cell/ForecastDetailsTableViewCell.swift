//
//  ForecastDetailsTableViewCell.swift
//  weathr
//
//  Created by Haroun Smida on 17/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import UIKit

class ForecastDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var forecastDetailIconImageView: UIImageView!
    @IBOutlet weak var forecastDetailKeyLabel: UILabel!
    @IBOutlet weak var forecastDetailValueLabel: UILabel!
    
    var row : Int!
    
    var viewModel: ForecastDetailsViewModel! {
         didSet {
             populate()
         }
     }

    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.makeShadow()
        containerView.makeRoundCorners()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if #available(iOS 13.0, *) {
            containerView.backgroundColor = selected ? .systemGroupedBackground :
                .secondarySystemGroupedBackground
        } else {
            containerView.backgroundColor = selected ? .systemGray : .white
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if #available(iOS 13.0, *) {
            containerView.backgroundColor = highlighted ? .systemGroupedBackground :
            .secondarySystemGroupedBackground
        } else {
            containerView.backgroundColor = highlighted ? .systemGray : .white
        }
    }
    
    func populate() {
        switch row {
        case 0:
            self.forecastDetailIconImageView.image = UIImage(named: "sunriseIcon")
            self.forecastDetailKeyLabel.text = .sunrise
            self.forecastDetailValueLabel.text =  viewModel.sunrise
        case 1:
            self.forecastDetailIconImageView.image = UIImage(named: "sunsetIcon")
            self.forecastDetailKeyLabel.text = .sunset
            self.forecastDetailValueLabel.text =  viewModel.sunset
        case 2:
            self.forecastDetailIconImageView.image = UIImage(named: "rainIcon")
            self.forecastDetailKeyLabel.text = .chanceOfRain
            self.forecastDetailValueLabel.text =  viewModel.chanceOfRain
        case 3:
            self.forecastDetailIconImageView.image = UIImage(named: "windIcon")
            self.forecastDetailKeyLabel.text = .wind
            self.forecastDetailValueLabel.text =  viewModel.wind
        case 4:
            self.forecastDetailIconImageView.image = UIImage(named: "humidityIcon")
            self.forecastDetailKeyLabel.text = .humidity
            self.forecastDetailValueLabel.text =  viewModel.humidity
        case 5:
            self.forecastDetailIconImageView.image = UIImage(named: "tempIcon")
            self.forecastDetailKeyLabel.text = .feelsLike
            self.forecastDetailValueLabel.text =  viewModel.feelsLike
        case 6:
            self.forecastDetailIconImageView.image = UIImage(named: "pressureIcon")
            self.forecastDetailKeyLabel.text = .pressure
            self.forecastDetailValueLabel.text =  viewModel.pressure
        default: break
        }
    }
    
}
