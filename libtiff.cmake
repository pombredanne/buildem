#
# Install libtiff from source
#

if (NOT libtiff_NAME)

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

include (ExternalProject)
include (ExternalSource)
include (BuildSupport)

include (libjpeg)

external_source (libtiff
    4.0.3
    tiff-4.0.3.tar.gz
    051c1068e6a0627f461948c365290410
    ftp://ftp.remotesensing.org/pub/libtiff)

message ("Installing ${libtiff_NAME} into FlyEM build area: ${BUILDEM_DIR} ...")
ExternalProject_Add(${libtiff_NAME}
    DEPENDS             ${libjpeg_NAME}
    PREFIX              ${BUILDEM_DIR}
    URL                 ${libtiff_URL}
    URL_MD5             ${libtiff_MD5}
    UPDATE_COMMAND      ""
    PATCH_COMMAND       ""
    CONFIGURE_COMMAND   ${BUILDEM_ENV_STRING} ./configure 
        --prefix=${BUILDEM_DIR}
        LDFLAGS=${BUILDEM_LDFLAGS}
        CPPFLAGS=-I${BUILDEM_DIR}/include
    BUILD_COMMAND       ${BUILDEM_ENV_STRING} make
    BUILD_IN_SOURCE     1
    INSTALL_COMMAND     ${BUILDEM_ENV_STRING} make install
)

endif (NOT libtiff_NAME)