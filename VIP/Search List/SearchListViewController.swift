//
//  SearchListViewController.swift
//  VIP
//
//  Created by Zulqurnain on 20/02/2021.
//

import Foundation
import DisplaySwitcher
import RSSelectionMenu

class SearchListViewController: BaseViewController {

    public var presenter: SearchListPresenterDelegate?

    internal let customTitleView: CustomTitleView = CustomTitleView()
    internal let searchView: SearchView = SearchView()
    internal let sortButton: UIButton = UIButton(type: .custom)
    internal var sortButtonWidthConstraint: NSLayoutConstraint?
    internal let noResultsLabel: UILabel = UILabel()
    internal let categoriesButton: UIButton = UIButton()
    internal let searchListContainerView: UIView = UIView()

    var transitionManager: TransitionManager?
    internal var searchListCollectionView: UICollectionView?

    internal lazy var listLayout = DisplaySwitchLayout(staticCellHeight: 0.5 * TrackCollectionViewCell.getHeight(for: getTrackCellSide()),
      nextLayoutStaticCellHeight: 0.5 *
        TrackCollectionViewCell.getHeight(for: getTrackCellSide()), layoutState: .list)
    internal lazy var gridLayout = DisplaySwitchLayout(staticCellHeight: getTrackCellSide(), nextLayoutStaticCellHeight: getTrackCellSide(), layoutState: .grid)
    internal var layoutState: LayoutState = .list
    let animationDuration = 0.5// Seconds

    internal let suggestionsView = SuggestionsView()
    internal var suggestionsViewBottomConstraint: NSLayoutConstraint?
    internal var isListView = false
    internal var datasource: SearchListDatasource?
    internal var numberOfCellsInARow: Int = 2
    internal var isFirstTime = true

    /**
     * Category Menu Attributes
     */
    /// Category Data Array
    let categoryDataArray = ["Album", "Book", "Artist", "Movie", "musicVideo", "Podcast", "Song"]
    var categorySelectedArray = [String]()
    /// Cell Selection Style
    var cellSelectionStyle: CellSelectionStyle = .tickmark

    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        setupViews()
        configureNavigationBar()
        presenter?.viewDidLoad()
    }
}

// MARK: - Setup views
extension SearchListViewController {

    /**
     * Setup views
     */
    private func setupViews() {
        view.backgroundColor = .black
        edgesForExtendedLayout = []

        searchListCollectionView?.collectionViewLayout = gridLayout

        configureSubviews()
        addSubviews()
    }

