//
//  MainViewController.swift
//  musicApp
//
//  Created by Станислав Никулин on 17.10.2024.
//

import UIKit

/// Контроллер экрана 'Main', отображающий список песен
final class MainViewController: GenericViewController<MainView> {
    // MARK: - Data
    private let songsData = MainViewMockData.mockData
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
        setupDelegates()
        disableBackNavigation()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupBehaviour() {
        rootView.tableView.register(MainViewTableCell.self, forCellReuseIdentifier: "MainViewTableCell")
    }
    
    func setupDelegates() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
    }
    
    func disableBackNavigation() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        songsData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        rootView.spaceBetweenSections
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        rootView.spaceBetweenSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "MainViewTableCell",
            for: indexPath
        ) as? MainViewTableCell else { return UITableViewCell() }
        let songData = songsData[indexPath.section]
        
        cell.configure(with: songData)
        return cell
    }
}
