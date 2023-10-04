load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def vroom_dependencies():
    """Loads dependencies needed for vroom."""
    # GLPK
    http_archive(
        name = "glpk",
        build_file = "//bazel:glpk.BUILD",
        urls = ["https://ftp.gnu.org/gnu/glpk/glpk-5.0.tar.gz"],
        # strip_prefix = "glpk-5.0",
    )

    # rapidjson
    http_archive(
        name = "rapidjson",
        build_file = "//bazel:rapidjson.BUILD",
        urls = ["https://github.com/Tencent/rapidjson/archive/refs/tags/v1.1.0.tar.gz"],
        strip_prefix = "rapidjson-1.1.0",
    )

    # polylineencoder
    http_archive(
        name = "polylineencoder",
        build_file = "//bazel:polylineencoder.BUILD",
        urls = ["https://github.com/vahancho/polylineencoder/archive/refs/tags/v2.0.1.tar.gz"],
        strip_prefix = "polylineencoder-2.0.1",
    )


    # asio
    http_archive(
        name = "asio",
        build_file = "//bazel:asio.BUILD",
        urls = ["https://github.com/chriskohlhoff/asio/archive/refs/tags/asio-1-28-1.tar.gz"],
        strip_prefix = "asio-asio-1-28-1",
    )

    # libosrm - not used currently
    http_archive(
        name = "libosrm",
        urls = ["https://github.com/Project-OSRM/osrm-backend/archive/refs/tags/v5.25.0.tar.gz"],
        strip_prefix = "osrm-backend-5.25.0",
    )
