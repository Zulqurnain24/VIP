//
//  SearchListDatasource.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import UIKit

class SearchListDatasource: NSObject {

    public var items: [TrackViewModel]

    public var isList = false

    public override init() {
        self.items = []
        super.init()
    }
}

// MARK: - UICollectionViewDataSource
extension SearchListDatasource: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isList {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCollectionViewRowCell.identifier, for: indexPath) as? TrackCollectionViewRowCell else {
                return UICollectionViewCell()
            }

            let viewModel = items[indexPath.row]
            cell.bindWithViewModel(viewModel)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrackCollectionViewCell.identifier, for: indexPath) as? TrackCollectionViewCell else {
                return UICollectionViewCell()
            }

            let viewModel = items[indexPath.row]
            cell.bindWithViewModel(viewModel)
            return cell
        }
    }

}
