#include "ruby.h"
#include "libhungarian/hungarian.c"
#include "libhungarian/hungarian_test.c"

// Define namespace / module name
VALUE HungarianAlgorithmC = Qnil;

// function declarations
void Init_hungarian_algorithm_c();
static VALUE indices_array(hungarian_problem_t* p, int row_size);
VALUE pairs(VALUE self, VALUE flattened_array_ruby, VALUE row_size_val);

// function to initialize module
void Init_hungarian_algorithm_c() {
  HungarianAlgorithmC = rb_define_module("HungarianAlgorithmC");
  rb_define_singleton_method(HungarianAlgorithmC, "pairs", pairs, 2);
}

// function to extract assignment indices from a hungarian_problem_t struct to a '2D' Ruby array
static VALUE indices_array(hungarian_problem_t* p, int row_size) {
  int** values = p->assignment;
  VALUE array = rb_ary_new2(row_size);

  int i;
  for (i = 0; i < row_size; i++) {
    VALUE row = rb_ary_new2(2);

    int j;
    for (j = 0; j < row_size; j++) {
      int value = values[i][j];
      if (value == 1) {
        rb_ary_push(row, INT2NUM(i));
        rb_ary_push(row, INT2NUM(j));
      }
    }

    rb_ary_push(array, row);
  }

  return array;
}

// function to find the optimal assignments from a flattend Ruby array
// array must be flatted from an array representation of a rectangular matrix
// i.e. the number of rows should equal the number of columns
VALUE pairs(VALUE self, VALUE flattened_array_ruby, VALUE row_size_val) {
  VALUE output;
  hungarian_problem_t p;
  int** matrix;
  int row_size = NUM2INT(row_size_val);
  int array_size = row_size * row_size;
  int array_c[array_size];

  int index;
  for (index = 0; index < array_size; index++) {
    signed long long int rounded_element = NUM2LL(rb_ary_entry(flattened_array_ruby, index));
    array_c[index] = rounded_element;
  }

  matrix = array_to_matrix(array_c, row_size, row_size);

  hungarian_init(&p, matrix, row_size, row_size, 0);
  hungarian_solve(&p);
  output = indices_array(&p, row_size);
  hungarian_free(&p);

  return output;
}
