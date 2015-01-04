package math

import "testing"

type testAverage struct {
	input  []float64
	output float64
}

var testAverageData = []testAverage{
	{[]float64{1, 2}, 1.5},
	{[]float64{2, -1, 3, -4}, 0.0},
}

func TestAverage(t *testing.T) {
	var v float64
	v = Average([]float64{1, 2})
	if v != 1.5 {
		t.Error("Expected 1.5, got ", v)
	}
	for _, pair := range testAverageData {
		v = Average(pair.input)
		if v != pair.output {
			t.Error(
				"For", pair.input,
				"expected", pair.output,
				"got", v,
			)
		}
	}
}
