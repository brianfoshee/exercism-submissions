package gigasecond

import (
	"math"
	"time"
)

const TestVersion = 2

var Birthday time.Time

func init() {
	Birthday, _ = time.Parse(fmtD, "1970-04-02")
}

func AddGigasecond(t time.Time) time.Time {
	bs := time.Second * time.Duration(math.Pow10(9))
	return t.Add(bs)
}
