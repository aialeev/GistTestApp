//
//  GistModel.swift
//  GiststestApp
//
//  Created by Aleev Alexey on 26/08/2018.
//  Copyright © 2018 WayRay. All rights reserved.
//

import UIKit

protocol GistModel {
    var id: String { get }
    var description: String { get }
    var avatarURL: URL? { get }
    var login: String { get }
}

struct Gist: GistModel, Decodable {
    var id: String
    var description: String
    var owner: Owner
    
    var login: String {
        get {
            return owner.login
        }
    }
    
    var avatarURL: URL? {
        get {
            return URL(string: owner.avatar_url)
        }
    }
    
}

struct Owner: Decodable {
    var id: String
    var login: String
    var avatar_url: String
}
