//
//  Extensions.swift
//  weathr
//
//  Created by Haroun Smida on 15/02/2020.
//  Copyright © 2020 Haroun Smida. All rights reserved.
//

import UIKit

extension NumberFormatter {
    static var percentFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        return formatter
    }
    
    static var temperatureFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        return formatter
    }
    
}

extension MeasurementFormatter {
    static var temperatureFormatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = NumberFormatter.temperatureFormatter
        formatter.unitStyle = .medium
        formatter.unitOptions = .temperatureWithoutUnit
        return formatter
    }
    
    func string(from value: Double) -> String {
        let measurement = Measurement(value: floor(value), unit: UnitTemperature.celsius)
        return string(from: measurement)
    }
}

extension DateFormatter {
    static var weekdayDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMM"
        return formatter
    }
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    static var hourFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
}

extension UIViewController {
    
    var isLoading: Bool {
        get {
            view.viewWithTag(99999999) != nil
        }
        set {
            if newValue {
                stopLoading()
                startLoading()
            } else {
                stopLoading()
            }
        }
    }
    
    func startLoading() {
        let container = UIView()
        container.tag = 99999999
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.color = UIColor.black
        indicator.startAnimating()
        if #available(iOS 13.0, *) {
            indicator.color = UIColor.systemGray
        }
        container.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( [indicator.centerYAnchor.constraint(equalTo: container.centerYAnchor),
             indicator.centerXAnchor.constraint(equalTo: container.centerXAnchor)] )
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( [container.leftAnchor.constraint(equalTo: view.leftAnchor),
             container.topAnchor.constraint(equalTo: view.topAnchor),
             container.rightAnchor.constraint(equalTo: view.rightAnchor),
             container.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func stopLoading() {
        if let indicatorContainer = view.viewWithTag(99999999) {
            indicatorContainer.removeFromSuperview()
        }
    }
    
}


extension UIViewController {
    
    func showAlert(with title: String = "Alert", message: String) {
        let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    func showAlert(with error: Error) {
        showAlert(message: error.localizedDescription)
    }
    
}

extension UIView {
    func makeShadow()  {
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
    }
    
    func makeRoundCorners() {
       self.layer.cornerRadius = 10
       self.layer.masksToBounds = true
    }
}
