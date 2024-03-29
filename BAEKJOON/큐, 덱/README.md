# 큐와 덱을 구현하고 사용해 봅시다.

## 18258 큐 2
정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.   
명령은 총 여섯 가지이다.   
   
1. push X: 정수 X를 큐에 넣는 연산이다.
2. pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
3. size: 큐에 들어있는 정수의 개수를 출력한다.
4. empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
5. front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
6. back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
```
import Foundation
func solution() {
    struct Queue {
        var queue: [Int] = []
        var first: Int = 0
        
        public var front: Int {
            return queue[first]
        }
        
        public var backValue: Int {
            return self.queue.last!
        }
        
        public var count: Int {
            return queue.count - first
        }
        
        public var isEmpty: Bool {
            return queue.count - first == 0
        }
        
        public mutating func enqueue(_ element: Int) {
            queue.append(element)
        }
        
        public mutating func dequeue() -> Int {
            guard first <= count else {return -1}
            let element = queue[first]
            queue[first] = -1 // 맨 앞 원소를 nil로 만들기
            first += 1 // head 옮겨주기
            return element
        }
    }
    var myQueue = Queue()
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        
        switch(input[0]) {
        case "push":
            myQueue.enqueue(Int(input[1])!)
            break
        case "pop":
            print(myQueue.dequeue())
            break
        case "size":
            print(myQueue.count)
            break
        case "empty":
            if myQueue.isEmpty {
                print("1")
            } else {
                print("0")
            }
            break
        case "front":
            print(myQueue.front)
            break
        case "back":
            print(myQueue.backValue)
            break
        default:
            break
        }
    }
}
solution()
```
큐를 구현하여 풀이했지만 에러가 나왔다.   
출력하는 방법은 맞지만 받아내는 readLine을 fileIO로 받아왔어야했다.   
```
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}
```
## 2164 카드2
N장의 카드가 있다. 각각의 카드는 차례로 1부터 N까지의 번호가 붙어 있으며,   
1번 카드가 제일 위에, N번 카드가 제일 아래인 상태로 순서대로 카드가 놓여 있다.   
   
이제 다음과 같은 동작을 카드가 한 장 남을 때까지 반복하게 된다.   
우선, 제일 위에 있는 카드를 바닥에 버린다. 그 다음, 제일 위에 있는 카드를 제일 아래에 있는 카드 밑으로 옮긴다.   
   
예를 들어 N=4인 경우를 생각해 보자.   
카드는 제일 위에서부터 1234 의 순서로 놓여있다. 1을 버리면 234가 남는다. 여기서 2를 제일 아래로 옮기면 342가 된다.   
3을 버리면 42가 되고, 4를 밑으로 옮기면 24가 된다. 마지막으로 2를 버리고 나면, 남는 카드는 4가 된다.   
   
N이 주어졌을 때, 제일 마지막에 남게 되는 카드를 구하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let n = Int(readLine()!)!
    var queue = Array(1...n)
    var temp = 0
    
    if n == 1 { print(1) }
    else {
    	while true {
			queue[temp] = 0
			queue.append(queue[temp + 1])
			queue[temp+1] = 0
			if queue[queue.count - 2] == 0 {
				print(queue.last!)
				break
			}
			temp += 2
    	}
    }
}
solution()

```
큐를 사용한다고 기능을 전부 구성한다음 풀이를 할 필요는 없다.   
필요한 기능인 append기능, popFirst처럼 첫 숫자를 0으로 만드는 기능을 구현하면 문제가 풀이가 된다.   
queue = 1,2,3,4,5,6   
0,2,3,4,5,6 queue[temp] = 0   
0,2,3,4,5,6,2 queue.append(queue[temp + 1])   
0,0,3,4,5,6,2 queue[temp+1] = 0   
if queue[queue.count - 2] == 0   
만약 끝에서 두자리 앞이 0이라면 어차피 한자리는 queue[temp]로 0이 되기 때문에 last를 출력   

## 11866 요세푸스 문제0
요세푸스 문제는 다음과 같다.   
   
1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고, 양의 정수 K(≤ N)가 주어진다.   
이제 순서대로 K번째 사람을 제거한다. 한 사람이 제거되면 남은 사람들로 이루어진 원을 따라 이 과정을 계속해 나간다.   
이 과정은 N명의 사람이 모두 제거될 때까지 계속된다. 원에서 사람들이 제거되는 순서를 (N, K)-요세푸스 순열이라고 한다.   
예를 들어 (7, 3)-요세푸스 순열은 <3, 6, 2, 7, 5, 1, 4>이다.   
   
N과 K가 주어지면 (N, K)-요세푸스 순열을 구하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator:" ").map{Int($0)!}
    let (n,k) = (input[0],input[1])
    var queue = Array(1...n)
    var resQueue: [Int] = []
    var temp = k
    while !queue.isEmpty {
        if temp <= queue.count {
        	resQueue.append(queue[temp-1])
        	queue.remove(at:temp-1)
        	temp += k - 1
        } else {
        	temp -= queue.count
        }
    }
   print("<" + resQueue.map({String($0)}).joined(separator: ", ") + ">")
}
solution()
```
위 문제와 마찬가지로 조건에 맞춰서 append와 remove를 수행해준다.   

