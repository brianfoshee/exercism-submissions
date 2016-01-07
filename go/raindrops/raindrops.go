package raindrops

import "fmt"

type raindrop struct {
	number  int
	factors []int
}

func Convert(i int) string {
	p := raindrop{
		number:  i,
		factors: make([]int, 0),
	}
	p.primeFactorize()
	return p.String()
}

// generate prime factors
func (p *raindrop) primeFactorize() {
	for x := 2; x <= p.number; x++ {
		if p.number%x == 0 && primeTest(x) {
			p.factors = append(p.factors, x)
		}
	}
}

func (p raindrop) String() string {
	str := ""
	for _, n := range p.factors {
		switch n {
		case 3:
			str += "Pling"
		case 5:
			str += "Plang"
		case 7:
			str += "Plong"
		}
	}
	if len(p.factors) == 0 || str == "" {
		return fmt.Sprintf("%v", p.number)
	}
	return str
}

// is n a prime?
func primeTest(n int) bool {
	if n <= 3 {
		return n > 1
	}
	if n%2 == 0 || n%3 == 0 {
		return false
	}
	for i := 5; i*i <= n; i += 6 {
		if n%i == 0 || n%(i+1) == 0 {
			return false
		}
	}
	return true
}