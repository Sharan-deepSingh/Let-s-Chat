//
//  SignUpViewModel.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 24/05/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class SignUpViewModel {
    
    /// This method registers the new user on firebase
    /// - Parameters:
    ///   - email: Unique identifier entered by user to distinguish his profile
    ///   - userName: Ulternate unique identifier entered by user to distinguish his prrfile
    ///   - password: A Secret key entered by user using which user can access his data and protects from unauthorized access
    ///   - completion: Has 2 arguments: 1st is for Status and 2nd is for Error.
    func registerNewUser(email: String, userName: String, password: String, completion: @escaping (Bool, Alert?) -> Void) {
        let dataBase = Firestore.firestore()
        
        self.isUserNameAvailable(for: userName, database: dataBase) { status, error in
            
            if let e = error {
                completion(false, e)
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    
                    if let e = error {
                        completion(false, .externalError(e.localizedDescription))
                    } else {
                        if let registeredUser = result?.user {
                            dataBase.collection(AppConstants.FireStore.userTable)
                                .document(registeredUser.uid)
                                .setData(
                                    [
                                        AppConstants.FireStore.userName: userName,
                                    ]
                                ) { error in
                                    if let e = error {
                                        completion(false, .externalError(e.localizedDescription))
                                    } else {
                                        self.sendEmailVerificationLink(for: registeredUser) { status, error in
                                            if let e = error {
                                                completion(false, e)
                                                return
                                            }
                                            completion(true, nil)
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
    
    /// Checks for availability of username on firebase on basis of condition that username must be unique for every user
    /// - Parameters:
    ///   - username: Username entered by user on UI
    ///   - database: Database object on which data is getting stored
    ///   - completion: Callback method with 2 parameters, Bool is for Status (Username available or not) and Error gives datails for failure
    private func isUserNameAvailable(for username: String, database: Firestore, completion: @escaping (Bool, Alert?) -> Void) {
        let query = database.collection(AppConstants.FireStore.userTable)
            .whereField(AppConstants.FireStore.userName, isEqualTo: username)
        
        query.getDocuments { querySnapshot, error in
            if let e = error {
                completion(false, .externalError(e.localizedDescription))
            } else if !(querySnapshot?.isEmpty ?? false) {
                completion(false, .userNameNotAvailable)
            } else {
                completion(true, nil)
            }
        }
    }
    
    /// This method sends a verification link to the user's email address using which we verify that email belongs to the user
    /// - Parameters:
    ///   - user: This contains the information of registered user
    ///   - completion: It has 2 parameters, Bool is to send status of email sending, and AlertMessage is for sending error message if any
    func sendEmailVerificationLink(for user: User, completion: @escaping (Bool, Alert?) -> Void) {
        user.sendEmailVerification { error in
            if let e = error {
                completion(false, .externalError(e.localizedDescription))
                return
            }
            completion(true, nil)
        }
    }
}
