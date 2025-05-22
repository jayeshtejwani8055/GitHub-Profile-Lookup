//
//  ViewController.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import UIKit

extension ViewController: UISearchBarDelegate {

    // Called when text changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task {
            await fetchGitHubUser(userName: searchText)
        }
    }

    // Called when the search button is clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
    }

    // Called when cancel button is clicked (if shown)
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

}
