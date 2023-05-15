import Foundation
public struct Queue<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func enquque(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
func solution() {
    
    let graph = [
    [],         //0
    [2,3,8],    //1
    [1,7],      //2
    [1,4,5],    //3
    [3,5],      //4
    [3,4],      //5
    [7],        //6
    [2,6,8],    //7
    [1,7]       //8
    ]
    var visited = Array.init(repeating: false, count: graph.count)
    var queue = Queue<Int>()
    func bfs(start: Int) {
        queue.enquque(start) // 시작점 큐에 넣기
        visited[start] = true // 시작지점
        
        // 큐가 빌때까지
        while !queue.isEmpty {
            guard let element = queue.dequeue() else { return } // 노드 빼기
            print(element, terminator: " ") // 뺸 노드 출력
            
            // 뺀 노드의 인접 노드들 enqueue, 그리고 안간 인전 노드 방문처리
            for i in graph[element] {
                if !visited[i] {
                    queue.enquque(i)
                    visited[i] = true
                }
            }
        }
        
    }
    
    bfs(start: 1)
}
solution()
