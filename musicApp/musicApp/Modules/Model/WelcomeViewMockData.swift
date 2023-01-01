//
//  MockData.swift
//  musicApp
//
//  Created by Станислав Никулин on 16.10.2024.
//

import Foundation
import UIKit

/// Структура для хранения моковых данных ячеек экрана приветствия
struct WelcomeViewMockData {
    /// Массив с данными для отображения в ячейках экрана приветствия
    static let mockData: [WelcomeViewCellModel] = [
        .init(image: UIImage(systemName: "lock.open.fill")!, title: "Сегодня - бесплатный доступ", description: "Наслаждайся 1000+ музыки и подкастов"),
        .init(image: UIImage(systemName: "bell.fill")!, title: "День 5 - напоминание", description: "Мы отправим тебе уведомление, чтобы напомнить,\nкогда заканчивается пробный период"),
        .init(image: UIImage(systemName: "checkmark.seal.fill")!, title: "День 7 - окончание бесплатного периода", description: "Твоя подписка начнет действовать. Ты сможешь\nлегко отменить её после этого дня")
    ]
}
