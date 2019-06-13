# FaceCRM

FaceCRM is an iOS client library written in Swift. It is used for register and detect faces. Support both Swift and Objective-C.

## Features
* Find faces from live camera
* Detect faces from FaceCRM system
* Register faces with FaceCRM system

## Requirements
* Xcode 10+
* iOS 10.0+
* Swift 4.2+


## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate FaceCRM into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'FaceCRM'
```

In Xcode project, select your target and drag file Pod_YourProjectName.framework to both `Embedded Binaries` and `Linked Frameworks and Libraries`

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "facecrm/facecrm-ios-sdk"
```

In Xcode project, select your target and drag file eCRM.framework to both `Embedded Binaries` and `Linked Frameworks and Libraries`

## Usage
### Import SDK
```swift
import FaceCRM
```

### Detect face 
Implement in 3 steps:
1. Add camera view into an UIViewController and start to detect.
2. Listen the detected results via events.
3. Stop and remove camera view in UIViewController if you do not want to continue detect.

#### 1. Add camera and start to detect
```swift
FaceCRMSDK.shared.startDetectByCamera(rect, containerView)
```
rect: camera view's frame.

ContainerView: an UIView in your UIViewController, is used to embed camera view.


#### 2. Listen events
#### Found face from live camera
A face is found from live camera, prepare to send FaceCRM system for detect face.
```swift
FaceCRMSDK.shared.onFoundFace() { (face, fullImage) in
}
```
face: UIImage contains a face is found in full image.

#### Detect face successfully from FaceCRM system
```swift

FaceCRMSDK.shared.onDetectSuccess() { (face, fullImage, faceId, metaData) in
}
```
face: UIImage contains a face is found in full image. 

Face ID: a face's indentifier, was detected successfully from FaceCRM system. 

Meta data: the embedded data of the detected face.

#### Detect face failure from FaceCRM system
```swift

FaceCRMSDK.shared.onDetectFail() { (face, fullImage, errorCode, errorMessage) in
}
```
face: UIImage contains a face is found in full image. 

errorCode: error code is returned from FaceCRM system.

errorMessage: error message is returned from FaceCRM system.


#### 3. Stop and remove camera
```swift
FaceCRMSDK.shared.stopCamera()
```

### Register faces
Implement in 5 steps:
1. Add camera view into an UIViewController and start to capture faces.
2. You will decide what face is captured for next step register
3. Send all captured faces or each face to FaceCRM system for register.
2. Listen the register results via events.
3. Stop and remove camera view in UIViewController if you do not want to continue register.

#### 1. Add camera and start to capture faces
```swift
FaceCRMSDK.shared.startRegisterByCamera(rect, containerView)
```
rect: camera view 's frame.

ContainerView: an UIView in your UIViewController, is used to embed camera view.

#### 2. Capture a face for register.
```swift
FaceCRMSDK.shared.captureFace() { (face, fullImage) in
}
```
face: UIImage contains a face is found in full image.

#### 3. Register faces with FaceCRM system
After captured faces, you can register all faces or register each face:

##### Register all faces:
```swift
FaceCRMSDK.shared.registerFaces(faceArray)
```
faceArray: face array is registered

##### Register each face:
```swift
FaceCRMSDK.shared.registerEachFace(face)
```
face: face is registered

With register each face, you need to call the finish function:
```swift
FaceCRMSDK.shared.finishRegister()
```

#### 4. Listen register events
```swift

FaceCRMSDK.shared.onRegister() { (face, status, message) in
}
```

face: UIImage contains a face, was sent to FaceCRM system for register. 

status: register's result code.

message: register 's result message.

#### 5. Stop and remove camera
```swift
FaceCRMSDK.shared.stopCamera()
```

## Sample

The sample app demonstrates the use of the FaceCRM iOS client library. The sample shows scenarios face detection and face registration. [See SAMPLE](https://github.com/facecrm/facecrm-ios-sdk/blob/master/LICENSE) for details.

## License
The FaceCRM is released under the BSD 2 license. [See LICENSE](https://github.com/facecrm/facecrm-ios-sdk/blob/master/LICENSE) for details.

