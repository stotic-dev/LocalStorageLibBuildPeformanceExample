//
//  AddMemoView.swift
//  LocalStoragePeformanceExample
//
//  Created by 佐藤汰一 on 2025/05/31.
//

import SwiftUI

struct AddMemoView: View {
    @Environment(\.dismiss) var dismiss
    @State private var state: AddMemoViewState
    private let presenter: AddMemoViewPresenter
    
    init(state: AddMemoViewState) {
        self.state = state
        self.presenter = .init(state: state)
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 24)
            Text("Add Memo")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("input memo", text: $state.textFieldText)
                .font(.title3)
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .opacity(0.2)
                }
            Spacer()
                .frame(height: 24)
            Button {
                Task {
                    await presenter.tappedSaveButton()
                    dismiss()
                }
            } label: {
                Text("Save")
                    .font(.title2)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
            }
            .disabled(state.isEnabledSaveButton)
            .foregroundStyle(.white)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AddMemoView(state: .init())
}
