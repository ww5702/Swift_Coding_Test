import Foundation
func solution() {
    func find_parent(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = find_parent(parent[x])
        return parent[x]
    }
    func union_parent(_ a: Int, _ b : Int) {
        let a = find_parent(a)
        let b = find_parent(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
    }
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0],nm[1])
    var parent = Array(repeating: 0, count: n+1)
    var edges: [(Int,Int,Int)] = []
    for i in 0..<n+1 {
        parent[i] = i
    }
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b,c) = (abc[0],abc[1],abc[2])
        edges.append((a,b,c))
    }
    edges.sort(by: {$0.2 < $1.2})
    var result = 0
    var last = 0
    for i in edges {
        if find_parent(i.0) != find_parent(i.1) {
            union_parent(i.0, i.1)
            result += i.2
            last = i.2
        }
    }
    print(result - last)
}
solution()
