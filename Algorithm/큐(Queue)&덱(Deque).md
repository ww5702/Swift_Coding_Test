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

## 큐의 종류
1. 선형 큐 : 막대 모양인 큐로 가장 기본적인 큐를 의미한다.   
- 마지막에 원소를 추가하고 맨 앞 원소를 뺀다.   
- 기본큐는 front를 감소시키는 방법이 없기 때문에 공간이 꽉차면 더이상 요소를 추가할 수 없다.   
- 심지어 dequeue로 데이터가 빠져서 앞 공간이 비어도 데이터를 추가할 방법이 없다.

2. 원형 큐 : 위의 문제점을 보완하기 위해 탄생한 큐이다.   
- front와 back가 같아지면 큐의 맨 앞으로 데이터를 넣어 원형으로 연결하는 큐이다.   
- 맨 끝까지 데이터가 차고 맨 앞에 공간이 있다면 맨 앞에 데이터를 넣겠다는 의미.   

3. 우선순위 큐 : Enqueue는 일반 큐로 동일하지만 Dequeue가 다르다.   
- 일반적인 큐는 먼저 집어 넣는 데이터가 먼저 나오는 구조이지만 우선순위 큐는 우선순위에 따라 나오는 순서가 결정된다.   

4. 덱 : 입구와 출구가 따로 존재하는 큐와 달리 양쪽에서 모두 삽입, 삭제가 가능한 구조이다.   
- 스택과 큐의 특성을 모두 갖고 있다.   
   
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
배열을 이용해 구현하였고 append()나 removeFirst()를 통해 구현할 수 있었다.   
하지만 removeFirst를 이용하고 나면 앞으로 당기는 작업이 필요하기에 시간복잡도가 O(n)으로 높다.   
따라서 개선하는 방안을 떠올렸다.   
```
struct Queue<T> {
    private var queue: [T?] = []
    private var front: Int = 0
    
    public var frontValue: Int {
        return self.front
    }
    
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
        guard front <= count, let element = queue[front] else { return nil }
        queue[front] = nil
        front += 1
        return element
    }
}
```
전과 같지만 front를 추가하고 dequeue를 개선하였다.   
removeFirst 대신 nil로 초기화하여 데이터를 삭제해도 공간은 남아있어 index만 증가하는 구조이다.   
따라서 앞으로 당기는 작업이 필요없고 시간복잡도가 O(1)이 된다.   
실행 방법은 다음과 같다.   
```
var myQueue = Queue<Int>()
myQueue.enqueue(10)
myQueue.dequeue()
```

# 덱(Deque)
큐의 변종으로 비슷한 개념이다.   
영어로 Double - ended queue로 쉽게 말해 양방향으로 삽입과 삭제가 가능한 큐이다.   
큐는 일반적으로 한 방향으로 삽입하고 다른 방향으로 삭제가 진행되지만,   
덱은 양방향으로 가능하다는 뜻이다.   
