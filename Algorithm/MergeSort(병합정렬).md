```
func mergeSort(_ arr: [Int]) -> [Int] {
	if arr.count <= 1 { return arr }
	let middle = arr.count/2
	let start = Array(arr[0..<middle])
	let end = Array(arr[middle..<arr.count])
	
	func merge(_ start : [Int], _ end : [Int]) -> [Int] {
		var start = start
		var end = end
		var result : [Int] = []
		
		// 둘다 비어있거나 둘다 차있을때까지
		while !start.isEmpty && !end.isEmpty {
			if start[0] < end[0] {
				result.append(start.removeFirst())
			} else {
				result.append(end.removeFirst())
			}
		}
		
		// start배열이 비어있지 않다면
		if !start.isEmpty {
			result.append(contentsOf:start)
		}
		if !end.isEmpty {
			result.append(contentsOf:end)
		}
		return result
		
		start = start
		while start <= end {
			arr[start] = result[j]
			count += 1
			if count == k {
				answer = result[j]
				break
			}
			start += 1
			end += 1
			
		}
	}
	
	
	return merge(mergeSort(start), mergeSort(end))
}
```
