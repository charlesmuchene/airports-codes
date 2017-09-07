//
//  Utils.swift
//  Airports Codes
//
//  Created by Charles Muchene on 20/08/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

func showAlert(title: String?, message: String, parent: UIViewController,
               presentationStyle: UIAlertControllerStyle = .alert, positiveButtonTitle: String? = "Okay",
               positiveButtonAction: (() -> Void)? = nil, negativeButtonTitle: String? = nil, negativeButtonAction: (() -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: presentationStyle)
    alertController.addAction(UIAlertAction(title: positiveButtonTitle, style: .default, handler: { _ in
        if let positiveButtonAction = positiveButtonAction {
            positiveButtonAction()
        }
    }))
    if let negativeButtonTitle = negativeButtonTitle {
        alertController.addAction(UIAlertAction(title: negativeButtonTitle, style: .cancel, handler: { (action) in
            if let negativeButtonAction = negativeButtonAction {
                negativeButtonAction()
            }
        }))
    }
    parent.present(alertController, animated: true)
}
