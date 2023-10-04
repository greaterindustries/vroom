load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "vroom",
    srcs = glob([
        "src/*.cpp",
        "src/**/*.cpp",
    ], exclude =[
        "src/main.cpp",
        "src/routing/libosrm_wrapper.cpp",
        "src/routing/http_wrapper.cpp"]),
    hdrs = glob([
        "src/*.h",
        "src/**/*.h",
    ]),
    copts = [
        "-std=c++20",
        "-Wextra",
        "-Wpedantic",
        "-Wall",
        "-O3",
        "-DASIO_STANDALONE",
    ],
    linkopts = [
        "-lpthread",
    ],
    includes = ["src"],
    deps = [
        "@glpk",
        "@rapidjson",
        "@polylineencoder",
        "@asio",
    ],
)