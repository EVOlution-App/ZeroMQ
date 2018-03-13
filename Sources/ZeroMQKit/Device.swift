// Proxy.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import CZeroMQ

public enum DeviceType {
    case streamer
    case forwarder
    case queue
}

extension DeviceType {
    init?(rawValue: Int32) {
        switch rawValue {
        case ZMQ_STREAMER:  self = .streamer
        case ZMQ_FORWARDER: self = .forwarder
        case ZMQ_QUEUE:     self = .queue
        default:            return nil
        }
    }
}

extension DeviceType {
    var rawValue: Int32 {
        switch self {
        case .streamer: return ZMQ_STREAMER
        case .forwarder: return ZMQ_FORWARDER
        case .queue: return ZMQ_QUEUE
        }
    }
}

public func device(type: DeviceType, frontend: Socket, backend: Socket) {
    zmq_device(type.rawValue, frontend.socket, backend.socket)
}

