//
//  TabSection.swift
//  
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import Foundation

public enum TabSection: CaseIterable {
    case search
    case favorites
    case applied
    case chat
    case profile

    
    
    var iconName: String {
        switch self {
        case .search: return "iconChat"
        case .favorites: return "iconChat"
        case .applied: return "iconChat"
        case .chat: return "iconChat"
        case .profile: return "iconProfile"
        }
    }

    var tabTitle: String {
        switch self {
        case .search: return "Поиск"
        case .favorites: return "Избранное"
        case .applied: return "Отклики"
        case .chat: return "Сообщения"
        case .profile: return "Профиль"
        }
    }
}

