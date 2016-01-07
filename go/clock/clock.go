package clock

import (
	"fmt"
	"math"
)

const TestVersion = 2

type time struct {
	hour, minute int
}

func Time(h, m int) time {
	if m >= 60 {
		h += int(m / 60)
		m %= 60
	}
	if m < 0 {
		m *= -1
		h -= int(math.Ceil(float64(m) / 60))
		m = 60 - (m % 60)
	}
	if h < 0 {
		h = 24 - ((h * -1) % 24)
	}
	if h >= 24 {
		h -= 24
	}
	return time{hour: h, minute: m}
}

func (t time) Add(m int) time {
	nm := t.minute
	if m >= 0 {
		nm += m
	} else {
		nm -= m * -1
	}
	return Time(t.hour, nm)
}

func (t time) String() string {
	return fmt.Sprintf("%.2v:%.2v", t.hour, t.minute)
}