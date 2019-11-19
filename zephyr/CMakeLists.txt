set(OT_BUILD_EXECUTABLES OFF CACHE BOOL "Disable OpenThread samples")
set(OT_BUILTIN_MBEDTLS OFF CACHE BOOL "Use Zephry's mbedTLS")
set(OT_PLATFORM "zephyr" CACHE STRING "Zephyr as a target platform")

# Need to specify build directory as well
add_subdirectory(.. ..)
