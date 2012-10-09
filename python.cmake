#
# Install python from source
#

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (SetBuildDir)
include (CacheDownload)

set (python_RELEASE  2.7.3)
set (python_NAME     "Python-${python_RELEASE}")

cache_download (python ${python_NAME}.tgz http://www.python.org/ftp/python/2.7.3)

message ("Installing ${python_NAME} into FlyEM build area: ${FLYEM_BUILD_DIR} ...")
set_src_dir (python ${python_NAME})

ExternalProject_Add(${python_NAME}
    PREFIX ${FLYEM_BUILD_DIR}
    URL http://www.python.org/ftp/python/2.7.3/${python_NAME}.tgz
    UPDATE_COMMAND ""
    PATCH_COMMAND ""
    CONFIGURE_COMMAND ${python_SRC_DIR}/configure --prefix=${FLYEM_BUILD_DIR}
    BUILD_COMMAND make
    INSTALL_COMMAND make install
)
set (PYTHON_INCLUDE_PATH ${FLYEM_BUILD_DIR}/include/python2.7)

