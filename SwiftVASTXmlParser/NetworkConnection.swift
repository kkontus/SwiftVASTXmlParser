//
//  NetworkConnection.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 24/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import Alamofire

class NetworkConnection {
    private let developmentDomain = Config.developmentDomain
    private let productionDomain = Config.productionDomain
    private let certificateFilename = Config.certificateFilename
    private let certificateExtension = Config.certificateExtension
    
    private let useSSL = true
    var manager: SessionManager!
    private var serverTrustPolicies: [String : ServerTrustPolicy] = [String:ServerTrustPolicy]()
    static let sharedManager = NetworkConnection()
    
    init(){
        if useSSL {
            manager = initSafeManager()
        } else {
            manager = initUnsafeManager()
        }
    }
    
    // USED FOR SITES WITH CERTIFICATE, OTHERWISE .DisableEvaluation
    private func initSafeManager() -> SessionManager {
        setServerTrustPolicies()
        
        manager = SessionManager(configuration: URLSessionConfiguration.default, delegate: SessionDelegate(), serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        
        return manager
    }
    
    // USED FOR SITES WITHOUT CERTIFICATE, DOESN'T CHECK FOR CERTIFICATE
    private func initUnsafeManager() -> SessionManager {
        manager = Alamofire.SessionManager.default
        
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = self.manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            
            return (disposition, credential)
        }
        
        return manager
    }
    
    private func setServerTrustPolicies() {
        let pathToCert = Bundle.main.path(forResource: certificateFilename, ofType: certificateExtension)
        let localCertificate:Data = try! Data(contentsOf: URL(fileURLWithPath: pathToCert!))
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            productionDomain: .pinCertificates(
                certificates: [SecCertificateCreateWithData(nil, localCertificate as CFData)!],
                validateCertificateChain: true,
                validateHost: true
            ),
            developmentDomain: .disableEvaluation
        ]
        
        self.serverTrustPolicies = serverTrustPolicies
    }
    
    static func addAuthorizationHeader(_ token: String, tokenType: String) -> [String : String] {
        let headers = [
            "Authorization": tokenType + " " + token
        ]
        
        return headers
    }
    
    static func addUserAgent(_ userAgent: String) -> [String : String] {
        let headers = [
            "User-Agent": userAgent
        ]
        
        return headers
    }
    
}

