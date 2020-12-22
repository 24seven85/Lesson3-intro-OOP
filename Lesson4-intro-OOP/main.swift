//
//  main.swift
//  Lesson4-intro-OOP
//
//  Created by Maksim Kjaulakis on 22.12.2020.
//

import Foundation

// Классы от структур мало чем отличаются
//
//Память разделяется на несколько сегментов. Есть сегмент Стек и Куча.
//Куча более медленнее, но более обширная. Стек более быстрый, но более мелкий.
//Если создаем класс, он размещается в куче.
//В Стеке хранятся ссылки на разные наши объекты
//Ссылки - это адреса, по которым находятся в куче данные объекты.
//Короче говоря в стеке хранится ссылка на наш класс.
//Это сделано для того, чтобы экономить быструю память.
//
//Heap - куча
//
//Stack - ближе к процессору, быстрее обрабатывается, она меньше и комп пытается ее экономить.
//Структуры размещаются в стеке, и они называются - value type, к ним обращение идет напрямую.
//Классы называются reference type, к ним обращение идет по ссылке.
//Доступ к классам происходит в два этапа, сначала в стэк, для того, чтобы обратиться и достать какоето свойство из класса.
// При создании структуру, по умолчанию у нее есть свой, если мы не создаем свой
//


//Различия структур и классов
//Структуры при присваивании копируются
//Классы при присваивании передают просто указатель или ссылку на один и тот же объект и при изменении через ссылку объекта указателю присвоенный класс тоже получает теже данные.
//Структуры не могут наследоваться, а классы могут


enum Color {
    case red, green
}

struct Car {
    var color: Color
    let km: Double
}

class Car_ref {
    var color: Color
    let km: Double
    
    init(color: Color, km: Double) {
        self.color = color
        self.km = km
    }
    func printCar() {
        print(color, km)
    }
    // Есть понятие диструктор, как конструктор но наоборот
    // Но сами мы ничего разрушать не можем
    // Можем только отследить момент когда разрушается класс
    
    // есть такой метод, который можем отследить
    // каждый объект, который будет разрушаться, будет дергать этот метод
    deinit {
        print("Car_ref is deinit")
    }
}
class AdvancedCar: Car_ref {
    let doors: Int
    
    init(color: Color, km: Double, doors: Int) {
        self.doors = doors
        super.init(color: color, km: km)
    
        
    }
}

class Foo: AdvancedCar {} // Сразу от двух классов наследоваться нельзя

// Создаем объект типа структуры
var toyota = Car(color: .green, km: 120)
let toyota2 = toyota  // Клон остается все равно изначальным как был оригинал

toyota.color = .red
print(toyota)
print(toyota2)

//var honda = Car_ref(color: .green, km: 120)
var honda: Car_ref? = Car_ref(color: .green, km: 120)
let honda2 = honda  // Это не копия, а ссылка на тот же самый объект

honda?.color = .red

honda?.printCar()
honda2?.printCar()

honda = nil

let advCar = AdvancedCar(color: .red, km: 200, doors: 4)



if true {
    let f = Car_ref(color: .red, km: 300)
    f.color = .green
}

print("hbshjs")


//print(honda)
//print(honda2)
