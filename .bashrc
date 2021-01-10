alias gmake='make CC=gcc CXX=g++  JOBS=8'
alias imake='make CC=icc CXX=icpc JOBS=8'
alias mL='matlab -nodesktop'
alias hyper='ssh aznaveh@hypersparse.cs.tamu.edu'
alias hyperX='ssh -X aznaveh@hypersparse.cs.tamu.edu'
#set -o vi
alias  profscp='scp aznaveh@hypersparse.cs.tamu.edu:~/SuiteSparse/ParU/Demo/callgrind.* ~/SuiteSparse/ParU/Demo/'

. /home/grads/a/aznaveh/intel/bin/compilervars.sh intel64
#export LD_LIBRARY_PATH="/home/grads/a/aznaveh/intel/mkl/lib/intel64_lin/"
