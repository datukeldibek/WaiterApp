//
//  TabContent.swift
//  WaiterApp
//
//  Created by Datu on 26/4/24.
//

import SwiftUI

public struct TabContent: View {
    // MARK: - Typealias

    public typealias SegmentData = (title: String, tag: Int)

    // MARK: - Private Properties

    @Namespace private var namespace
    @Binding private var selection: Int
    
    private let segments: [SegmentData]

    // MARK: - Initializers

    public init(selection: Binding<Int>) {
        self._selection = selection
        segments = [
            (title: "Столы", tag: 0),
            (title: "Заказы", tag: 1),
        ]
    }

    // MARK: - Views

    public var body: some View {
        ZStack(alignment: .center) {
            Color.gray
                .cornerRadius(8)
            contentView
        }
        .frame(height: 38)
    }

    private var contentView: some View {
        HStack(alignment: .center) {
            ForEach(0 ..< segments.count) { index in
                makeSegmentBy(index: index)
            }
        }
    }

    @ViewBuilder
    private func makeSegmentBy(index: Int) -> some View {
        Button {
            HapticService.generateHaptic(style: .medium)
            selection = segments[index].tag
        } label: {
            Spacer()
            Text(segments[index].title)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .fontWeight(selection == segments[index].tag ? .bold : .medium)
            Spacer()
        }
        .background(
            Group {
                if segments[index].tag == selection {
                    AppColors.getColor(.primaryPurple)
                        .frame(height: 38)
                        .cornerRadius(8)
                        .matchedGeometryEffect(id: "selector", in: namespace)
                }
            },
            alignment: .center
        )
        .allowsHitTesting(selection == segments[index].tag ? false : true)
    }
}

public final class HapticService {
    public static func generateHaptic(
        style: UIImpactFeedbackGenerator.FeedbackStyle,
        intensity: CGFloat = 1
    ) {
       let generator = UIImpactFeedbackGenerator(style: style)
       generator.impactOccurred(intensity: intensity)
    }
}


#Preview {
    TabContent(selection: .constant(0))
}
