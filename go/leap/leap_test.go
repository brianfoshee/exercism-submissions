package leap

import (
	"testing"
)

func TestLeapYears(t *testing.T) {
	for _, test := range testCases {
		observed := IsLeapYear(test.year)
		if observed != test.expected {
			t.Fatalf("%v is %s", test.year, test.description)
		}
	}
}

func BenchmarkLeapYears(b *testing.B) {
	b.StopTimer()
	for _, test := range testCases {
		b.StartTimer()

		for i := 0; i < b.N; i++ {
			IsLeapYear(test.year)
		}

		b.StopTimer()
	}
}
