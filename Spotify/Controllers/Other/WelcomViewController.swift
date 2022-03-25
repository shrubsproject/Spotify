

import UIKit


class WelcomViewController: UIViewController {
    
    private let singInbutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Sing In with Spotify", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.layer.cornerRadius = 11
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(singInbutton)
        singInbutton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        singInbutton.frame = CGRect(x: 20, y: view.height-50-view.safeAreaInsets.bottom, width: view.width-40, height: 50)
    }
   
    @objc func didTapSingIn(){
        let vc = AuthViewConroller()
        vc.completionHandler = { [weak self] success in//это хуйня нам нужна для того чтобы говорить, успешный вход или нет
            self?.handleSingIn(success: success)
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSingIn(success: Bool) {
        //надо ошибки
    }
}
