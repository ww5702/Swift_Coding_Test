```
import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    /*
    루트 노드를 제외하고 왼쪽에서부터 수를 센다
    하지만 하나라도 이어져있어야 자식노드를 연결할수있으므로
    예를들어 깊이가 2라면
    10, 01이 가능
    깊이가 3이라면
    
    0111111 1 2 4 8 16 32 = 63
    011 1 010 2 8 16 32 = 58
    
    즉 개수는
    1 3 7 15 31개 이렇게 늘어난다
    포화이진트리이기 때문에
    128이라면 불가능하다 -> 2진수는 10000000이고 이 개수는 8개로 
    포화이진트리가 불가능하기 때문에
    하지만 앞에 0을 붙여서 포화이진트리의 개수에 맞춘다면 가능하다
    10000000 이나 000000010000000은 모두 10진수로 128을 의미한다.
    
    그렇다면 노드를 몇개를 추가해야할까?
    포호이진트리는 높이별로 모든 노드가 꽉차있어야한다
    제일 루트노드는 1개이기에
    2^(높이) -1 이 노드의 크기가 된다.
    
    이제 이렇게 포화이진트리를 만들었다면 검증을 해야한다
    각 노드들의 부모노드는 있어야 연결이 가능하니
    중간값들은 1이 되어야 말이 된다
    7개이라면
    ??? 1 ???
    왼쪽과 오른쪽으로 서브트리를 나눠 검증을 한다
    그리고 또다시 ? 1 ? / ? 1 ? 로 나눠 검증을 한다
    유효한 조건은 이와 같다
    1. 트리의 노드 개수가 2 이하라면 true (더 쪼갤 수 없기때문)
    2. 트리의 루트가 1이면 true
    3. 트리의 루트가 0일때 서브트리가 0이면 true
    3번이 가장 의아한데 이유는 트리의 루트가 0이더라도 루트의 자식들도 전부 0이라면 괜찮습니다.
    */
    // 앞에 0 넣어주기
    func makeFullBinaryTree(_ number: String) -> String {
        var level: Double = 0
        var nodeCnt = 1
        while nodeCnt < number.count {
            level += 1
            nodeCnt += Int(pow(2,level))
        }
        let diff = nodeCnt - number.count
        
        return String(repeating:"0",count: diff)+number
    }
    
    func subTreeZero(_ subTree: String) -> Bool {
        for num in subTree {
            if num == "1" {
                return false
            }
        }
        
        return true
    }
    
    func checkIsOk(_ num: String) -> Bool {
        // 1번 조건                                 
        if num.count <= 2 { return true }
        
        // 가운데 인덱스
        let middleIndex = num.index(num.startIndex, offsetBy: num.count / 2)
        // 가운데를 기준으로 왼쪽과 오른쪽 서브트리
        let leftSubtree = String(num[num.startIndex..<middleIndex])
        let rightStartIndex = num.index(after:middleIndex)
        let rightSubtree = String(num[rightStartIndex..<num.endIndex])
        // 루트 노드가 0이라면 서브트리가 전부 0이여야 true
        if num[middleIndex] == "0" {
            return subTreeZero(leftSubtree) && subTreeZero(rightSubtree)
        }
        return checkIsOk(leftSubtree) && checkIsOk(rightSubtree)
    }
    
    var result: [Int] = []
    for num in numbers {
        var bT = makeFullBinaryTree(String(num,radix:2))
        checkIsOk(bT) ? result.append(1) : result.append(0)
    }
    
    return result
}
```
