트리의 형식으로 풀이하는 문제이다.   
frodo frozen frost 라면 fro로 시작하는 단어는 3개인 셈이다.   

```
import Foundation
class Node {
    // 노드의 키
    var key: String
    // 경로 개수 front, frozen front 라면 f,r의 count는 3이 된다.
    var cnt = 0
    // 하위 노드
    var children: [String:Node] = [:]
    
    init(_ key: String) {
        self.key = key
    }
}
class Tree {
    var root: Node
    init() {
        self.root = Node("")
    }
    func insert(_ word: String) {
        var cur = self.root
        for char in word {
            let str = String(char)
            cur.cnt += 1
            if cur.children[str] == nil {
                cur.children[str] = Node(str)
            }
            cur = cur.children[str]!
        }
    }
    func search(_ query: String) -> Int {
        var cur = self.root
        for char in query {
            let str = String(char)
            if str == "?" {
                return cur.cnt
            }
            if cur.children[str] == nil {
                return 0
            }
            cur = cur.children[str]!
        }
        return cur.cnt
    }
    
    
}
func solution(){
    var words = readLine()!.split(separator: " ").map{String($0)}
    var queries = readLine()!.split(separator: " ").map{String($0)}
    var result : [Int] = []
    var trees: [Int:Tree] = [:]
    var reversedTrees: [Int: Tree] = [:]
    print(words, queries)
    
    for word in words {
        if trees[word.count] == nil {
            trees[word.count] = Tree()
            reversedTrees[word.count] = Tree()
        }
        trees[word.count]?.insert(word)
        reversedTrees[word.count]?.insert(String(word.reversed()))
    }
    
    for query in queries {
        var cnt = 0
        print(query)
        if query.hasPrefix("?") {
            if let reversedTree = reversedTrees[query.count] {
                let reversedQuery = String(query.reversed())
                print(reversedQuery)
                cnt = reversedTree.search(reversedQuery)
                print(cnt)
            }
        } else {
            if let tree = trees[query.count] {
                cnt = tree.search(query)
            }
        }
        result.append(cnt)
    }
    print(result)
}
solution()
                     

/*
 frodo front frost frozen frame kakao
 fro?? ???o fr??? fro??? pro?
 */


```
