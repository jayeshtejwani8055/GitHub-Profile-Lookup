//
//  ViewController.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var usernameSearchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var publicReposLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    @IBOutlet weak var userView: UIView!

    let errorLabel = UILabel()

    // MARK: - Dependencies
    let apiService: GitHubAPIServiceProtocol = GitHubAPIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    // MARK: - UI Methods
    private func configureErrorLabel() {
        errorLabel.textColor = .systemRed
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorLabel)

        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: usernameSearchBar.bottomAnchor, constant: 8),
            errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func prepareUI() {
        userView.isHidden = true
        usernameSearchBar.becomeFirstResponder()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        configureErrorLabel()
    }

}
