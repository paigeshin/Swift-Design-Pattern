// Example 1
struct SimpleCountDown: Sequence, IteratorProtocol {
    var value: Int
    mutating func next() -> Int? {
      if value < 0 { return nil }
      value -= 1
      return value + 1
    }
}
for i in SimpleCountDown(value: 5) { print(i) }
// 5, 4, 3, 2, 1, 0 각 라인에 출력


// Example 2
struct Repeater<T>: Sequence, IteratorProtocol {
   let value: T
   mutating func next() -> T? { return value }
}
///: **주의!!!** Repeater를 그냥 for in 문에 넣으면 무한 루프가 된다.
for i in Repeater(value: 3).prefix(10) { print(3) }
