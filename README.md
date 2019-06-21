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

After setup camera successfully, SDK send to you a camera view's layer. 

You need to set this layer's frame and add it to your UIViewController.
```swift
FaceCRM.shared.startDetectByCamera() { (cameraView) in
cameraView.frame = rect
self.view.layer.addSublayer(cameraView)
}
```
rect: camera view's frame.

ContainerView: an UIView in your UIViewController, is used to embed camera view.


#### 2. Listen events
#### Found face from live camera
A face is found from live camera, prepare to send FaceCRM system for detect face. 

Notice that you only found a face in this step, you do not know who this face is. This face will be sent to FaceCRM for detection.


```swift
FaceCRM.shared.onFoundFace() { (face, fullImage) in
}
```
face: UIImage contains a face is found in full image.

#### Detect face successfully from FaceCRM system
```swift

FaceCRM.shared.onDetectSuccess() { (face, fullImage, model) in
}
```
face: UIImage contains a face is found in full image. 

Model: an object contains face 's information like: face ID (a face's indentifier, was detected successfully from FaceCRM system), age, gender, emotion, your custom metadata....


#### Detect face failure from FaceCRM system
```swift

FaceCRM.shared.onDetectFail() { (face, fullImage, errorCode, errorMessage) in
}
```
face: UIImage contains a face is found in full image. 

errorCode: error code is returned from FaceCRM system.

errorMessage: error message is returned from FaceCRM system.


#### 3. Stop and remove camera
```swift
FaceCRM.shared.stopCamera()
```

### Register faces
Implement in 5 steps:
1. Add camera view into an UIViewController and start to capture faces.
2. You will decide what face is captured for next step register
3. Send all captured faces or each face to FaceCRM system for register.
2. Listen the register results via events.
3. Stop and remove camera view in UIViewController if you do not want to continue register.

#### 1. Add camera and start to capture faces

After setup camera successfully, SDK send to you a camera view's layer. 

You need to set this layer's frame and add it to your UIViewController.
```swift
FaceCRM.shared.startRegisterByCamera() { (cameraView) in
cameraView.frame = rect
self.view.layer.addSublayer(cameraView)
}
```
rect: camera view 's frame.

ContainerView: an UIView in your UIViewController, is used to embed camera view.

#### 2. Capture a face for register.
```swift
FaceCRM.shared.captureFace() 
```

Listen event for capture face successfully:
```swift
FaceCRM.shared.onCapture() { (cropImage, fullImage) in
}
```
face: UIImage contains a face is found in full image.


#### 3. Register faces with FaceCRM system
After captured faces, you can register all faces:

```swift
FaceCRM.shared.registerFaces(faceArray)
```
faceArray: face array is registered

You need at least a face for register.


#### 4. Listen register events
Register process has 2 step: Upload all faces to server. Then, register these faces. You need upload successfully at least 1 face for continue the register step.

You can listen events for both upload step and register step.

##### Event upload each photo successfully:
```swift

FaceCRM.shared.onUploadSuccess() { (face) in
}
```
face: face is uploaded successfully prepare to the register step

##### Event upload each photo fail:
```swift
FaceCRM.shared.onUploadFail() { (face, code, message) in
}
```
face: face is uploaded fail

code: upload's result code.

message: upload's result message.

##### Register all faces successfully:
```swift

FaceCRM.shared.onRegisterSuccess() { (faceArray, faceID) in
}
```
faceArray: face array is registered

faceID: a face's indentifier is registered successfully.



##### Register all faces fail:

```swift

FaceCRM.shared.onRegisterFail() { (faceArray, code, message) in
}
```
faceArray: face array is registered

code: register's result code.

message: register's result message.



#### 5. Stop and remove camera
```swift
FaceCRM.shared.stopCamera()
```

### Config for camera
#### 1. Set camera's scan frequency
Camera view will scan to found face each 1 second. Default ( also minimum) is 1 second.
```swift
FaceCRM.shared.setScanFrequency(1.5) // 1.5 seconds
```

#### 2. Set rate (or the difficult level) for face detection 
Range is from 0% to 100%. Minimum (also default) should be 50% and maximum should be 90%.
```swift
FaceCRM.shared.setDetectRate(50)
```
With higher percentage, detection's algorithm is also more complex. You will be harder to detect a face but you can detect exactly who you are.

With lower percentage, detection 's algorithm is also less complex. You will be easier to detect a face but this face can be confused between many different faces


#### 3. Set whether show face's rectangle or not 

when camera view scan and found a face, camera view will show a rectangle bounds face. 

Default is always show. if you do not want to show, you can turn off.
```swift
FaceCRM.shared.enableShowFaceResult(false)
```

#### 4. Set border's color and width in face's rectangle 
when camera view scan and found a face, camera view will show a rectangle bounds face.

Default border's color is blue and border's width is 2 pixel. You can change border's info.
```swift
FaceCRM.shared.setFaceRectangle(UIColor.green, 1)
```
#### 5. Change camera's position between front and rear 
After setup camera successfully, camera's position is front like default. 

You can update this position by switch action.

```swift
FaceCRM.shared.switchCameraPosition()
```
You can update this position by setup action.
```swift
FaceCRM.shared.setCameraPosition(FaceCRM.CAMERA_POSITION_FRONT)
FaceCRM.shared.setCameraPosition(FaceCRM.CAMERA_POSITION_REAR)
```
You can get current position.
```swift
let position = FaceCRM.shared.getCurrentCameraPosition()
```

### Config for detection and registration
#### 1. Set detection type
When detecting successfully a face, you will receive a model. This model contains face's info. Default info is faceID and your custom metadata.

You can get more other info like: age, gender, emotion (analyze from your detection face)
```swift
let type = [FaceCRM.DETECT_TYPE_AGE, FaceCRM.DETECT_TYPE_GENDER, FaceCRM.DETECT_TYPE_EMOTION]
FaceCRM.shared.setDetectType(type)
```

#### 2. Set CollectionId
Collection's mean is a group that you joined. It maybe your country, company, club, school, class, clan...

You can get collection id from FaceCRM system's CMS and set to SDK for both detection step and registration step.
```swift
FaceCRM.shared.setCollectionId(3)
```

#### 3. Set TagId
Tag's mean is your personal information. It maybe your age, gender, favorite, language, work...


You can get tag id from FaceCRM system's CMS and set to SDK for both detection step and registration step.
```swift
FaceCRM.shared.setTagId(4)
```

#### 4. Set your custom metadata
You can set your custom metadata in the register step.

* NOTICE: metadata needs the json format.

```swift
FaceCRM.shared.setMetaData("{\"name\":\"Michael\"}")
```

You can create a string with json format manually. Beside, you can also create this string from a NSMutableDictionary:

```swift
let dictionary = NSMutableDictionary()
dict.setValue("Michael", forKey: "name")
FaceCRM.shared.setMetaDataFromDict(dict)
```

## Sample 

The sample app demonstrates the use of the FaceCRM iOS client library. The sample shows scenarios face detection and face registration. [See SAMPLE](https://github.com/facecrm/facecrm-ios-sample) for details.

## License
The FaceCRM is released under the BSD 2 license. [See LICENSE](https://github.com/facecrm/facecrm-ios-sdk/blob/master/LICENSE) for details.


