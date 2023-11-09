#ifndef DRAIN_H
#define DRAIN_H

/*

This file is created as an extension of VROOM.

*/

#include "structures/typedefs.h"

namespace vroom {
    struct DrainPolicy {
        std::unordered_map<std::string, std::string> filter;
        DRAIN_POLICY_TYPE policy;

    };

    struct Drain {
        Duration last_service_date;
        Capacity last_service_quantity;
        std::string product_id;
        double drain_rate_units_per_day;
        std::unordered_set<std::string> labels;
        Capacity max_quantity;
        std::string product_category;

        Drain(Duration last_service_date,
            Capacity last_service_quantity = 0,
            std::string product_id = "",
            double drain_rate_units_per_day = 0.0,
            std::unordered_set<std::string> labels = {},
            Capacity max_quantity = 0,
            std::string product_category = "")
            : last_service_date(last_service_date),
            last_service_quantity(last_service_quantity),
            product_id(product_id),
            drain_rate_units_per_day(drain_rate_units_per_day),
            labels(labels),
            max_quantity(max_quantity),
            product_category(product_category) {}
        
    };
} // namespace vroom

#endif