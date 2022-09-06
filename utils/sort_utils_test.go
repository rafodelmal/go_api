package utils

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestSort(t *testing.T) {
	elements := getElements(1000000)

	Sort(elements)

	assert.NotNil(t, elements)
	assert.EqualValues(t, 1000000, len(elements))

	assert.EqualValues(t, 0, elements[0])
}

func getElements(n int) []int {
	result := make([]int, n)
	i := 0
	for j := n - 1; j >= 0; j-- {
		result[i] = j
		i++
	}
	return result
}
