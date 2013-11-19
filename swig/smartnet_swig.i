/* -*- c++ -*- */

#define SMARTNET_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "smartnet_swig_doc.i"

%{
#include "smartnet/crc.h"
#include "smartnet/deinterleave.h"
#include "smartnet/packetize.h"
#include "smartnet/parity.h"
#include "smartnet/parse.h"
#include "smartnet/subchannel_framer.h"
#include "smartnet/sync.h"
%}

%include "smartnet/crc.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, crc);
%include "smartnet/deinterleave.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, deinterleave);
%include "smartnet/packetize.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, packetize);
%include "smartnet/parity.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, parity);
%include "smartnet/parse.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, parse);
%include "smartnet/subchannel_framer.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, subchannel_framer);
%include "smartnet/sync.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, sync);
