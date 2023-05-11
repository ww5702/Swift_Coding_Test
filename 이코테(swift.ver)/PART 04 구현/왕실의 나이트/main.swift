import Foundation
func solution() {
    let input = readLine() ?? ""
    let row = Int(String(input.last!))!
    let col = Int(UnicodeScalar("\(input.first!)")!.value) - 96
    print(row, col)
    let steps = [(-2,-1),(-2,1),(-1,-2),(-1,2),(2,-1),(2,1),(1,-2),(1,2)]
    var result = 0
    for i in steps {
        let nextX = row + i.0
        let nextY = col + i.1
        check(nextX,nextY)
    }
    
    func check(_ x : Int, _ y : Int) {
        if x >= 1 && x <= 8 && y >= 1 && y <= 8 {
            return result += 1
        }
            
    }
    
    print(result)
    
}
solution()
