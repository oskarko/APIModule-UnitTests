//
//  MockExplorerService.swift
//  CallToAPITests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import CallToAPI

class MockExplorerService: ExplorerServiceProtocol {
    
    var success: Bool = true
    
    func getPosts(type: PostType, limit: Int, completionHandler: @escaping (Result<ExplorerResponse, Error>) -> Void) {
        if success {
            let posts: [Post] = [
                .init(postId: "1", baseUrl: "http://www.baseUrl.com", url: "http://www.url.com", numLikes: 2, numComments: 2, isLiked: false),
                .init(postId: "2", baseUrl: "http://www.baseUrl.com", url: "http://www.url.com", numLikes: 4, numComments: 1, isLiked: true),
                .init(postId: "3", baseUrl: "http://www.baseUrl.com", url: "http://www.url.com", numLikes: 8, numComments: 0, isLiked: true),
                .init(postId: "17", baseUrl: "http://www.baseUrl.com", url: "http://www.url.com", numLikes: 16, numComments: 4, isLiked: false),
            ]
            let response = ExplorerResponse(posts: posts, last: "mockLastID")
            completionHandler(.success(response))
        } else {
            let error: APIError = .default(description: "MockExplorerService error")
            completionHandler(.failure(error))
        }
    }
    
}
