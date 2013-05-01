# encoding: utf-8

array
	a = [1,2,3,4,5]
	a[-1] => last element
	a[1,3] => start at index 1, include next 3
	a[1..3] => element 1 up to 3
	a[1...3] => element 1 && 3

	a = [ 1, 3, 5, 7, 9 ] -> [1, 3, 5, 7, 9]
	a[2, 2] = ’cat’ -> [1, 3, "cat", 9]
	a[2, 0] = ’dog’ -> [1, 3, "dog", "cat", 9]
	a[1, 1] = [ 9, 8, 7 ] -> [1, 9, 8, 7, "dog", "cat", 9]
	a[0..3] = [] -> ["dog", "cat", 9]
	a[5..6] = 99, 98 -> ["dog", "cat", 9, nil, nil, 99, 98]

	stack = []
	stack.push "red"
	stack.push "green"
	stack.push "blue"
	=> ["red", "green", "blue"]

object
iterator
block
	pass value to block
	
	receive value from block