    /**
     * Configure subviews
     */
    private func configureSubviews() {
        searchView.delegate = self

        sortButton.setTitle("Options", for: .normal)
        sortButton.titleLabel?.font = UIFont.mediumWithSize(size: 15.0)
        sortButton.setTitleColor(.white, for: .normal)
        sortButton.addTarget(self, action: #selector(optionsButtonPressed), for: .touchUpInside)

        suggestionsView.isHidden = true
        suggestionsView.delegate = self

        categoriesButton.titleLabel?.font =  UIFont(name: "Helvetica Neue", size: 12)
        categoriesButton.setTitleColor(.white, for: .normal)
        categoriesButton.setTitle("Select Categories", for: .normal)
        categoriesButton.isHidden = false
        categoriesButton.backgroundColor = .lightGray
        categoriesButton.addTarget(self, action: #selector(selectCategoriesMenu), for: .touchUpInside)

        noResultsLabel.font = UIFont.mediumWithSize(size: 14.0)
        noResultsLabel.textColor = .white
        noResultsLabel.text = "No results. Please try again"
        noResultsLabel.textAlignment = .center
        noResultsLabel.isHidden = true

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        searchListCollectionView = UICollectionView(frame: searchListContainerView.bounds, collectionViewLayout: flowLayout)
        searchListCollectionView?.backgroundColor = .clear
        searchListCollectionView?.isUserInteractionEnabled = true
        searchListCollectionView?.showsVerticalScrollIndicator = false
        searchListCollectionView?.delegate = self
        registerCells()
        setupDatasource()
    }

    @objc func selectCategoriesMenu() {
        self.showAsAlertController(style: .alert, title: "Select Player", action: nil, height: nil)
    }

     /**
     * action sheet for category selection
     */

    func showAsAlertController(style: UIAlertController.Style, title: String?, action: String?, height: Double?) {
        let selectionStyle: SelectionStyle = .multiple

        // create menu
        let selectionMenu =  RSSelectionMenu(selectionStyle: selectionStyle, dataSource: categoryDataArray) { (cell, name, _) in
            cell.textLabel?.text = name
        }

        // provide selected items
        selectionMenu.setSelectedItems(items: categorySelectedArray) { (_, _, _, selectedItems) in
            self.categorySelectedArray = selectedItems
        }

        // on dismiss handler
        selectionMenu.onDismiss = { [weak self] items in

            self?.categorySelectedArray = items

            self?.categoriesButton.setTitle(items.joined(separator: ", "), for: .normal)
        }

        // cell selection style
        selectionMenu.cellSelectionStyle = self.cellSelectionStyle

        // show - with action (if provided)
        let menuStyle: PresentationStyle = style == .alert ? .alert(title: title, action: action, height: height) : .actionSheet(title: title, action: action, height: height)

        selectionMenu.show(style: menuStyle, from: self)
    }

    /**
     * Configure navigation bar
     */
    private func configureNavigationBar() {
        customTitleView.titleColor = .white
        customTitleView.setTitle("VIP")
        customTitleView.subtitleColor = .white
        customTitleView.setSubtitle("Select related categories and search your content")
        navigationItem.titleView = customTitleView
    }

    /**
     * Register all the cells for the collection view
     */
    private func registerCells() {
        searchListCollectionView?.register(TrackCollectionViewRowCell.self, forCellWithReuseIdentifier: TrackCollectionViewRowCell.identifier)
        searchListCollectionView?.register(TrackCollectionViewCell.self, forCellWithReuseIdentifier: TrackCollectionViewCell.identifier)
    }

    /**
     * Setup the data source
     */
    private func setupDatasource() {
        if let searchListCollectionView = searchListCollectionView {
            datasource = SearchListDatasource()
            searchListCollectionView.dataSource = datasource
        }
    }

    /**
     * Get track cell size
     */
    internal func getTrackCellSide() -> CGFloat {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let cellContainerWidth: CGFloat = screenWidth -
            Layout.CollectionViewCell.centerSpacing *
            (CGFloat(numberOfCellsInARow-1)) -
            Layout.CollectionViewCell.edgeSpacingLeft *
            CGFloat(numberOfCellsInARow)
        return 1.5 * cellContainerWidth / CGFloat(numberOfCellsInARow)
    }

    /**
     * Add observers to the view
     */
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}

// MARK: - Layout & constraints
extension SearchListViewController {

    /**
     * Internal struct for layout
     */
    private struct Layout {

        struct CollectionViewCell {
            static let centerSpacing: CGFloat = 16.0
            static let edgeSpacingTop: CGFloat = 24.0
            static let edgeSpacingLeft: CGFloat = 16.0
            static let edgeSpacingBottom: CGFloat = 24.0
            static let edgeSpacingRight: CGFloat = 16.0
        }

        struct NoResultsLabel {
            static let height: CGFloat = 17.0
        }

        struct SortButton {
            static let leading: CGFloat = 5.0
            static let trailing: CGFloat = 16.0
            static let width: CGFloat = 80.0
            static let top: CGFloat = 7.5
            static let height: CGFloat = 31.0
        }

        struct SearchListContainerView {
            static let top: CGFloat = 10.0
        }

    }

    /**
     * Internal struct for animation
     */
    private struct Animation {

        static let animationDuration: TimeInterval = 0.25

    }

    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(searchView)
        view.addSubview(sortButton)
        view.addSubview(searchListContainerView)
        view.addSubview(suggestionsView)
        searchListContainerView.addSubview(noResultsLabel)

        let noResultsLabelCenterX = NSLayoutConstraint(item: noResultsLabel,
                                                       attribute: .centerX,
                                                       relatedBy: .equal,
                                                       toItem: searchListContainerView,
                                                       attribute: .centerX, multiplier: 1.0, constant: 0.0)
        searchListContainerView.addConstraint(noResultsLabelCenterX)
        let noResultsLabelCenterY = NSLayoutConstraint(item: noResultsLabel,
                                                       attribute: .centerY,
                                                       relatedBy: .equal, toItem: searchListContainerView,
                                                       attribute: .centerY,
                                                       multiplier: 1.0, constant: 0.0)
        searchListContainerView.addConstraint(noResultsLabelCenterY)
        searchListContainerView.addConstraintsWithFormat("H:|[v0]|", views: noResultsLabel)
        searchListContainerView.addConstraintsWithFormat("V:[v0(\(Layout.NoResultsLabel.height))]", views: noResultsLabel)

        view.addConstraintsWithFormat("H:|[v0]-\(Layout.SortButton.leading)-[v1(\(Layout.SortButton.width))]-\(Layout.SortButton.trailing)-|", views: searchView, sortButton)
        view.addConstraintsWithFormat("V:|[v0(\(searchView.height))]", views: searchView)

        view.addConstraintsWithFormat("V:|-\(Layout.SortButton.top)-[v0(\(Layout.SortButton.height))]", views: sortButton)

        view.addConstraintsWithFormat("H:|[v0]|", views: searchListContainerView)
        view.addConstraintsWithFormat("V:[v0]-\(Layout.SearchListContainerView.top)-[v1]|", views: searchView, searchListContainerView)

        if let searchListCollectionView = searchListCollectionView {
            searchListContainerView.addSubview(categoriesButton)
            searchListContainerView.addSubview(searchListCollectionView)
            searchListContainerView.bringSubviewToFront(categoriesButton)
            searchListContainerView.addConstraintsWithFormat("H:|[v0]|", views: searchListCollectionView)
            searchListContainerView
                .addConstraintsWithFormat("V:|-\(Layout.SortButton.top)-[v0(\(Layout.SortButton.height))]-\(Layout.SortButton.top)-[v1]-\(Layout.SortButton.top)-|",
                views: categoriesButton, searchListCollectionView)
            searchListContainerView.addConstraintsWithFormat("H:|[v0]|", views: categoriesButton)
        }

        view.addConstraintsWithFormat("H:|[v0]|", views: suggestionsView)
        view.addConstraintsWithFormat("V:[v0][v1]", views: searchView, suggestionsView)
        let suggestionsViewBottomConstraint = NSLayoutConstraint(item: suggestionsView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(suggestionsViewBottomConstraint)
        self.suggestionsViewBottomConstraint = suggestionsViewBottomConstraint
    }

    /**
     * Show suggestions
     *
     * - parameters:
     *      -show: show / hide the suggestions
     *      -height: the height for the suggestions content
     *      -animated: show / hide suggestions with animation or not
     */
    private func showSuggestions(show: Bool, height: CGFloat, animated: Bool) {
        let animateDuration = animated ? Animation.animationDuration : 0
        suggestionsViewBottomConstraint?.constant = height
        suggestionsView.isHidden = !show
        UIView.animate(withDuration: animateDuration) {
            self.view.layoutIfNeeded()
        }
    }

}

// MARK: - User actions
extension SearchListViewController {

    @objc private func optionsButtonPressed() {
        showOptions()
    }

    private func showOptions() {
        let alertController = UIAlertController(
            title: "Sort results options",
            message: nil,
            preferredStyle: .actionSheet)

        alertController.addAction(UIAlertAction(title: "Change Layout", style: .default, handler: { [weak self] (_) in
            guard let `self` = self else { return }
            self.changeLayout()
        }))

        alertController.addAction(UIAlertAction(title: "By song length", style: .default, handler: { [weak self] (_) in
            guard let `self` = self else { return }
            self.sortResultsBy(.length)
        }))

        alertController.addAction(UIAlertAction(title: "By genre", style: .default, handler: { [weak self] (_) in
            guard let `self` = self else { return }
            self.sortResultsBy(.genre)
        }))

        alertController.addAction(UIAlertAction(title: "By price", style: .default, handler: { [weak self] (_) in
            guard let `self` = self else { return }
            self.sortResultsBy(.price)
        }))

        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))

        present(alertController, animated: true, completion: nil)
    }

}

