//
//  MainViewModel.swift
//  musicApp
//
//  Created by Станислав Никулин on 17.10.2024.
//

import Foundation
import UIKit

/// Модель для представления данных песни в ячейке главного экрана
struct MainViewCellModel {
    /// Название песни
    let songName: String
    /// Имя исполнителя
    let artistName: String
    /// Изображение альбома
    let albumImage: UIImage
}

/// Тип кнопок управления воспроизведением
enum PlaybackControls {
    /// Кнопка воспроизведения
    case playButton
    /// Кнопка перемешивания
    case shuffleButton
}

