//
//  AlertViewModel.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import API
import Combine
import Foundation

class AlertViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let errorSubject = PassthroughSubject<Error, Never>()

    @Published var isError: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""

    init() {
        bind()
    }

    func bind() {
        errorSubject.map { _ in true }.assign(to: \.isError, on: self).store(in: &cancellables)
        let networkError = errorSubject.compactMap {
            if let networkError = $0 as? NetworkError {
                return networkError
            }
            return nil
        }

        let error = errorSubject.filter { !($0 is NetworkError) }

        networkError.map { _ in L10n.Alert.Network.title }
            .assign(to: \.alertTitle, on: self)
            .store(in: &cancellables)

        networkError.map { "[\($0.statusCode)]\($0.message ?? "")" }
            .assign(to: \.alertMessage, on: self)
            .store(in: &cancellables)

        error.map { _ in L10n.Alert.General.title }
            .assign(to: \.alertTitle, on: self)
            .store(in: &cancellables)

        error.map { $0.localizedDescription }
            .assign(to: \.alertMessage, on: self)
            .store(in: &cancellables)
    }

    func send(error: Error) {
        errorSubject.send(error)
    }
}
