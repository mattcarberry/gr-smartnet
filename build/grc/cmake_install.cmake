# Install script for directory: /home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gnuradio/grc/blocks" TYPE FILE FILES
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_fsk_demod.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_crc.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_deinterleave.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_packetize.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_parity.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_parse.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_subchannel_framer.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_sync.xml"
    "/home/mcarberry/radio/smartnet/gr-smartnet-modtool/gr-smartnet/grc/smartnet_smartnet_wavsink.xml"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

