import UIKit

@objc public class FCUserModel:NSObject, Codable{
    @objc public var faceId:String = ""
    @objc public var age:String = ""
    @objc public var emotion:String = ""
    @objc public var gender:String = ""
    @objc public var detectTime:String = ""
    @objc public var metaData:Array<String> = []
    @objc public var jsonData:Dictionary<String,Any> = [:]
    @objc public var historyData:Dictionary<String,Any> = [:]
    
    private enum CodingKeys: String, CodingKey {
        case faceId, age, emotion, gender, jsonData, metaData, detectTime
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(faceId, forKey: .faceId)
        try container.encode(age, forKey: .age)
        try container.encode(emotion, forKey: .emotion)
        try container.encode(gender, forKey: .gender)
        try container.encode(detectTime, forKey: .detectTime)
        try container.encode(metaData, forKey: .metaData)
        
        let data = try! JSONSerialization.data(withJSONObject:jsonData, options:[])
        try container.encode(data, forKey: .jsonData)
    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        faceId = try container.decode(String.self, forKey: .faceId)
        age = try container.decode(String.self, forKey: .age)
        emotion = try container.decode(String.self, forKey: .emotion)
        gender = try container.decode(String.self, forKey: .gender)
        detectTime = try container.decode(String.self, forKey: .detectTime)
        metaData = try container.decode(Array<String>.self, forKey: .metaData)
        
        let data = try container.decode(Data.self, forKey: .jsonData)
        if let dict = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
            jsonData = dict
        }
    }
    
    override init() {
        super.init()
    }
}
