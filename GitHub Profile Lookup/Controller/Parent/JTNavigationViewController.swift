//
//  JTNavigationViewController.swift
//  Surventrix
//
//  Created by Jayesh Tejwani on 10/03/22.
//
import UIKit
class JTNavigationViewController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        weak var weakSelf: JTNavigationViewController? = self
        self.hidesBarsOnTap = false
        self.hidesBarsOnSwipe = false
        self.hidesBarsWhenKeyboardAppears = false
        self.interactivePopGestureRecognizer?.delegate = weakSelf!
        self.delegate = weakSelf!
        self.isNavigationBarHidden = true
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
