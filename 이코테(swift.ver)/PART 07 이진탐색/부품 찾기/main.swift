import Foundation
func solution() {
    let n = Int(readLine()!)!
    var store_arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    
    var arr = Array(repeating: 0, count: 1000001)
    for i in store_arr {
        arr[i-1] = 1
    }
    
    let m = Int(readLine()!)!
    let user_arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    
    for i in user_arr {
        if arr[i-1] == 1 {
            print("yes", terminator: " ")
        } else {
            print("no", terminator: " ")
        }
    }
    
}
solution()
