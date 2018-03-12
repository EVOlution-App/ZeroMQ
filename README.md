# ZeroMQKit

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![License][mit-badge]][mit-url]

**ZeroMQKit** is a [0mq](http://zeromq.org/) binding for **Swift 4** and this repository is a fork of [ZeroMQ](https://github.com/Zewo/ZeroMQ).

## Features

- [x] Context
- [x] Socket
- [x] Message
- [x] Poller
- [x] Proxy

##Example

```swift
import ZeroMQKit

guard let context = try? Context() else {
    fatalError("Context could not be instantiated")
}

guard let inbound = try? context.socket(.pull) else {
    fatalError("Cannot create socket to .pull")
}
try? inbound.bind("tcp://127.0.0.1:5555")

if let outbound = try? context.socket(.push) {
    try outbound.connect("tcp://127.0.0.1:5555")
    
    _ = try outbound.send("Hello World!")
    _ = try outbound.send("Bye!")
}

while let data = try? inbound.receive(), let value = data, value != "Bye!" {
    print(value) // "Hello World!"
}
```

## Installation

Install ZeroMQ system library

```sh
./setup_env.sh
```

Add `ZeroMQ` to `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/unnamedd/ZeroMQ.git", .upToNextMajor(from: "1.0.0")),
    ]
)
```

## Support

If you need any help you can join on [Slack](http://slack.zewo.io) of Zewo and go to the **#help** channel. Or you can create a Github [issue](https://github.com/Zewo/Zewo/issues/new) in our main repository. When stating your issue be sure to add enough details, specify what module is causing the problem and reproduction steps.

## License

This project is released under the MIT license. See [LICENSE](LICENSE) for details.

[swift-badge]: https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