## 28279 덱2
덱은 reverse를 통해 하나의 enqueue로 구성할 수 있다.   
앞에서 넣을때는 reverse -> append -> reverse를 진행한다면 된다   
하지만 시간초과가 발생한다면   
enqueu, dequeue 함수를 두개 구성하여 풀이를 한다.   
```
import Foundation

func solution() {
    let N = Int(readLine()!)!
    var enqueue: [Int] = []
    var dequeue: [Int] = []
    for _ in 0..<N {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        switch(input[0]) {
        case 1:
            dequeue.append(input[1])
            break;
        case 2:
            enqueue.append(input[1])
            break;
        case 3:
            if dequeue.isEmpty {
                if enqueue.isEmpty {
                    print(-1)
                } else {
                    dequeue = enqueue.reversed()
                    enqueue.removeAll()
                    print(dequeue.popLast()!)
                }
            } else {
                print(dequeue.popLast()!)
            }
            
            break;
        case 4:
            if enqueue.isEmpty {
                if dequeue.isEmpty {
                    print(-1)
                } else {
                    enqueue = dequeue.reversed()
                    dequeue.removeAll()
                    print(enqueue.popLast()!)
                }
            } else {
                print(enqueue.popLast()!)
            }
            
            break;
        case 5:
            print(dequeue.count+enqueue.count)
            break;
        case 6:
            (dequeue.isEmpty&&enqueue.isEmpty) ? print(1) : print(0)
            break;
        case 7:
            if dequeue.isEmpty && enqueue.isEmpty {
                print(-1)
            } else {
                if dequeue.isEmpty {
                    print(enqueue.first!)
                } else {
                    print(dequeue.last!)
                }
            }
            break;
        case 8:
            if dequeue.isEmpty && enqueue.isEmpty {
                print(-1)
            } else {
                if enqueue.isEmpty {
                    print(dequeue.first!)
                } else {
                    print(enqueue.last!)
                }
            }
            break;
        default:
            break;
        }
//        print(enqueue)
//        print(dequeue)
    }
}
solution()


```

## 2346 풍선 터뜨리기
enumerated를 통해 Index를 고정시켜준뒤   
터뜨린 풍선의 값에 따라 0이하면 남은 풍선수만큼 +   
남은 풍선수를 넘어간다면 %= balloon.count를 통해 값을 조정해준다.   

```
import Foundation

func solution() {
    let N = Int(readLine()!)!
    var balloon = readLine()!.split(separator: " ").enumerated().map{($0,Int($1)!)}
    var index = 0
    var answer: [String] = []
    while true {
        var temp = balloon[index].1
        answer.append("\(balloon[index].0+1)")
        // 현재 풍선 터짐 0이 터졌다면 다음도 0이라 가만히있는다
        if temp > 0 { temp -= 1 }
        balloon.remove(at: index)
        index += temp
        if balloon.count == 0 { break }
        if index < 0 {
            index = balloon.count + index % balloon.count
        }
        index %= balloon.count
//        print(balloon)
//        print(answer)
    }
    print(answer.joined(separator:" "))
}
solution()


```

## 24511 queuestack
stack은 숫자를 밀어내주는 역할밖에 해주지않아 이중반복문을 사용해봤지만 시간초과   

