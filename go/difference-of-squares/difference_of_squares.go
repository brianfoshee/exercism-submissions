package diffsquares

import "math"

func SquareOfSums(n int) int {
	s := 0
	for i := 1; i <= n; i++ {
		s += i
	}
	return int(math.Pow(float64(s), 2))
}

func SumOfSquares(n int) int {
	s := 0
	for i := 1; i <= n; i++ {
		s += int(math.Pow(float64(i), 2))
	}
	return s
}

func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}