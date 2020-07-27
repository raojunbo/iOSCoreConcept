//
//  MoyaTestViewController.swift
//  CoreConcept
//
//  Created by rjb on 2020/7/16.
//  Copyright © 2020 rjb. All rights reserved.
//

import UIKit
import Moya

//因为MoyaTestViewController是继承于UIViewController
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator {
    func random() -> Double {
        return 1.0
    }
}

class Dice {
    let sides:Int = 0
    let generator:RandomNumberGenerator
    init(sides:Int, generator:RandomNumberGenerator) {
        
        self.generator = generator
    }
}

protocol DiceGame {
    //定义协议的，有个自读
    var dice:Dice {get}
    func play()
}

protocol DiceGameDeleagate {
    func gameDidStart(game:DiceGame , didStartNewTurnWithRoll diceRoll:Int)
    func gameDidEnd(game:DiceGame)
}

class SnakesAndLandders: DiceGame {
    var dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var delegate:DiceGameDeleagate?
    func play() {
        //执行代理方法
        delegate?.gameDidEnd(game: self)
    }
}

protocol FirstProtocol {
    //表明是可读可写属性
    var musteSettable:Int{ get set }
    //表明是只读属性
    var doesNotNeedToBeSettable:Int { get }
}

struct Person:FirstProtocol {
    var doesNotNeedToBeSettable: Int
    
    var musteSettable: Int {
        get {
            return 10
        }
        set {
            
        }
    }
    
}
class MediaItem {
    var name: String?
    init(name: String) {
        self.name = name
    }
}

class Movie:MediaItem {
    var director:String
    init(name: String, director:String ) {
        self.director = director
        //初始化方法必须调用super
        super.init(name: name)
    }
}

class Song:MediaItem {
    var artist: String
    init(name:String, artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}


class MoyaTestViewController: UIViewController {
    
    var button = UIButton(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height:50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("我是button", for: UIControl.State.normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(testMoya), for: UIControl.Event.touchUpInside)
        view.addSubview(button)
        
        struct FixedLengthRange {
            var firtValue:Int
            let length:Int
        }
        //结构体类型为什么没有初始值
        var range = FixedLengthRange(firtValue: 10, length: 10)
        range.firtValue = 20
        
        class NewPruct {
            var name:String = ""
            let price:Float = 120
            init(name:String) {
                self.name = name
            }
        }
        
        let product = NewPruct(name: "我是name")
        product.name = "f"
        
        //定义结构体
        struct Point {
            var x = 0
            var y = 0
        }
        
        struct Size {
            var width = 0
            var height = 0
        }
        
        
        
        struct Rect {
            var origin = Point()
            var size = Size()
            //center 是一个计算属性
            //可以给器set,get方法
            var center:Point{
                //                get {
                let centerX = origin.x + (size.width/2)
                let centerY = origin.y + (size.height/2)
                return Point(x: centerX, y: centerY)
                //                }
                //                set(myCenter) {
                //
                //                }
            }
        }
        
    }
    
    @objc func testMoya()  {
       
    }
    
    func someFunction<T: Song,U:RandomNumberGenerator>(someT:T,someU:U) {
        //
    }

    
    func testParam(ii i:Int) -> Int {
        //        i = 100
        return 1
    }
    
    func testObject ()  {
        let library = [
            Movie(name: "rao", director: "导演"),
            Song(name: "junbo", artist: "艺术家")
        ]
        
        for item in library {
            //is
            if item is Movie {
                
            }else if item is Song {
                
            }
        }
    }


}
