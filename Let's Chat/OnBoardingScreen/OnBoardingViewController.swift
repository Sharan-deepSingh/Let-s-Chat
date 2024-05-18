//
//  OnBoardingViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 12/05/24.
//

import UIKit

class OnBoardingViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var joinNowButton: UIButton!
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        joinNowButton.layer.cornerRadius = 20
    }
}
