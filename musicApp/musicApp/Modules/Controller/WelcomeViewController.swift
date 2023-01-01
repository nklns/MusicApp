//
//  WelcomeViewController.swift
//  musicApp
//
//  Created by Станислав Никулин on 15.10.2024.
//

import UIKit

/// Контроллер экрана 'Welcome', отображающий информацию для пользователя о подписке
final class WelcomeViewController: GenericViewController<WelcomeView> {
    // MARK: - Data
    private let welcomeCells: [WelcomeViewCellModel] = WelcomeViewMockData.mockData

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
        setupDelegates()
    }
}

// MARK: - Private Methods
private extension WelcomeViewController {
    func setupBehaviour() {
        rootView.tableView.register(WelcomeViewTableCell.self, forCellReuseIdentifier: "WelcomeViewTableCell")
        rootView.tableView.dataSource = self
        rootView.tableView.isScrollEnabled = false
        rootView.tableView.reloadData()
    }
    
    func setupDelegates() {
        rootView.delegate = self
        rootView.tableView.delegate = self
    }
}

extension WelcomeViewController: ButtonTappedDelegate {
    func buttonTapped() {
        let mainVC = MainViewController()
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WelcomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        welcomeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WelcomeViewTableCell", for: indexPath) as? WelcomeViewTableCell else { return UITableViewCell() }
        
        let welcomeCell = welcomeCells[indexPath.section]
        cell.configure(model: welcomeCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return rootView.spaceBetweenSections
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return rootView.spaceBetweenSections
    }
}
