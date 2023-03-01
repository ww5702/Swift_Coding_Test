스위프트에는 Queue나 Deque를 따로 라이브러리로 지원하지 않는다.   
따라서 배열로 직접 구현을 해야한다.   
***
# 큐(Queue)
큐(Queue)는 First In First Out으로 일렬로 이루어진 줄일 때, 먼저 줄을 선 사람이 먼저 나오는 구조이다.   
스택은 반대로 나중에 선 사람이 가장 먼저 빠지는 Last In First Out구조이다.   

## 큐의 동작
1. Enqueue : 큐의 맨 뒤에 원소를 추가한다.   
2. Dequeue : 큐의 맨 앞 원소를 삭제한다.
3. Peek : 맨 앞에 위치한 데이터를 읽는다.   

## 큐의 변수
1. front : 큐 맨 앞의 index   
2. back(rear) : 큐 맨 뒤의 index   


## 구현
```
struct Queue<T> {
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
```
이런식으로 구현하고, 실제 사용은 다음과 같다.
```
var myQueue = Queue<Int>()
myQueue.enqueue(10)
myQueue.dequeue()
```