```
import Foundation

func solution() {
    // 사실상 스택이면 하는일이 없다.
    var N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map{Int($0)!}
    var B = readLine()!.split(separator: " ").map{Int($0)!}
    var M = Int(readLine()!)!
    var C = readLine()!.split(separator: " ").map{Int($0)!}
    var answer: [Int] = []
    for i in 0..<M {
        var cur = C[i]
        for j in 0..<N {
            if A[j] == 0 {
                swap(&cur, &B[j])
            }
        }
        answer.append(cur)
        
    }
    print(answer.map{String($0)}.joined(separator: " "))
}
solution()
```
제일 먼저 queue라서 밀려난 값들을 뒤에서부터 넣는다   
만약 부족했다면 넣으려고 헀던 C의 값을 앞에서부터 넣는다.   
```
import Foundation

func solution() {
    // 사실상 스택이면 하는일이 없다.
    var N = Int(readLine()!)!
    var A = readLine()!.split(separator: " ").map{Int($0)!}
    var B = readLine()!.split(separator: " ").map{Int($0)!}
    var M = Int(readLine()!)!
    var C = readLine()!.split(separator: " ").map{Int($0)!}
    var qStack: [Int] = []
    var answer: [Int] = []
    for i in 0..<N {
        if A[i] == 0 {
            qStack.append(B[i])
        }
    }
    
    if M >= qStack.count {
        for i in stride(from: qStack.count-1, through: 0, by: -1) {
            answer.append(qStack[i])
        }
        for i in 0..<(M-answer.count) {
            answer.append(C[i])
        }
    } else {
        for i in stride(from: qStack.count-1, through: qStack.count-M, by: -1) {
            answer.append(qStack[i])
        }
    }
    print(answer.map{String($0)}.joined(separator: " "))
}
solution()
```

## 1966 프린터 큐
여러분도 알다시피 여러분의 프린터 기기는 여러분이 인쇄하고자 하는 문서를 인쇄 명령을 받은 ‘순서대로’, 즉 먼저 요청된 것을 먼저 인쇄한다.   
여러 개의 문서가 쌓인다면 Queue 자료구조에 쌓여서 FIFO - First In First Out - 에 따라 인쇄가 되게 된다.   
하지만 상근이는 새로운 프린터기 내부 소프트웨어를 개발하였는데, 이 프린터기는 다음과 같은 조건에 따라 인쇄를 하게 된다.   
   
1. 현재 Queue의 가장 앞에 있는 문서의 ‘중요도’를 확인한다.   
2. 나머지 문서들 중 현재 문서보다 중요도가 높은 문서가 하나라도 있다면, 이 문서를 인쇄하지 않고 Queue의 가장 뒤에 재배치 한다.    그렇지 않다면 바로 인쇄를 한다.   
예를 들어 Queue에 4개의 문서(A B C D)가 있고, 중요도가 2 1 4 3 라면 C를 인쇄하고,   
다음으로 D를 인쇄하고 A, B를 인쇄하게 된다.   
   
여러분이 할 일은, 현재 Queue에 있는 문서의 수와 중요도가 주어졌을 때, 어떤 한 문서가 몇 번째로 인쇄되는지 알아내는 것이다.   
예를 들어 위의 예에서 C문서는 1번째로, A문서는 3번째로 인쇄되게 된다.   
```
import Foundation
func solution() {
    let k = Int(readLine()!)!
    for _ in 0..<k {
        let input = readLine()!.split(separator:" ").map{Int($0)!}
        let (n,m) = (input[0],input[1])
        var count = 0
        var value = readLine()!.split(separator: " ").map{Int($0)!}
        var priorityList: [(Int,Int)] = []
        for (index,priority) in value.enumerated() {
            let tuple = (index,priority)
            priorityList.append(tuple)
        }
        
        value.sort()
        
        while true {
            if priorityList[0].1 == value.max() {
                count += 1
                if priorityList[0].0 == m {
                    print(count)
                    break
                } else {
                    priorityList.removeFirst()
                    value.popLast()
                }
            } else {
                priorityList.append(priorityList.removeFirst())
            }
        }
    }
}
solution()
```
enumerated를 이용해 index와 중요도를 묶어준다.   
만약 중요도가 제일 높은(value.max)와 같다면 바로 출력될테니 count += 1를 해준다.   
근데 만약 출력된 값이 찾고싶은 값(m)이 맞다면 그대로 출력해준다.   
하지만 같지 않은 경우가 대다수일테니 else문을 구성해준다.   
같이 않다면 enumberated값의 removeFirst를 실행해주고, 가장 중요도가 높은 값을 제거해준다.   
가장 중요한 중요도를 먼저 제거해주기 위해 sort()를 먼저 해주는것이다.   
   
