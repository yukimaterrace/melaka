//
//  TokenMapper.swift
//  Mapper
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/06/02.
//

import Domain
import  API

public class TokenMapper {
    
    public static func map(_ loginResponse: LoginResponse) -> Token {
        return .init(token: loginResponse.token,
                     userId: loginResponse.userId)
    }
}
