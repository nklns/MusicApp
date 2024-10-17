//
//  MainViewController.swift
//  musicApp
//
//  Created by Станислав Никулин on 17.10.2024.
//

import UIKit

final class MainViewController: GenericViewController<MainView> {
    
    private let songsData = MainViewMockData.mockData
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func setupBehaviour() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.register(MainViewTableCell.self, forCellReuseIdentifier: "MainViewTableCell")
    }
}

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
