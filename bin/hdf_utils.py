#!/usr/bin/env python3

'''
Modified to python3 from:
https://confluence.slac.stanford.edu/display/PSDM/How+to+access+HDF5+data+from+Python
'''


import h5py
import sys

def print_hdf5_file_structure(file_name) :
    """Prints the HDF5 file structure"""
    file = h5py.File(file_name, 'r') # open read-only
    item = file #["/Configure:0000/Run:0000"]
    print_hdf5_item_structure(item)
    file.close()

def print_hdf5_item_structure(g, offset='    ') :
    """Prints the input file/group/dataset (g) name and begin iterations on its content"""
    if isinstance(g,h5py.File) :
        print(g.file, '(File)', g.name)

    elif isinstance(g,h5py.Dataset) :
        print('(Dataset)', g.name, '    len =', g.shape) #, g.dtype)

    elif isinstance(g,h5py.Group) :
        print('(Group)', g.name)

    else :
        print('WORNING: UNKNOWN ITEM IN HDF5 FILE', g.name)
        sys.exit ( "EXECUTION IS TERMINATED" )

    if isinstance(g, h5py.File) or isinstance(g, h5py.Group) :
        for key,val in dict(g).items() :
            subg = val
            print(offset, key) #, ,"   ", subg.name #, val, subg.len(), type(subg),
            print_hdf5_item_structure(subg, offset + '    ')

if __name__ == "__main__" :
    print_hdf5_file_structure('/reg/d/psdm/XPP/xppcom10/hdf5/xppcom10-r0546.h5')
    sys.exit ( "End of test" )
