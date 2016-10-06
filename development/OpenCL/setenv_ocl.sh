#!/bin/bash
#Allow for switching between Intel, Beignet, or NVIDIA OpenCL libraries
#Last updated: 10/6/2016

USERNAME=`whoami`

#Ubuntu 14.04
#PREVPATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#Ubuntu 16.04
PREVPATH=/home/$USERNAME/bin:/home/$USERNAME/.local/bin:/home/$USERNAME/bin:/home/$USERNAME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/snap/bin

if [ -z $1 ]
then
        echo "Please enter 1, 2, or 3 (i64, Beignet, CUDA) as an argument"
        exit
fi

if [ $1 == "1" ];
then
        #SDK has include files but /etc/OpenCl/vendors/intel64.icd points to other directory for lib
        export PATH=/opt/intel/opencl-1.2-4.4.0.117/bin:$PREVPATH
        export LD_LIBRARY_PATH=/opt/intel/opencl-1.2-4.4.0.117/lib64:/opt/intel/opencl-1.2-5.0.8/lib64:/usr/local/lib:/usr/lib64:/usr/lib
        export OCL_INCLUDES=/opt/intel/opencl-1.2-4.4.0.117/include
elif [ $1 == "2" ];
then
        export PATH=:$PREVPATH
        export LD_LIBRARY_PATH=/usr/local/lib/beignet/:/usr/local/lib:/usr/lib64:/usr/lib
	export OCL_INCLUDES=/usr/local/lib/beignet/include:/usr/local/include
elif [ $1 == "3" ];
then
        export PATH=/usr/local/cuda/bin:$PREVPATH
        export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/lib:/usr/local/lib:/usr/lib64:/usr/lib
        export OCL_INCLUDES=/usr/local/cuda/include
fi

echo "PATH: $PATH"
echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "OCL_INCLUDES: $OCL_INCLUDES"
