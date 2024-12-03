#ifndef CVRP_H
#define CVRP_H

/*

This file is part of VROOM.

Copyright (c) 2015-2024, Julien Coupey.
All rights reserved (see LICENSE).

*/

#include "problems/vrp.h"

namespace vroom {

class CVRP : public VRP {
private:
  bool empty_cluster(const std::vector<Index>& cluster, Index v) const;

  static const std::vector<HeuristicParameters> homogeneous_parameters;
  static const std::vector<HeuristicParameters> heterogeneous_parameters;

public:
  explicit CVRP(const Input& input);

  Solution
  solve(const unsigned nb_searches,
        const unsigned depth,
        const unsigned nb_threads,
        const Timeout& timeout,
        const std::vector<HeuristicParameters>& h_param) const override;
};

} // namespace vroom

#endif
