//
//  OnboardingViewController.swift
//  Tracker
//
//  Created by Никита Гончаров on 30.01.2024.
//

import UIKit

final class OnboardingViewController: UIPageViewController {
    // MARK: - UI-Elements
    private var pages: [UIViewController] = []
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.3)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Вот это технологии!", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializers
    override init(
        transitionStyle style: UIPageViewController.TransitionStyle,
        navigationOrientation: UIPageViewController.NavigationOrientation,
        options: [UIPageViewController.OptionsKey : Any]? = nil
    ) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        setupOnboardingPages()
        setupSubviews()
        setupConstraints()
    }
}


// MARK: - UIPageViewControllerDataSource
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else {
            return nil
        }
        
        return pages[nextIndex]
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let currentViewController = pageViewController.viewControllers?.first,
           let currentIndex = pages.firstIndex(of: currentViewController) {
            pageControl.currentPage = currentIndex
        }
    }
}

// MARK: - Private Methods

private extension OnboardingViewController {
    func setupOnboardingPages() {
        
        let page1 = createOnboardingPage(
            imageName: "Onboarding page1",
            labelText: "Отслеживайте только то, что хотите"
        )
        
        let page2 = createOnboardingPage(
            imageName: "Onboarding page2",
            labelText: "Даже если это\nне литры воды или йога"
        )
        
        pages.append(page1)
        pages.append(page2)
        
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func setupSubviews() {
        [pageControl,
         button
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 594),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 24),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    @objc func buttonTapped() {
        let tabBarController = TabBarController()
        guard let window = UIApplication.shared.windows.first else { fatalError("Invalid Configuration") }
        window.rootViewController = tabBarController
    }
    func createOnboardingPage(imageName: String, labelText: String) -> UIViewController {
        let onboardingVC = UIViewController()
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        onboardingVC.view.addSubview(imageView)
        
        let label = UILabel()
        label.text = labelText
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        onboardingVC.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: onboardingVC.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: onboardingVC.view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: onboardingVC.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: onboardingVC.view.trailingAnchor),
            
            label.centerXAnchor.constraint(equalTo: onboardingVC.view.centerXAnchor),
            label.topAnchor.constraint(equalTo: onboardingVC.view.topAnchor, constant: 452),
            label.leadingAnchor.constraint(equalTo: onboardingVC.view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: onboardingVC.view.trailingAnchor, constant: -16)
        ])
        
        return onboardingVC
    }
}
