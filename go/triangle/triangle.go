package triangle

type Kind string

const (
	Equ = "Equ"
	Iso = "Iso"
	Sca = "Sca"
	NaT = "NaT"
)

type triangle struct {
	a, b, c float64
	k       Kind
}

func KindFromSides(a, b, c float64) Kind {
	t := triangle{a: a, b: b, c: c}
	if t.check(NaT); t.k != NaT {
		ks := []Kind{Equ, Iso, Sca}
		for _, k := range ks {
			t.check(k)
		}
	}
	return t.k
}

func (t *triangle) check(k Kind) {
	switch k {
	case Equ:
		t.checkEqu()
	case Iso:
		t.checkIso()
	case Sca:
		t.checkSca()
	case NaT:
		t.checkNaT()
	default:
		t.checkNaT()
	}
}

// All sides are 0, or fails the triangle inequality theorem
func (t *triangle) checkNaT() {
	ab := t.a + t.b
	ac := t.a + t.c
	bc := t.b + t.c
	z := t.a == 0 && t.b == 0 && t.c == 0
	if !(ab > t.c && ac > t.b && bc > t.a) || z {
		t.k = NaT
	}
}

// All sides are not equal
func (t *triangle) checkSca() {
	if t.a != t.b && t.b != t.c && t.a != t.c {
		t.k = Sca
	}
}

// Only two sides are equal
func (t *triangle) checkIso() {
	ab := t.a == t.b && t.a != t.c
	bc := t.b == t.c && t.b != t.a
	ac := t.a == t.c && t.a != t.b
	if ab || bc || ac {
		t.k = Iso
	}
}

// all sides are equal
func (t *triangle) checkEqu() {
	s := t.a == t.b && t.b == t.c
	if s {
		t.k = Equ
	}
}
