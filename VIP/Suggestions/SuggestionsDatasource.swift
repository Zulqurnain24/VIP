//
//  SuggestionsDatasource.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import UIKit

class SuggestionsDatasource: NSObject {

    // Suggestions to inject to the table view
    public var suggestions: [SuggestionViewModel]

    public override init() {
        self.suggestions = []
        super.init()
    }

}

// MARK: - UITableViewDataSource
extension SuggestionsDatasource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionTableViewCell.identifier, for: indexPath) as? SuggestionTableViewCell else {
            return UITableViewCell()
        }

        // Get the view model and bind the cell with the information
        let viewModel = suggestions[indexPath.row]
        cell.bindWithViewModel(viewModel)

        return cell
    }

}
