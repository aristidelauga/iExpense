//
//  RefreshableScrollView.swift
//  iExpense
//
//  Created by Aristide LAUGA on 30/11/2021.
//

import SwiftUI


private enum PositionType {
    case fixed, moving
}

private struct Position: Equatable {
    let type: PositionType
    let y: CGFloat
}

private struct PositionPreferenceKey: PreferenceKey {
    typealias Value = [Position]
    
    static var defaultValue = [Position]()
    
    static func reduce(value: inout [Position], nextValue: () -> [Position]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias RefreshComplete = () -> Void
    
    typealias OnRefresh = (@escaping RefreshComplete) -> Void
    
    private let THRESHOLD: CGFloat = 50
    
    private enum RefreshState {
        case waiting, primed, loading
    }
}

struct RefreshableScrolLView<Content: View>: View {
    // let onRefresh: onRefresh
    let content: Content
    
}

private struct PositiontIndicator: View {
    
    let type: PositionType
    
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: PositionPreferenceKey.self, value: [Position(type: type, y: proxy.frame(in: .global).minY)])
        }
    }
}
