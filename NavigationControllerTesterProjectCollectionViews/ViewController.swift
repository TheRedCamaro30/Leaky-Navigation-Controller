//
//  ViewController.swift
//  NavigationControllerTesterProjectCollectionViews
//
//

import UIKit

class ViewController: UIViewController {

    var constraints:[NSLayoutConstraint]? = [NSLayoutConstraint]()
    
     lazy var nextButton:UIButton? = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.red
        return button
    }()
    

    lazy var backButton:UIButton? = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        return button
    }()

     lazy var imageView:UIImageView? = {
        //let image = #imageLiteral(resourceName: "DJI_0014")
        //let imageView = UIImageView(image: image)
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = UIColor.green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let imageView = self.imageView, let nextButton = self.nextButton, let backButton = self.backButton else{
            print("imageView, nextButton are nil")
            return
        }
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(imageView)
        
        self.view.addSubview(backButton)
        
        view.addSubview(nextButton)
        constraints?.append(contentsOf: [
            imageView.topAnchor.constraint(equalTo:self.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                            nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                            nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
                            nextButton.heightAnchor.constraint(equalToConstant: 200),
                            nextButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 200),
            backButton.heightAnchor.constraint(equalToConstant: 200)])
        
        if let constraints = constraints{
            NSLayoutConstraint.activate(constraints)
        }
    }

    @objc func backButtonTapped(){
        print("back button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped(){
        print("next button tapped")
        let vc = ViewController()
        vc.view.backgroundColor = UIColor.blue
        vc.title = "Next View Controller"
        self.navigationController?.pushViewController(vc, animated: true)
        print("Views currently existing: \(navigationController?.viewControllers.count)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    

    
    
    deinit {
        print("view controller is deinitialized")
    }

}
