//
//  ViewController.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import UIKit

extension ViewController {

    func configure(with user: GitHubUser) {
        clearError()
        
        userView.isHidden = false
        nameLabel.text = user.name ?? "No name available"
        publicReposLabel.text = "Public Repositories: \(user.publicRepos)"

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: user.avatarURL)
                avatarImageView.image = UIImage(data: data)
            } catch {
                avatarImageView.image = nil
            }
        }
    }

    func fetchGitHubUser(userName: String?) async {
        clearError()

        guard let username = userName?.trimmingCharacters(in: .whitespacesAndNewlines),
              !username.isEmpty else {
            displayError("Please enter a valid username.")
            return
        }

        do {
            let user = try await apiService.fetchUser(for: username)
            configure(with: user)
        } catch {
            displayError(error.localizedDescription)
        }
    }

    func reset() {
        userView.isHidden = true
        nameLabel.text = nil
        publicReposLabel.text = nil
        avatarImageView.image = nil
    }

    private func clearError() {
        errorLabel.isHidden = true
        errorLabel.text = ""
    }

    private func displayError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        reset()
    }
}
