//
//  WelcomeViewController.swift
//  musicApp
//
//  Created by Станислав Никулин on 15.10.2024.
//

import UIKit

class WelcomeViewController: GenericViewController<WelcomeView> {
    
    var welcomeCells: [CellModel] = MockData.mockData
    
    let spaceBetweenSections: CGFloat = 10

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
    }
}

// MARK: - Private Methods

private extension WelcomeViewController {
    func setupBehaviour() {
        rootView.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        rootView.tableView.isScrollEnabled = false
        rootView.tableView.sectionHeaderHeight = spaceBetweenSections
        rootView.tableView.sectionFooterHeight = spaceBetweenSections
        rootView.tableView.reloadData()
    }
}

extension WelcomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        welcomeCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let welcomeCell = welcomeCells[indexPath.section]
        cell.configure(model: welcomeCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return spaceBetweenSections
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return spaceBetweenSections
    }

}

extension WelcomeViewController: UITableViewDelegate {
    
}
