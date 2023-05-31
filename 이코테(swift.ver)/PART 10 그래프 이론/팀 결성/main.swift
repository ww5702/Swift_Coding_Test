import Foundation
func solution() {
    func find_parent(_ x: Int) -> Int{
        if parent[x] == x { return x }
        parent[x] = find_parent(parent[x])
        return parent[x]
    }
    func union_parent(_ a : Int, _ b : Int) {
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
    for i in 0..<n+1 {
        parent[i] = i
    }
    for _ in 0..<m {
        let tab = readLine()!.split(separator: " ").map{Int($0)!}
        let (t,a,b) = (tab[0], tab[1], tab[2])
        if t == 0 {
            union_parent(a, b)
        } else if t == 1 {
            if find_parent(a) == find_parent(b) {
                print("YES")
            } else { print("NO") }
        }
    }
}
solution()
