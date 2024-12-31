package merkle

import (
	"github.com/barweiss/go-tuple"
	"mtoohey.com/iter"
)

func Unzip[T uint, U []byte](nt []tuple.T2[T, U]) ([]T, []U) {
	v1, v2 := iter.Unzip[T, U](iter.Elems[tuple.T2[T, U]](nt))
	indices := make([]T, len(nt))
	v1.CollectInto(indices)
	hashes := make([]U, len(nt))
	v2.CollectInto(hashes)

	return indices, hashes
}

// Pop removes the last item of a NodeTuple slice (if exists) and returns it
func Pop[T []NodeTuple](s []T) (T, []T) {
	last := []NodeTuple{}
	if len(s) > 0 {
		last = s[len(s)-1]
		s = s[:len(s)-1]
	}

	return last, s
}
