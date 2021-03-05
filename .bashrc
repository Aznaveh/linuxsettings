alias gmake='make CC=gcc CXX=g++  JOBS=8'
alias imake='make CC=icc CXX=icpc JOBS=8'
alias mL='matlab -nodesktop'
alias hyper='ssh aznaveh@hypersparse.cs.tamu.edu'
alias hyperX='ssh -X aznaveh@hypersparse.cs.tamu.edu'
alias backslash='ssh aznaveh@backslash.engr.tamu.edu'
alias backslashX='ssh -X aznaveh@backslash.engr.tamu.edu'
#set -o vi
alias  profscp='scp aznaveh@hypersparse.cs.tamu.edu:~/SuiteSparse/ParU/Demo/callgrind.* ~/SuiteSparse/ParU/Demo/'

#git clone https://github.com/spack/spack
#source /raid/spack/share/spack/setup-env.sh
#
#Then add the
source /home/grads/a/aznaveh/spack/share/spack/setup-env.sh
#to your .bashrc
#
#To install a package (for example):
#
#spack install gcc@9.3.0
#
#To use:
#
#spack load gcc@9.3.0
#spack load gcc@10.1.0
#spack load python@3.8.0
#gcc -v

# echo 'Intel Suite:'
. /home/grads/a/aznaveh/intel/bin/compilervars.sh intel64

#. /opt/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#. /opt/intel/vtune_amplifier/amplxe-vars.sh

#export LD_LIBRARY_PATH="/home/grads/a/aznaveh/intel/mkl/lib/intel64_lin/"

#map capslock key to left shift
#xmodmap -e "keycode 66 = Shift_L NoSymbol Shift_L" 

#/raid/bashprofile
