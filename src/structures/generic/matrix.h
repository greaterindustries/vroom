#ifndef MATRIX_H
#define MATRIX_H

/*

This file is part of VROOM.

Copyright (c) 2015-2022, Julien Coupey.
All rights reserved (see LICENSE).

*/

#include <initializer_list>
#include <memory>
#include "structures/typedefs.h"
#include <vector>

namespace vroom {

template <class T> class Matrix {

  std::size_t n;
  std::shared_ptr<std::vector<T>> data;

public:
  Matrix();

  explicit Matrix(std::size_t n);

  Matrix(std::size_t n, T value);

  Matrix<T> get_sub_matrix(const std::vector<Index>& indices) const;

  Matrix(const Matrix<T>& other) : n(other.n), data(other.data) {
  }

  T* operator[](std::size_t i) {
    return data->data() + (i * n);
  }

  const T* operator[](std::size_t i) const {
    return data->data() + (i * n);
  }

  std::size_t size() const {
    return n;
  }

#if USE_PYTHON_BINDINGS
  T* get_data() {
    return data.data();
  };
#endif
};

} // namespace vroom

#endif
