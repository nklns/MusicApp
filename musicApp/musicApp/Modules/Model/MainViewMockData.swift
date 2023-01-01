//
//  MainViewMockData.swift
//  musicApp
//
//  Created by Станислав Никулин on 17.10.2024.
//

import Foundation
import UIKit

/// Моковые данные для главного экрана, содержащие список песен с информацией об исполнителях и альбомах
struct MainViewMockData {
    /// Массив с данными песен для отображения на главном экране
    static let mockData: [MainViewCellModel] = [
        .init(songName: "Hero", artistName: "Skillet", albumImage: UIImage(named: "awake")!),
        .init(songName: "Add Up My Love", artistName: "Clairo", albumImage: UIImage(named: "charm")!),
        .init(songName: "Прыгну со скалы", artistName: "Король и Шут", albumImage: UIImage(named: "kish")!),
        .init(songName: "Send Me an Angel", artistName: "Scorpions", albumImage: UIImage(named: "crazyWorld")!),
        .init(songName: "Sunday", artistName: "The Cranberries", albumImage: UIImage(named: "cranberries")!)
    ]
}

