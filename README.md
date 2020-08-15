
# BACKBASE Task

  
<div  align="left">

<!-- Swift version -->

<img  src="https://img.shields.io/badge/swift%20version-5.0-brightgreen.svg"  alt="swift version">

<!-- Platform -->

<img  src="https://img.shields.io/badge/platform-ios-lightgrey.svg"  alt="platform" />

</div>

# App Features
- [x] Display list of Cities
- [x] Handle decode error 
- [x] Search for specific cities
- [x] UnitTest

  

## Architecture

This project is using MVVM-B pattern where:

  

- View is represented by `UIViewController` designed in Storyboard

- Entities are DTO

- **ViewModel** interacts with Model and prepares data to be displayed. View uses ViewModel's data either directly or through **bindings (using Combine)*** to configure itself. View also notifies ViewModel about user actions like search text.
- **Builder** is the key for reusability, declares what data is needed for the Module to be built, **injects**
  
- **Tries** is the key for data structure that facilitates efficient prefix matching with **O(m)** time (where m is the length of a search string.

## Requirements

- Xcode Version 11.5+

- Swift 5.0+

- iOS 13.0+