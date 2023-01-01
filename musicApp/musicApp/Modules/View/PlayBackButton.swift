//
//  PlayBackButton.swift
//  musicApp
//
//  Created by Станислав Никулин on 18.10.2024.
//

import UIKit
import SnapKit

/// Кастомная кнопка для управления воспроизведением и перемешиванием
final class PlayBackButton: UIButton {
    // MARK: - UI Elements
    
    private let textLabel = UILabel()
    private let iconImageView = UIImageView()
    private let buttonControl: PlaybackControls
    
    // MARK: - Init
    /// Инициализация с указанием типа кнопки
    init(buttonControl: PlaybackControls) {
        self.buttonControl = buttonControl
        super.init(frame: .zero)
        
        setupViews()
        setupAppearance()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension PlayBackButton {
    func setupViews() {
        addSubviews(textLabel, iconImageView)
    }
    
    func setupAppearance() {
        backgroundColor = .white.withAlphaComponent(0.9)
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        setupImageAndText()
        setupTextLabel()
        setupIconImageView()
    }
    
    func setupLayout() {
        textLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        iconImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(textLabel.snp.top)
            $0.bottom.equalTo(textLabel.snp.bottom)
        }
    }
}

private extension PlayBackButton {
    func setupImageAndText() {
        switch buttonControl {
        case .playButton:
            iconImageView.image = UIImage(systemName: "play.fill")
            textLabel.text = "Слушать"
        case .shuffleButton:
            iconImageView.image = UIImage(systemName: "shuffle")
            textLabel.text = "Перемешать"
        }
    }
    
    func setupTextLabel() {
        textLabel.textColor = .purple
        textLabel.font = .systemFont(ofSize: 13, weight: .bold)
    }
    
    func setupIconImageView() {
        iconImageView.tintColor = .purple
        iconImageView.image?.applyingSymbolConfiguration(.init(font: .systemFont(ofSize: 8, weight: .bold)))
    }
}
