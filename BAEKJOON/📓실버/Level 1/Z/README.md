```
import Foundation
func solution(){
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    var (n,y,x) = (input[0],input[1],input[2])
    var result = 0
    func cal(_ n: Int) {
        if n == 1 { return }
        var middle = Int(pow(2.0, Double(n)))/2
        //print(middle)
        if (0..<middle).contains(y) && (0..<middle).contains(x) {
            
        } else if (0..<middle).contains(y) && (middle..<middle*2).contains(x) {
            result += (middle*middle)
            x -= middle
        } else if (middle..<middle*2).contains(y) && (0..<middle).contains(x) {
            result += ((middle*middle)*2)
            y -= middle
        } else if (middle..<middle*2).contains(y) && (middle..<middle*2).contains(x) {
            result += ((middle*middle)*3)
            x -= middle
            y -= middle
        }
        
        //print(y,x,result)
        cal(n-1)
    }
    cal(n)
    if y == 0 && x == 1 {
        result += 1
    } else if y == 1 && x == 0 {
        result += 2
    } else if y == 1 && x == 1 {
        result += 3
    }
    print(result)
}
solution()

```
