enemy값을 오름차순으로 정렬 후   
숫자를 빼다가 남은 병사의 수가 0보다 작아진다면 이미 전에 뺏던 값들중 최대값을 더해준다   
그게 곧 최대값들중 하나를 뺀것과 동일하기 때문   
하지만 시간초과   
아마 계속해서 sorting을 해주는것이라 판단   
```
import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var k = k
    var cnt = 0
    var list: [Int] = []
    for i in 0..<enemy.count {
        list.append(enemy[i])
        list.sort(by:>)
        // 남아있는 병사의 수가 더 작고 무적권이 없다면 리턴
        if n - enemy[i] >= 0 {
            n -= enemy[i]
        } else if k > 0 {
            n = n - enemy[i] + list[0]
            list.removeFirst()
            k -= 1
        } else {
            return cnt
        }
        cnt += 1
        
    }
    
    return cnt
}
```
두번째 제출   
heap구조를 추가해주기로 결정하였다.   
```
import Foundation

struct Heap<T: Comparable> { 
    var nodes: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0 && sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func pop() -> T {
        
        nodes.swapAt(0, nodes.count-1)
        let poped = nodes.removeLast()
        var index = 0

        // 자식이 있는 인덱스만
        while index * 2 + 1 < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            // 왼쪽 오른쪽 자식 둘다 있는경우 -> 둘중 크고 부모보다 크면 스왑
            if rightChild < nodes.count {
                let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
                
                if sort(nodes[child], nodes[index]) {
                    nodes.swapAt(child, index)
                    index = child
                } else {
                    break
                }
                
            // 왼쪽 자식막 있는경우 -> 부모보다 크면 스왑
            } else { 
                if sort(nodes[leftChild], nodes[index]) {
                    nodes.swapAt(leftChild, index)
                    index = leftChild
                } else {
                    break
                }
            }
        }
        return poped
    }
}

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var n = n
    var k = k
    var cnt = 0
    var heap: Heap = Heap<Int>(sort:>)
    for i in 0..<enemy.count {
        heap.insert(enemy[i])
        // 남아있는 병사의 수가 더 작고 무적권이 없다면 리턴
        if n - enemy[i] >= 0 {
            n -= enemy[i]
        } else if k > 0 {
            n = n - enemy[i] + heap.pop()
            k -= 1
        } else {
            return cnt
        }
        cnt += 1
        
    }
    
    return cnt
}
```