// MARK: - Sort options
extension SearchListViewController {

    private func sortResultsBy(_ type: SortType) {
        presenter?.sortTracksBy(type)
    }

    private func changeLayout() {
        presenter?.changeLayout()
    }
}

// MARK: - Keyboard actions
extension SearchListViewController {

    /**
     * Control the keyboard will appear action
     *
     * - parameters:
     *      -notification: notification from the keyboard
     */
    @objc private func keyboardWillBeAppear(notification: NSNotification) {
        guard let info: [AnyHashable: Any] = notification.userInfo,
            let keyboardSize: CGSize = (info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size else { return }
        presenter?.getSuggestions()
        showSuggestions(show: true, height: -keyboardSize.height, animated: true)
    }

    /**
     * Control the keyboard will be hidden action
     *
     * - parameters:
     *      -notification: notification from the keyboard
     */
    @objc private func keyboardWillBeHidden(notification: NSNotification) {
        showSuggestions(show: false, height: 0.0, animated: true)
    }

}

// MARK: - SuggestionsViewDelegate
extension SearchListViewController: SuggestionsViewDelegate {

    func suggestionSelectedAt(index: Int) {
        showSuggestions(show: false, height: 0.0, animated: false)
        searchView.hideKeyboard()
        presenter?.suggestionSelectedAt(index)
    }

}

// MARK: - UICollectionViewDelegate (with UICollectionViewDelegateFlowLayout)
extension SearchListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                        newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = getTrackCellSide()

