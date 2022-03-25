
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "c9dcf1f4c5fa4fe3a43ef37e36849917"
        static let clientSecret = "da6e7666a26f4dc3ba4109458199cfea"
    }
    
    private init() {}
    //ну тут вообще все понятно, а вот эти приколы, в виде scopes, base  и тд, сделаны для безопасности
    public var singInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.iosacademy/io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?responce+type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)"
        return URL(string:  string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpritationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
