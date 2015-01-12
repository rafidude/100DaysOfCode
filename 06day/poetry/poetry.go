package poetry

import (
	"bufio"
	"os"
)

type Line string
type Stanza []Line
type Poem []Stanza

func LoadPoemFile(name string) (Poem, error) {
	f, err := os.Open(name)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	p := Poem{}
	var s Stanza

	scan := bufio.NewScanner(f)
	for scan.Scan() {
		l := scan.Text()
		if l == "" {
			p = append(p, s)
			s = Stanza{}
			continue
		}

		s = append(s, Line(l))
	}
	p = append(p, s)

	if scan.Err() != nil {
		return nil, scan.Err()
	}
	return p, nil
}

func (p Poem) NumStanzas() int {
	return len(p)
}

func (s Stanza) NumLines() int {
	return len(s)
}

func (p Poem) NumLines() (lines int) {
	for _, s := range p {
		lines += s.NumLines()
	}
	return lines
}

func (p Poem) Stats() (numVowels, numConsonants int) {
	for _, s := range p {
		for _, l := range s {
			for _, r := range l {
				switch r {
				case 'a', 'e', 'i', 'o', 'u':
					numVowels += 1
				default:
					numConsonants += 1
				}
			}
		}
	}
	return
}
