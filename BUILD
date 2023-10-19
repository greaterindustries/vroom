load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "vroom",
    srcs = glob([
        "src/*.cpp",
        "src/**/*.cpp",
    ], exclude =[
        "src/main.cpp",
        "src/routing/*.cpp",
        "src/algorithms/validation/choose_ETA.cpp",]),
    hdrs = glob([
        "src/*.h",
        "src/**/*.h",
    ]),
    copts = [
        "-std=c++17",
        "-Wextra",
        "-Wpedantic",
        "-Wall",
        "-O3",
        "-DASIO_STANDALONE",
        "-DUSE_ROUTING=0",
        "-DUSE_LIBOSRM=0",
        "-DUSE_LIBGLPK=0",
    ],
    linkopts = [
        "-lpthread",
    ],
    includes = ["src"],
    deps = [
        "@rapidjson",
        "@polylineencoder",
        "@asio",
    ],
    visibility = ["//visibility:public"],
)