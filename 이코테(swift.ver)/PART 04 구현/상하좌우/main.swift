import Foundation
func solution() {
    let n = Int(readLine()!)!
    let arr = Array(readLine()!.split(separator: " ").map{String($0)})
    var (x,y) = (1,1)
    for i in arr {
        switch i {
        case "L":
            if y > 1 {
                y -= 1
            }
            break
        case "R":
            if y < n {
                y += 1
            }
            break
        case "U":
            if x > 1 {
                x -= 1
            }
            break
        case "D":
            if x < n {
                x += 1
            }
            break
        default:
            break
            
        }
    }
    print("\(x) \(y)")
}
solution()
