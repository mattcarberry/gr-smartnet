/* -*- c++ -*- */
/* 
 * Copyright 2013 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "crc_impl.h"
#include <stdio.h>

namespace gr {
    namespace smartnet {

        crc::sptr
            crc::make()
            {
                return gnuradio::get_initial_sptr
                    (new crc_impl());
            }

        /*
         * The private constructor
         */
        crc_impl::crc_impl()
            : gr::sync_block("crc",
                    gr::io_signature::make(1, 1, sizeof(char)),
                    gr::io_signature::make(1, 1, sizeof(char)))
        {
            set_output_multiple(38);
        }

        /*
         * Our virtual destructor.
         */
        crc_impl::~crc_impl()
        {
        }

        int crc_impl::work(int noutput_items,
                gr_vector_const_void_star &input_items,
                gr_vector_void_star &output_items)
        {
            const char *in = (const char *) input_items[0];
            char *out = (char *) output_items[0];

            int i = 0;
            unsigned int crcaccum;
            unsigned int crcop;
            unsigned int crcgiven;

            while(i < noutput_items) {
                while(!(in[i] & 0x02)) i++; //skip until the start bit is found
                if((noutput_items-i) < 38) return i;

                crcaccum = 0x0393;
                crcop = 0x036E;

                //now we're at the start of a 38-bit frame, so calculate the expected crc
                for(int j = 0; j < 27; j++) {
                    if (crcop & 0x01) crcop = (crcop >> 1) ^ 0x0225; else crcop = crcop >> 1;
                    if (in[i+j] & 0x01) crcaccum = crcaccum ^ crcop;
                }

                //now we load up the GIVEN crc value
                crcgiven = 0x0000;
                for(int j = 0; j < 10; j++) {
                    crcgiven <<= 1;
                    crcgiven += !bool(in[i+j+27] & 0x01);
                }

                if(crcgiven != crcaccum) printf("Failed CRC!\n");	

                for(int j = 0; j < 38; j++) {
                    if(crcgiven == crcaccum) out[j+i] = in[j+i];
                    else out[j+i] = in[j+i] & 0x01;
                }

                i += 38;
            }

            // Tell runtime system how many output items we produced.
            return noutput_items;
        }

    } /* namespace smartnet */
} /* namespace gr */

