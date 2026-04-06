//
//  LoginViewModel.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 31/05/24.
//

import UIKit
import FirebaseAuth

final class LoginViewModel {
    
    func loginUser(with email: String, password: String, completion: @escaping (Bool, Alert?, User?) -> Void) {
        let auth = Auth.auth()
        
        auth.signIn(withEmail: email, password: password) { result, error in
            if let e = error {
                completion(false, .externalError(e.localizedDescription), nil)
                
                return
            }
            
            let loggedInUser = result?.user
            
            self.checkEmailVerificationStatus(of: loggedInUser) { status, error in
                if let e = error {
                    self.logout() { status, error in
                        if let e = error {
                            completion(false, e, loggedInUser)
                            return
                        }
                    }
                    completion(status, e, nil)
                    return
                }
                
                completion(true, nil, loggedInUser)
            }
        }
    }
    
    private func checkEmailVerificationStatus(of user: User?, closure: @escaping (Bool, Alert?) -> Void) {
        if let user = user {
            user.reload { error in
                if let e = error {
                    closure(false, .externalError(e.localizedDescription))
                    return
                }
                
                user.isEmailVerified ? closure(true, nil) : closure(false, .emailNotVerified)
            }
        }
    }
    
    private func logout(completion: @escaping (Bool, Alert?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch {
            completion(false, .externalError(error.localizedDescription))
        }
    }
}