        return CGSize(width: side, height: isListView ? 0.5 * TrackCollectionViewCell.getHeight(for: side) : TrackCollectionViewCell.getHeight(for: side))
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Layout.CollectionViewCell.edgeSpacingTop,
                            left: Layout.CollectionViewCell.edgeSpacingLeft,
                            bottom: Layout.CollectionViewCell.edgeSpacingBottom,
                            right: Layout.CollectionViewCell.edgeSpacingRight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.CollectionViewCell.centerSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.CollectionViewCell.centerSpacing
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.trackSelectedAt(indexPath.row)
    }

}

// MARK: - SearchViewDelegate
extension SearchListViewController: SearchViewDelegate {

    /**
     * Method to catch the search action
     *
     * - parameters:
     *      -search: the search term
     */
    func searchButtonPressedWithSearch(_ search: String?) {
        self.categorySelectedArray.insert(search ?? "", at: 0)
        let search = self.categorySelectedArray.joined(separator: ",")
        presenter?.searchTrack(search)
        self.categorySelectedArray.remove(at: 0)
    }

}

// MARK: - SearchListViewInjection
extension SearchListViewController: SearchListViewInjection {
    /**
     * Change Collectionview Layout
     *
     * - parameters:
     *      -changeLayout: grid/row
     */
    func changeCollectionViewLayout() {
        if layoutState == .list {
            datasource?.isList = false
            layoutState = .grid
            self.transitionManager = TransitionManager(duration:
                                     TimeInterval(animationDuration),
                                       collectionView: searchListCollectionView!, destinationLayout: gridLayout,
                                     layoutState: layoutState)
        } else {
            datasource?.isList = true
            layoutState = .list
            self.transitionManager = TransitionManager(duration:
                                     TimeInterval(animationDuration),
                                                       collectionView: searchListCollectionView!,
                                      destinationLayout: listLayout,
                                     layoutState: layoutState)
        }
        transitionManager?.startInteractiveTransition()
    }

    /**
     * Show progress
     *
     * - parameters:
     *      -show: show / hide the progress
     *      -status: the text to show in the progress
     */
    func showProgress(_ show: Bool, status: String) {
        showLoader(show, status: status)
    }

    /**
     * Show progress
     *
     * - parameters:
     *      -show: show / hide the progress
     */
    func showProgress(_ show: Bool) {
        showLoader(show)
    }

    /**
     * Show message (alert)
     *
     * - parameters:
     *      -title: title for the alert
     *      -message: message to show in the alert
     *      -actionTitle: text for the action
     */
    func showMessageWith(title: String, message: String, actionTitle: String) {
        showAlertWith(title: title, message: message, actionTitle: actionTitle)
    }

    /**
     * Load tracks
     *
     * - parameters:
     *      -viewModels: array for view model tracks
     *      -fromBeginning: boolean to determinate if we're loading the tracks from scratch
     */
    func loadTracks(_ viewModels: [TrackViewModel], fromBeginning: Bool) {
        if fromBeginning {
            searchListCollectionView?.setContentOffset(CGPoint.zero, animated: false)
        }

        datasource?.items = viewModels
        searchListCollectionView?.reloadData()

        searchListCollectionView?.isHidden = viewModels.isEmpty
        noResultsLabel.isHidden = !viewModels.isEmpty

        if isFirstTime {
            isFirstTime = false
            changeCollectionViewLayout()
        }
    }

    /**
     * Load suggestions
     *
     * - parameters:
     *      -suggestions: array for view model suggestions
     */
    func loadSuggestions(_ suggestions: [SuggestionViewModel]) {
        suggestionsView.suggestions = suggestions
    }

}
