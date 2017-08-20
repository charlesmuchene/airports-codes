//
//  Utils.swift
//  Airports Codes
//
//  Created by Charles Muchene on 20/08/2017.
//  Copyright © 2017 SenseiDevs. All rights reserved.
//

import UIKit

func showAlert(title: String?, message: String, parent: UIViewController, presentationStyle: UIAlertControllerStyle = .alert, positiveButton: String? = "Okay",
               positiveAction: (() -> Void)? = nil, negativeButton: String? = nil, negativeAction: (() -> Void)? = nil) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: presentationStyle)
    alertController.addAction(UIAlertAction(title: positiveButton, style: .default, handler: { _ in
        if let positiveAction = positiveAction {
            positiveAction()
        }
    }))
    if let negativeButtonText = negativeButton {
        alertController.addAction(UIAlertAction(title: negativeButtonText, style: .cancel, handler: { (action) in
            if let negativeAction = negativeAction {
                negativeAction()
            }
        }))
    }
    parent.present(alertController, animated: true)
}
