import Foundation
func solution() {
    let n = Int(readLine()!)!
    var store_arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    let m = Int(readLine()!)!
    let user_arr = Array(readLine()!.split(separator: " ").map{Int($0)!})
    store_arr.sort(by: <)
    func binary_search(_ arr: [Int], _ target: Int, _ start: Int, _ end : Int) -> Int? {
        if start > end { return nil }
        var mid = (start + end) / 2
        
        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            return binary_search(arr, target, mid + 1, end)
        } else {
            return binary_search(arr, target, start, mid - 1)
        }
    }
    
    for i in user_arr {
        let result = binary_search(store_arr, i, 0, n-1)
        if result == nil {
            print("no", terminator: " ")
        } else {
            print("yes", terminator: " ")
        }
    }
    
}
solution()
