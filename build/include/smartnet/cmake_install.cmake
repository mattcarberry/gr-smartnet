# Install script for directory: /home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/smartnet" TYPE FILE FILES
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/api.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_crc.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_deinterleave.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_packetize.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_parity.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_parse.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_subchannel_framer.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_sync.h"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/include/smartnet/smartnet_wavsink.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

