//
//  LoadingView.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 26/07/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let activityIndicator =  UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.primaryGreen
        return activityIndicator
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            Text("Loading Appetizers...")
                .bold()
                .font(.title)
                .foregroundStyle(.greenPrimary)
            //ActivityIndicator()
        }
    }
}
