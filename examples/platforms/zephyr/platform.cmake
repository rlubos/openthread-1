# Zephyr compiler options
zephyr_get_compile_options_for_lang_as_string(C   c_options)
zephyr_get_compile_options_for_lang_as_string(CXX cxx_options)

set(c_options   "${c_options} -fno-builtin")
set(cxx_options "${cxx_options} -fno-builtin")

zephyr_get_include_directories_for_lang_as_string(       C includes)
zephyr_get_system_include_directories_for_lang_as_string(C system_includes)
zephyr_get_compile_definitions_for_lang_as_string(       C definitions)

set(CMAKE_C_FLAGS   "${c_options} ${includes} ${system_includes}")
set(CMAKE_CXX_FLAGS "${cxx_options} ${includes} ${system_includes}")
set(CMAKE_ASM_FLAGS "${c_options} ${includes} ${system_includes}")

# Other options

add_definitions(
    -DOPENTHREAD_CONFIG_LOG_LEVEL=${CONFIG_OPENTHREAD_LOG_LEVEL}
    -DOPENTHREAD_PROJECT_CORE_CONFIG_FILE="openthread-core-zephyr-config.h"
)

list(APPEND OT_PRIVATE_INCLUDES $ENV{ZEPHYR_BASE}/subsys/net/lib/openthread/platform)

# mbedTLS

# Obtain Zephyr mbedTLS path
execute_process(
COMMAND
${WEST} list -f {posixpath} mbedtls
OUTPUT_VARIABLE MBEDTLS_ROOT_DIR
)

# Trim trailing whitespace.
string(STRIP ${MBEDTLS_ROOT_DIR} MBEDTLS_ROOT_DIR)

list(APPEND OT_PRIVATE_INCLUDES ${MBEDTLS_ROOT_DIR}/configs)
list(APPEND OT_PRIVATE_INCLUDES ${MBEDTLS_ROOT_DIR}/include)

add_definitions(
    -DMBEDTLS_CONFIG_FILE="${CONFIG_MBEDTLS_CFG_FILE}"
)
