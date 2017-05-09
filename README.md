# HungarianAlgorithmC

A Ruby gem that computes the [Hungarian Algorithm](https://en.wikipedia.org/wiki/Hungarian_algorithm) in C.

## Installation

Add the following to your [Gemfile](http://tosbourn.com/what-is-the-gemfile/):

```ruby
# Gemfile
gem 'hungarian_algorithm_c'
```

Run `bundle install`.

## Usage

Find the best pairings for elements with costs like so:

```ruby
costs = [
  [4, 3],
  [3, 0]
]

HungarianAlgorithmC.find_pairings(costs)

#=> [[0, 0], [1, 1]]
```

The output will be an array of arrays; each sub-array will have the first element as the row index and the second element as the column index for the `costs` matrix. The indices together will select the lowest-cost combination.

Another example:

```ruby
costs = [
  [2, 3, 3],
  [3, 3, 2],
  [3, 2, 3]
]

HungarianAlgorithmC.find_pairings(costs)

#=> [[0, 0], [1, 2], [2, 1]]
```

**Note**: Costs are held in the C code using `signed long long int`. If your matrix has values outside the range of the data type (e.g. `Float::INFINITY`, `BigNumber::INFINITY`, `-1e19`), they will be capped to the closest limit i.e. positive or negative 9_223_372_036_854_775_807.

## Acknowledgements

The C code uses the implementation by [Cyrill Stachniss](ext/hungarian_algorithm_c/libhungarian). The one change made is that all `exit(0)` calls are commented out.
