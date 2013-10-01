/* -*- c++ -*- */

#define SMARTNET_API

%include "gnuradio.i"			// the common stuff

//load generated python docstrings
%include "smartnet_swig_doc.i"

%{
#include "smartnet/smartnet_crc.h"
#include "smartnet/smartnet_deinterleave.h"
#include "smartnet/smartnet_packetize.h"
#include "smartnet/smartnet_parity.h"
#include "smartnet/smartnet_parse.h"
#include "smartnet/smartnet_subchannel_framer.h"
#include "smartnet/smartnet_sync.h"
#include "smartnet/smartnet_wavsink.h"
%}

%include "smartnet/smartnet_crc.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_crc);
%include "smartnet/smartnet_deinterleave.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_deinterleave);
%include "smartnet/smartnet_packetize.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_packetize);
%include "smartnet/smartnet_parity.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_parity);
%include "smartnet/smartnet_parse.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_parse);
%include "smartnet/smartnet_subchannel_framer.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_subchannel_framer);
%include "smartnet/smartnet_sync.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_sync);
%include "smartnet/smartnet_wavsink.h"
GR_SWIG_BLOCK_MAGIC2(smartnet, smartnet_wavsink);
