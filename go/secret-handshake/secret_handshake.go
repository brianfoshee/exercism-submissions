package secret

func Handshake(n int) []string {
	if n <= 0 {
		return nil
	}

	var hs []string
	w := n & 0x01
	db := n & 0x02
	cye := n & 0x04
	j := n & 0x08
	r := n & 0x10

	if w == 0x01 {
		hs = append(hs, "wink")
	}
	if db == 0x02 {
		hs = append(hs, "double blink")
	}
	if cye == 0x04 {
		hs = append(hs, "close your eyes")
	}
	if j == 0x08 {
		hs = append(hs, "jump")
	}
	if r == 0x10 {
		l := len(hs) - 1
		for i := 0; i < (l+1)/2; i++ {
			hs[i], hs[l-i] = hs[l-i], hs[i]
		}
	}
	return hs
}