만약 첫번째 값이 중요도가 제일 높은 값이 아니라면 배열의 맨 뒤로 보내야하기 때문에   
removeFirst해줌과 동시에 해당값을 append해준다.   

## 10866 덱
정수를 저장하는 덱(Deque)를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.   
명령은 총 여덟 가지이다.   
   
1. push_front X: 정수 X를 덱의 앞에 넣는다.   
2. push_back X: 정수 X를 덱의 뒤에 넣는다.   
3. pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
4. pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
5. size: 덱에 들어있는 정수의 개수를 출력한다.   
6. empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.   
7. front: 덱의 가장 앞에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
8. back: 덱의 가장 뒤에 있는 정수를 출력한다. 만약 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.   
```
import Foundation
func solution() {
    var dequeue: [Int] = []
    let n = Int(readLine()!)!
    
    func push_front(_ element : Int) {
        if dequeue.isEmpty {
            dequeue.append(element)
        } else {
            dequeue.reverse()
            dequeue.append(element)
            dequeue.reverse()
        }
    }
    func push_back(_ element : Int) {
        dequeue.append(element)
    }
    func pop_front() -> Int {
        if dequeue.isEmpty {
            return -1
        } else {
            return dequeue.removeFirst()
        }
    }
    func pop_back() -> Int {
        if dequeue.isEmpty {
            return -1
        } else {
            return dequeue.removeLast()
        }
    }
    func size() -> Int {
        return dequeue.count
    }
    func empty() -> Int {
        if dequeue.isEmpty { return 1 }
        else {return 0}
    }
    func front() -> Int {
        if dequeue.isEmpty { return -1 }
        else { return dequeue.first!}
    }
    func back() -> Int {
        if dequeue.isEmpty { return -1 }
        else { return dequeue.last!}
    }
    
    
    for _ in 1...n {
        let input = readLine()!.split(separator: " ")
        switch String(input[0]) {
        case "push_front":
            push_front(Int(input[1])!)
        case "push_back":
            push_back(Int(input[1])!)
        case "pop_front":
            print(pop_front())
        case "pop_back":
            print(pop_back())
        case "size":
            print(size())
        case "empty":
            print(empty())
        case "front":
            print(front())
        case "back":
            print(back())
        default:
            break
        }
    }
    
}
solution()

```
덱의 기능을 구현하여 반복문으로 처리한다.   
함수 이름 주의해서 출력하자;   

## 1021 회전하는 큐
지민이는 N개의 원소를 포함하고 있는 양방향 순환 큐를 가지고 있다. 지민이는 이 큐에서 몇 개의 원소를 뽑아내려고 한다.   
지민이는 이 큐에서 다음과 같은 3가지 연산을 수행할 수 있다.   
   
첫 번째 원소를 뽑아낸다. 이 연산을 수행하면, 원래 큐의 원소가 a1, ..., ak이었던 것이 a2, ..., ak와 같이 된다.   
왼쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 a2, ..., ak, a1이 된다.   
오른쪽으로 한 칸 이동시킨다. 이 연산을 수행하면, a1, ..., ak가 ak, a1, ..., ak-1이 된다.   
큐에 처음에 포함되어 있던 수 N이 주어진다.   
그리고 지민이가 뽑아내려고 하는 원소의 위치가 주어진다. (이 위치는 가장 처음 큐에서의 위치이다.)    
이때, 그 원소를 주어진 순서대로 뽑아내는데 드는 2번, 3번 연산의 최솟값을 출력하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var count = 0
    let res = readLine()!.split(separator: " ").map{Int($0)!}
    
    var queue = Array(1...n)
    func select(){
        queue.removeFirst()
    }
    func moveleft() {
        queue.append(queue.first!)
        queue.removeFirst()
        count += 1
    }
    func moveright() {
        let last = queue.last
        queue.removeLast()
        queue.reverse()
        queue.append(last!)
        queue.reverse()
        count += 1
    }
    
    for i in 0..<m {
        while true {
            if queue[0] == res[i] {
                select()
                print(queue)
                break
            } else if res[i] <= queue.count/2 {
                moveleft()
                print(queue)
            } else {
                moveright()
                print(queue)
            }
        }
    }
    print(count)
    
}
solution()

