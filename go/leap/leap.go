package leap

// Is n evenly divisible by x?
func isEvenlyDivisible(n, x int) bool {
	return n%x == 0
}

/*
A leap year falls:
	on every year that is evenly divisible by 4
	  except every year that is evenly divisible by 100
	    unless the year is also evenly divisible by 400
*/
func IsLeapYear(year int) bool {
	if !isEvenlyDivisible(year, 4) {
		return false
	}
	if isEvenlyDivisible(year, 100) && !isEvenlyDivisible(year, 400) {
		return false
	}
	return true
}
