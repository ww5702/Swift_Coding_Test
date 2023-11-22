swift에는 pq가 없기에 직접 구현해야 한다.   

```
struct PQ<T> {
    var nodes = [T]()
    var isEmpty: Bool {
        nodes.isEmpty
    }
    var sort: (T, T) -> Bool
    
    mutating func insert(_ ele: T) {
        nodes.append(ele)
        
        swapUp(nodes.count - 1)
    }
    
    mutating private func swap(_ index1: Int, _ index2: Int) {
        guard index1 < nodes.count, index2 < nodes.count else { return }
        
        let temp = nodes[index1]
        nodes[index1] = nodes[index2]
        nodes[index2] = temp
    }
    
    mutating private func swapUp(_ index: Int) {
        guard index < nodes.count else { return }
        var index = index
        
        while index != 0 {
            let parent = index / 2
            
            if sort(nodes[index], nodes[parent]) {
                swap(parent, index)
                index = parent
            } else {
                return
            }
        }
    }
    
    mutating func pop() -> T? {
        swap(0, nodes.count - 1)
        
        defer {
            nodes.removeLast()
            swapDown(0)
        }
        
        return nodes.last
    }
    
    mutating func swapDown(_ index: Int) {
        var index = index
        
        while true {
            let right = (index + 1) * 2
            let left = right - 1
            var target = index
            if left < nodes.count && sort(nodes[left], nodes[target]) {
                target = left
            }
            
            if right < nodes.count && sort(nodes[right], nodes[target]) {
                target = right
            }
            
            if target == index {
                return
            } else {
                swap(target, index)
                index = target
            }
        }
    }
}
```
선언   
```
var pq = PQ<(Int,Int)>(sort: {$0.0 < $1.0})
```
