

import UIKit
import WebKit//ну библ подключаем

class AuthViewConroller: UIViewController , WKNavigationDelegate {
    //а это по идее тоже самое что и кнопка и тд делается, про WKWebView надо почитать повнимательнее, но по идее тут просто говорится, чтобы JacaScript выполнялся, и фрейм
    private let webveiw: WKWebView = {
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sing In"
        view.backgroundColor = .systemBackground
        webveiw.navigationDelegate = self
        view.addSubview(webveiw)
        guard let url = AuthManager.shared.singInURL else {//ну тут собственно и воходим на наш менеджер в котором мы записали наш url, а вернее чуть ниже, но тут начинается
            return
        }
        webveiw.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webveiw.frame = view.bounds
    }
}
