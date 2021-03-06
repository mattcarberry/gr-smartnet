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
#include "packetize_impl.h"
#include "smartnet_types.h"

namespace gr {
    namespace smartnet {

        packetize::sptr
            packetize::make()
            {
                return gnuradio::get_initial_sptr
                    (new packetize_impl());
            }

        /*
         * The private constructor
         */
        packetize_impl::packetize_impl()
            : gr::block("packetize",
                    gr::io_signature::make(1, 1, sizeof(char)),
                    gr::io_signature::make(1, 1, sizeof(struct smartnet_packet)))
        {
            set_relative_rate((double)(1/38));
            set_output_multiple(1);
            //printf("Calling constructor\n");
        }

        /*
         * Our virtual destructor.
         */
        packetize_impl::~packetize_impl()
        {
        }

        void
            packetize_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
            {
                /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
                ninput_items_required[0] = noutput_items * 38;
            }

        int
            packetize_impl::general_work (int noutput_items,
                    gr_vector_int &ninput_items,
                    gr_vector_const_void_star &input_items,
                    gr_vector_void_star &output_items)
            {
                const char *in = (const char *) input_items[0];
                struct smartnet_packet *out = (struct smartnet_packet *) output_items[0];

                int j = 0; //j is the output item counter
                int i = 0; //i is the input item counter

                while(j < noutput_items) {
                    while(!(in[i] & 0x02) && i < ninput_items[0]) {
                        i++; //skip to where the start of the packet is, or skip packets that failed CRC and had their start bit cleared
                        //printf("Skipping...\n");
                    }

                    if(i == ninput_items[0]) break;

                    out[j].address = 0;
                    out[j].groupflag = false;
                    out[j].command = 0;
                    out[j].crc = 0;
                    //	printf("Setting address at bit %i\n", i);
                    for(int k = 15; k >=0 ; k--) out[j].address += (!bool(in[i++] & 0x01)) << k; //first 16 bits are ID, MSB first
                    //	printf("Setting groupflag at bit %i\n", i);
                    out[j].groupflag = !bool(in[i++]);
                    //	printf("Setting command at bit %i\n", i);
                    for(int k = 9; k >=0 ; k--) out[j].command += (!bool(in[i++] & 0x01)) << k; //next 10 bits are command, MSB first
                    //	printf("Setting CRC at bit %i\n", i);
                    for(int k = 9; k >=0 ; k--) out[j].crc += (!bool(in[i++] & 0x01)) << k; //next 10 bits are CRC
                    i++; //skip the guard bit

                    //now correct things according to the mottrunk.txt description
                    out[j].address ^= 0x33C7;
                    out[j].command ^= 0x032A;

                    //printf("Address: %x, command: 0x%x, groupflag: %i\n", out[j].address, out[j].command, int(out[j].groupflag));

                    j++; //move to the next output item
                }

                consume_each(i); //tell gnuradio how many input items we used
                //  ninput_items[0] = i;
                // Tell runtime system how many output items we produced.
                return j;   }

    } /* namespace smartnet */
} /* namespace gr */

