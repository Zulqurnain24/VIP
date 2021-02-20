//
//  SuggestionViewModel.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation

struct SuggestionViewModel {

    let suggestion: String

    init(suggestion: String) {
        self.suggestion = suggestion
    }

    /**
     * Get the view models with a SearchSuggestion array
     */
    public static func getViewModelsWith(suggestions: [SearchSuggestion]) -> [SuggestionViewModel] {
        return suggestions.map { getViewModelWith(suggestion: $0) }
    }

    /**
     * Get a single view model with a SearchSuggestion
     */
    public static func getViewModelWith(suggestion: SearchSuggestion) -> SuggestionViewModel {
        return SuggestionViewModel.init(suggestion: suggestion.suggestion)
    }

}

extension SuggestionViewModel: Equatable {
    static func == (lhs: SuggestionViewModel, rhs: SuggestionViewModel) -> Bool {
        return  lhs.suggestion ==  rhs.suggestion
    }
}
