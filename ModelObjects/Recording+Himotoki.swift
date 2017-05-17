//
//  Recording+Himotoki.swift
//  JSONShootout
//
//  Created by orakaro on 2017/05/17.
//  Copyright © 2017 SwiftBit. All rights reserved.
//

import Foundation
import Himotoki

extension Recording: Decodable {
    public static func decode(_ e: Extractor) throws -> Recording {
        let status: Status = (try? e <| "Status") ?? .Unknown
        let recGroup: RecGroup = (try? e <| "RecGroup") ?? .Unknown
        
        return try Recording(
            startTsStr: e <| "StartTs",
            status: status,
            recordId: e <| "RecordId",
            recGroup: recGroup
        )
    }
}
