//
//  SharePopUp.swift
//  StonkScorer
//
//  Created by Alexandru Turcanu on 04/01/2020.
//  Copyright © 2020 CodingBytes. All rights reserved.
//

import UIKit
import SwiftUI

extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }

    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController,
            let selected = tab.selectedViewController {
                return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }

        return base
    }
}

extension Hashable {
    func share() {
        let activityViewController = UIActivityViewController(activityItems: [self], applicationActivities: nil)

        if let popoverController = activityViewController.popoverPresentationController {
            popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
            popoverController.sourceView = UIApplication.topViewController?.view
            popoverController.permittedArrowDirections = UIPopoverArrowDirection(arrayLiteral: [.right])
        }

        UIApplication.topViewController?.present(activityViewController, animated: true, completion: nil)
    }
}
