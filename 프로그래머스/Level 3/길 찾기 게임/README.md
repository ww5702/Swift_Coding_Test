class Tree를 이용해 해당 좌표에 따른 값과 왼쪽자식, 오른쪽자식, 부모자식을 넣는다.   
먼저 x,y,key값을 넣어주고,   
다시 y좌표를 기준으로 내림차순정렬을 해준다.   
1번 값이 루트노드이다.   
이제 y값은 동일한 상태에서 addChild를 실행해준다.   
해당 x좌표가 루트노드의 x좌표보다 작다면 좌측, 크다면 우측이다.   
좌측이고 왼쪽자식노드가 없다면 그대로 넣어줌과 동시에 해당 값의 부모노드를 정해준다.   
하지만 이미 좌측이고 왼쪽자식노드가 있다면 해당 왼쪽자식노드의 addchild를 해준다.   
다시 또 해당 왼쪽자식노드의 x좌표를 기준으로 왼쪽 오른쪽을 판별하여 왼쪽 오른쪽 자식노드를 정해준다.   


종료 후 전위순회, 후위순회를 진행해준다.   
전위순회는 단순히 부모노드, 왼쪽, 오른쪽 자식노드를 방문해주는 순회이므로   
먼저 부모노드 append   
그리고 부모노드의 왼쪽자식노드부터 방문, 그리고 재귀함수 실행   
재귀함수가 실행되면 해당 값 추가 그리고 다시 왼쪽노드 방문   
이런 형식으로 반복문이 실행된다.   
왼쪽을 전부 방문했다면 오른쪽을 방문해준다.   
```
import Foundation
class Tree {
    var value: Int
    var x: Int
    var y: Int
    var leftChild: Tree?
    var rightChild: Tree?
    var parent: Tree?
    var description: String {
        "x: \(x) / y: \(y)"
    }
    
    init(x: Int, y: Int, value: Int) {
        self.x = x
        self.y = y
        self.value = value
    }
    
    func addChild(_ node: Tree) {
        if node.x < self.x {
            //print("왼쪽")
            if leftChild != nil {
                //print("왼쪽자식이 있다. 다시 왼쪽노드로")
                leftChild?.addChild(node)
            } else {
                //print("왼쪽자식이 없다.")
                leftChild = Tree(x: node.x, y: node.y, value: node.value)
                //print("왼쪽자식 추가 ",leftChild?.value)
                leftChild?.parent = self
                //print("그리고 내 부모노드 추가 ",leftChild?.parent!.value)
            }
        } else {
            //print("오른쪽")
            if rightChild != nil {
                //print("오른쪽자식이 있다. 다시 오른쪽 노드로")
                rightChild?.addChild(node)
            } else {
                //print("오른쪽자식이 없다.")
                rightChild = Tree(x: node.x, y: node.y, value: node.value)
                //print("오른쪽자식 추가 ",rightChild?.value)
                rightChild?.parent = self
                //print("그리고 내 부모노드 추가 ",rightChild?.parent!.value)
            }
        }
    }
    
}
func pre(_ tree: Tree) -> [Int]{
    var result: [Int] = []
    
    result.append(tree.value)
    if let leftChild = tree.leftChild {
        let leftValue = pre(leftChild)
        result.append(contentsOf: leftValue)
    }
    if let rightChild = tree.rightChild {
        let rightValue = pre(rightChild)
        result.append(contentsOf: rightValue)
    }
    
    return result
}

func post(_ tree: Tree) -> [Int] {
    var result: [Int] = []
    
    if let leftChild = tree.leftChild {
        let leftValue = post(leftChild)
        result.append(contentsOf: leftValue)
    }
    
    if let rightChild = tree.rightChild {
        let rightValue = post(rightChild)
        result.append(contentsOf: rightValue)
    }
    result.append(tree.value)
    
    return result
    
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodes: [Tree] = []
    for node in nodeinfo {
        let treeNode = Tree(x: node[0], y: node[1], value: nodes.count+1)
        nodes.append(treeNode)
    }
    // 루트노드
    nodes.sort{$0.y > $1.y}
    let tree: Tree = nodes.first!
    for i in 1..<nodes.count {
        let node = nodes[i]
        //print(node.y, node.x, node.value)
        tree.addChild(node)
    }
    // print(tree)
    // print(tree.description)
    // print(tree.leftChild!.description, tree.rightChild!.description)
    // 전위 순회
    //print(tree.value)
    let preOrder: [Int] = pre(tree)
    //print(preOrder)
    let postOrder: [Int] = post(tree)
    //print(postOrder)
    // 후외 순회
    
    
    
    return [preOrder, postOrder]
}
```
