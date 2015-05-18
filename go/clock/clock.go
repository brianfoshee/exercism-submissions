package clock

import (
	"fmt"
	"math"
)

type clock struct {
	h, m int
}

func (c clock) String() string {
	return fmt.Sprintf("%2.2d:%2.2d", c.h, c.m)
}

// m is assumned to come in as a negative number
func (c clock) Subtract(m int) clock {
	diff := math.Abs(float64(m) / 60.0)
	hr := float64(c.h) - math.Ceil(diff)
	if hr < 0 {
		hr = 24 + hr
	}
	min := c.m + m
	if min < 0 {
		min = 60 + (min % 60)
	}

	c.h = int(hr)
	c.m = int(min)

	return c
}

func (c clock) Add(m int) clock {
	if m < 0 {
		return c.Subtract(m)
	} else {
		c.m += m
		if c.m > 59 {
			c.m = c.m % 60
		}
		diff := math.Abs(float64(m) / 60.0)
		hr := float64(c.h) + math.Floor(diff)
		c.h = int(hr)
		if c.h > 23 {
			c.h = c.h % 24
		}
	}
	return c
}

func New(h, m int) clock {
	return clock{h: h, m: m}
}
