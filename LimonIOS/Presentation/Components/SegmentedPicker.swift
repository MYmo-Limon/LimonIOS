//
//  CustomSelector.swift
//  LimonIOS
//
//  Created by Marcos on 8/6/24.
//

import SwiftUI
struct SegmentedPicker: View {
    @Binding var selectedSegment : Int
  let segments: [String]

  var body: some View {
    VStack {
      HStack(spacing: 20) {
        ForEach(0..<segments.count, id: \.self) { index in
          VStack {
            Circle()
                  .fill(selectedSegment == index ? Color.SecondaryCustom : .white)
                  .frame(width: 30, height: 30)
                  .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1)
                  )

            Text(String(index + 1))
              .foregroundColor(.black)
          }
          .onTapGesture {
            selectedSegment = index
          }
        }
      }
    }
  }
}