```
middle 값을 잘 조절하면 답이 구해질것같다.   
```
import Foundation
func solution() {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (input[0],input[1])
    var count = 0
    var res = readLine()!.split(separator: " ").map{Int($0)!}
    var arr = Array(1...n)
    
    func rotate(_ direction: Int) {
        if direction == -1 {
            // moveleft
            let temp = arr.removeFirst()
            arr.append(temp)
        } else {
            // moveright
            let temp = arr.removeLast()
            arr.insert(temp,at: 0)
        }
    }
    
    func find() {
        let target = res[0]
        let targetIdx = arr.firstIndex(of: target)!
        //rint("targetIdx = \(targetIdx), arr = \(arr[0])")
        if target == arr[0] {
            res.removeFirst()
            arr.removeFirst()
        } else if targetIdx > arr.count/2 {
            rotate(1)
            count += 1
        } else {
            rotate(-1)
            count += 1
        }
    }
    
    while(!res.isEmpty) {
        find()
    }
    print(count)
    
}
solution()
```
비슷한 풀이 방식이다.   
targetidx 즉 target의 위치를 지정한 후 절반으로 나눴을때 절반보다 뒤쪽이면 moveright, 절반보다 앞쪽이면 moveleft   

## 5430 AC
선영이는 주말에 할 일이 없어서 새로운 언어 AC를 만들었다.   
AC는 정수 배열에 연산을 하기 위해 만든 언어이다. 이 언어에는 두 가지 함수 R(뒤집기)과 D(버리기)가 있다.   
   
함수 R은 배열에 있는 수의 순서를 뒤집는 함수이고, D는 첫 번째 수를 버리는 함수이다.   
배열이 비어있는데 D를 사용한 경우에는 에러가 발생한다.   
   
함수는 조합해서 한 번에 사용할 수 있다. 예를 들어, "AB"는 A를 수행한 다음에 바로 이어서 B를 수행하는 함수이다.   
예를 들어, "RDD"는 배열을 뒤집은 다음 처음 두 수를 버리는 함수이다.   
   
배열의 초기값과 수행할 함수가 주어졌을 때, 최종 결과를 구하는 프로그램을 작성하시오.   
```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let p = Array(readLine()!)
        let n = Int(readLine()!)!
        var arr = readLine()!.dropFirst().split(separator:",").map{Int(String($0))!}
        for j in p{
            if j == "R" {
                arr.reverse()
            } else {
                if arr.isEmpty {
                    print("error")
                    break
                } else {
                    arr.removeFirst()
                }
            }
        }
        print(arr)
    }
    
}
solution()
```
당연하지만 reverse, removeFirst등의 연산을 적용하면 시간이 초과된다.   
R을 reverse로 수행하는것이 아닌 상황에따라 bool을 통해 fasle true로 관리하고,   
D를 deque와 같은 의미로 head와 tail변수를 통해 상황에 따라 ++, -- 를 적용시켜주고,   
마지막으로 출력할때 arr[head...tail]을 해준다.   
```
import Foundation
func solution() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        let p = Array(readLine()!)
        let n = Int(readLine()!)!
        let arr = readLine()!.dropFirst().dropLast().split(separator:",").map{Int(String($0))!}
        var head = 0, tail = n-1
        var isReversed = false
        var isError = false
        
        for j in p{
            if j == "R" {
                isReversed.toggle()
            } else {
                if head > tail {
                    isError = true
                    break
                }
                if isReversed {
                    tail -= 1
                } else {
                    head += 1
                }
            }
        }
        
        if isError {
            print("error")
        } else if head > tail {
            print("[]")
        } else {
            let ans = arr[head...tail].map{String($0)}.joined(separator: ",")
            let reverseAns = arr[head...tail].reversed().map{String($0)}.joined(separator: ",")
            if isReversed {
                print("[\(reverseAns)]")
            } else {
                print("[\(ans)]")
            }
        }
    }
    
}
solution()
```
toggle()을 사용하면 isBool 변수를 true면 false로, false면 true로 바꿔준다.   
