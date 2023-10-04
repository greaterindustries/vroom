load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def vroom_dependencies():
    """Loads dependencies needed for vroom."""
    # GLPK
    http_archive(
        name = "glpk",
        build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "glpk",
    srcs = glob(
        [
            "glpk-5.0/src/*.c",
            "glpk-5.0/src/*/*.c",
            "glpk-5.0/src/*.h",
            "glpk-5.0/src/*/*.h",
        ],
        exclude = [
            "glpk-5.0/src/proxy/main.c",
        ],
    ),
    hdrs = [
        "glpk-5.0/src/glpk.h",
    ],
    copts = [
        "-w",
        "-Iexternal/glpk/glpk-5.0/src",
        "-Iexternal/glpk/glpk-5.0/src/amd",
        "-Iexternal/glpk/glpk-5.0/src/api",
        "-Iexternal/glpk/glpk-5.0/src/bflib",
        "-Iexternal/glpk/glpk-5.0/src/colamd",
        "-Iexternal/glpk/glpk-5.0/src/draft",
        "-Iexternal/glpk/glpk-5.0/src/env",
        "-Iexternal/glpk/glpk-5.0/src/intopt",
        "-Iexternal/glpk/glpk-5.0/src/minisat",
        "-Iexternal/glpk/glpk-5.0/src/misc",
        "-Iexternal/glpk/glpk-5.0/src/mpl",
        "-Iexternal/glpk/glpk-5.0/src/npp",
        "-Iexternal/glpk/glpk-5.0/src/proxy",
        "-Iexternal/glpk/glpk-5.0/src/simplex",
    ],
    includes = ["glpk-5.0/src"],
    visibility = ["//visibility:public"],
)
        """,
        urls = ["https://ftp.gnu.org/gnu/glpk/glpk-5.0.tar.gz"],
        # strip_prefix = "glpk-5.0",
    )

    # rapidjson
    http_archive(
        name = "rapidjson",
        build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "rapidjson",
    srcs = [
        "include/rapidjson/internal/biginteger.h",
        "include/rapidjson/internal/diyfp.h",
        "include/rapidjson/internal/dtoa.h",
        "include/rapidjson/internal/ieee754.h",
        "include/rapidjson/internal/itoa.h",
        "include/rapidjson/internal/meta.h",
        "include/rapidjson/internal/pow10.h",
        "include/rapidjson/internal/regex.h",
        "include/rapidjson/internal/stack.h",
        "include/rapidjson/internal/strfunc.h",
        "include/rapidjson/internal/strtod.h",
        "include/rapidjson/internal/swap.h",
    ],
    hdrs = [
        "include/rapidjson/allocators.h",
        "include/rapidjson/document.h",
        "include/rapidjson/encodedstream.h",
        "include/rapidjson/encodings.h",
        "include/rapidjson/error/en.h",
        "include/rapidjson/error/error.h",
        "include/rapidjson/filereadstream.h",
        "include/rapidjson/filewritestream.h",
        "include/rapidjson/fwd.h",
        "include/rapidjson/istreamwrapper.h",
        "include/rapidjson/memorybuffer.h",
        "include/rapidjson/memorystream.h",
        "include/rapidjson/ostreamwrapper.h",
        "include/rapidjson/pointer.h",
        "include/rapidjson/prettywriter.h",
        "include/rapidjson/rapidjson.h",
        "include/rapidjson/reader.h",
        "include/rapidjson/schema.h",
        "include/rapidjson/stream.h",
        "include/rapidjson/stringbuffer.h",
        "include/rapidjson/writer.h",
    ],
    includes = ["include"],
    visibility = ["//visibility:public"],
)
        """,
        urls = ["https://github.com/Tencent/rapidjson/archive/refs/tags/v1.1.0.tar.gz"],
        strip_prefix = "rapidjson-1.1.0",
    )

    # polylineencoder
    http_archive(
        name = "polylineencoder",
        build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "polylineencoder",
    hdrs = [
        "src/polylineencoder.h",
    ],
    includes = ["src"],
    visibility = ["//visibility:public"],
)
        """,
        urls = ["https://github.com/vahancho/polylineencoder/archive/refs/tags/v2.0.1.tar.gz"],
        strip_prefix = "polylineencoder-2.0.1",
    )


    # asio
    http_archive(
        name = "asio",
        build_file_content = """
load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "asio",
    hdrs = glob(["asio/include/**/*.h*"] + ["asio/include/**/*.i*"]),
    defines = ["ASIO_STANDALONE"],
    includes = ["asio/include"],
    visibility = ["//visibility:public"],
)
        """,
        urls = ["https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-28-1.tar.gz"],
        strip_prefix = "asio-asio-1-28-1",
    )

    # libosrm - not used currently
    http_archive(
        name = "libosrm",
        urls = ["https://github.com/Project-OSRM/osrm-backend/archive/refs/tags/v5.25.0.tar.gz"],
        strip_prefix = "osrm-backend-5.25.0",
    )
