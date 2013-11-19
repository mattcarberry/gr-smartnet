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
#include "deinterleave_impl.h"

namespace gr {
    namespace smartnet {

        deinterleave::sptr
            deinterleave::make()
            {
                return gnuradio::get_initial_sptr
                    (new deinterleave_impl());
            }

        /*
         * The private constructor
         */
        deinterleave_impl::deinterleave_impl()
            : gr::block("deinterleave",
                    gr::io_signature::make(1, 1, sizeof(char)),
                    gr::io_signature::make(1, 1, sizeof(char)))
        {
            set_relative_rate((double)(76.0/84.0));
            set_output_multiple(76);
            //printf("Calling constructor\n");
        }

        /*
         * Our virtual destructor.
         */
        deinterleave_impl::~deinterleave_impl()
        {
        }

        void
            deinterleave_impl::forecast (int noutput_items, gr_vector_int &ninput_items_required)
            {
                /* <+forecast+> e.g. ninput_items_required[0] = noutput_items */
                int size = (noutput_items * 84) / 76;

                ninput_items_required[0] = size;
            }

        int
            deinterleave_impl::general_work (int noutput_items,
                    gr_vector_int &ninput_items,
                    gr_vector_const_void_star &input_items,
                    gr_vector_void_star &output_items)
            {
                const char *in = (const char *) input_items[0];
                char *out = (char *) output_items[0];

                int j = 0; //j is the output item counter
                int i = 0; //i is the input item counter
                int k = 0; //k is the loop counter for deinterleaving
                int l = 0;

                while(i < noutput_items){

                    if(in[i] & 0x02) {//if the start bit is set
                        //then the next 76 bits get deinterleaved according to the formula
                        //{1,20,39,58,2,21,40,59,3,22,41,60,...}
                        if(noutput_items - i < 76) {
                            consume_each(i);	
                            return j;
                        }
                        for(k = 0; k < 76/4; k++) {
                            for(l = 0; l < 4; l++) {
                                out[j + k*4 + l] = in[i + k + l*19];
                                //			out[j + k*4 + l] = in[i + k*4 + l];
                            }
                            //			printf("Deinterleaving input item %i to output item %i\n", k, k*4);
                            //			printf("Deinterleaving input item %i to output item %i\n", k+19, k*4+1);
                            //			printf("Deinterleaving input item %i to output item %i\n", k+38, k*4+2);
                            //			printf("Deinterleaving input item %i to output item %i\n", k+57, k*4+3);
                            //
                        }
                        j+=76;
                        i+=84;
                    } else i++;
                }

                consume_each(i); //tell gnuradio how many input items we used
                //  ninput_items[0] = i;
                // Tell runtime system how many output items we produced.
                return j;
            }

    } /* namespace smartnet */
} /* namespace gr */

