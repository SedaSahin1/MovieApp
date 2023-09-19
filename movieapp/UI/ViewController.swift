//
//  ViewController.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import UIKit
import NVActivityIndicatorView

protocol ViewControllerProtocol: AnyObject {
    associatedtype T
    init(viewModel: T)
}
public class ViewController<U>: UIViewController {
    typealias T = U
    var viewModel: T?
    var spinner = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .orange, padding: 10)
    var loadingView = UIView()
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setLoading()
    }
    func setLoading(){
        loadingView.backgroundColor = .clear
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.isUserInteractionEnabled = true
        view.addSubview(loadingView)
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        loadingView.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        loadingView.isHidden = true
    }
    func startLoading(){
        DispatchQueue.main.async {
            self.loadingView.isHidden = false
        }
    }
    func stopLoading(){
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
}
