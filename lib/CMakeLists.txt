# Copyright 2011,2012 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# GNU Radio is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
#
# GNU Radio is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Radio; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.

########################################################################
# Setup library
########################################################################
include(GrPlatform) #define LIB_SUFFIX

include_directories(${Boost_INCLUDE_DIR} ${GNURRADIO_BLOCKS_INCLUDE_DIRS})
link_directories(${Boost_LIBRARY_DIRS})
list(APPEND smartnet_sources
    crc_impl.cc
    deinterleave_impl.cc
    packetize_impl.cc
    parity_impl.cc
    parse_impl.cc
    subchannel_framer_impl.cc
    sync_impl.cc )

add_library(gnuradio-smartnet SHARED ${smartnet_sources})
target_link_libraries(gnuradio-smartnet ${Boost_LIBRARIES} ${GNURADIO_RUNTIME_LIBRARIES} ${GNURADIO_BLOCKS_LIBRARIES})
set_target_properties(gnuradio-smartnet PROPERTIES DEFINE_SYMBOL "gnuradio_smartnet_EXPORTS")

########################################################################
# Install built library files
########################################################################
install(TARGETS gnuradio-smartnet
    LIBRARY DESTINATION lib${LIB_SUFFIX} # .so/.dylib file
    ARCHIVE DESTINATION lib${LIB_SUFFIX} # .lib file
    RUNTIME DESTINATION bin              # .dll file
)

