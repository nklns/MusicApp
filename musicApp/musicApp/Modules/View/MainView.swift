//
//  MainView.swift
//  musicApp
//
//  Created by Станислав Никулин on 17.10.2024.
//

import UIKit
import SnapKit

/// Основное вью для экрана с таблицей и кнопками управления воспроизведением
final class MainView: UIView {
    // MARK: - UI Elements
    /// Таблица с отступами между секциями для отображения данных
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    private let titleLabel = UILabel()
    private let gradient = CAGradientLayer()
    private let playButton = PlayBackButton(buttonControl: .playButton)
    private let shuffleButton = PlayBackButton(buttonControl: .shuffleButton)
    private let buttonStackView = UIStackView()
    
    // MARK: - Constants
    /// Расстояние между секциями таблицы. Устанавливается для разделения контента
    let spaceBetweenSections: CGFloat = 5
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupAppearance()
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = bounds
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension MainView {
    func setupViews() {
        addSubviews(tableView, titleLabel, buttonStackView)
    }
    
    func setupAppearance() {
        self.layer.insertSublayer(gradient, at: 0)
        
        setupTableView()
        setupGradient()
        setupTitleLabel()
        setupButtonStackView()
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
            $0.centerY.equalToSuperview().offset(100)
        }
    }
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.sectionHeaderHeight = spaceBetweenSections
        tableView.sectionFooterHeight = spaceBetweenSections
        tableView.isScrollEnabled = false
    }
    
    func setupGradient() {
        gradient.colors = [
            UIColor.linearGradientColor1.cgColor,
            UIColor.linearGradientColor2.cgColor,
            UIColor.linearGradientColor3.cgColor
        ]
        gradient.startPoint = .init(x: 0.5, y: 1)
        gradient.endPoint = .init(x: 0.5, y: 0)
        gradient.locations = [0, 0.4, 1]
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Твоя библиотека"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = .white
    }
    
    func setupButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        buttonStackView.alignment = .center
        buttonStackView.distribution = .fillEqually
        [playButton, shuffleButton].forEach { buttonStackView.addArrangedSubview($0) }
    }
}
