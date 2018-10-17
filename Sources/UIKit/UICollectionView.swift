//
//  UICollectionView.swift
//  UIKitExt
//
//  Copyright (c) 2018 Javier Zhang (https://wordlessj.github.io/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension UICollectionView {
    public enum ElementKind {
        case sectionHeader
        case sectionFooter
        case custom(String)

        var value: String {
            switch self {
            case .sectionHeader: return UICollectionView.elementKindSectionHeader
            case .sectionFooter: return UICollectionView.elementKindSectionFooter
            case let .custom(string): return string
            }
        }
    }

    public func register<Cell: UICollectionViewCell>(_ type: Cell.Type) {
        register(type, forCellWithReuseIdentifier: String(describing: type))
    }

    public func register<View: UICollectionReusableView>(_ type: View.Type, ofKind kind: ElementKind) {
        register(type, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: String(describing: type))
    }

    public func dequeue<Cell: UICollectionViewCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as! Cell
    }

    public func dequeue<View: UICollectionReusableView>(
        _ type: View.Type,
        ofKind kind: ElementKind,
        for indexPath: IndexPath
    ) -> View {
        return dequeueReusableSupplementaryView(
            ofKind: kind.value,
            withReuseIdentifier: String(describing: type),
            for: indexPath
        ) as! View
    }
}
