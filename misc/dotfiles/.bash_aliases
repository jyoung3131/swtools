#Jeff machines
USERNAME=jyoung9
UCAMSNAME=jyoung
alias bock='ssh -X ${USERNAME}@bock.cc.gatech.edu'
alias eisbock='ssh -X ${USERNAME}@eisbock.cc.gatech.edu'
#------Wattprof
alias dunkel='ssh -X ${USERNAME}@dunkel.cc.gt.atl.ga.us'
alias moka='ssh -X ${USERNAME}@moka.cc.gt.atl.ga.us'
#HPC Garage
alias blikle='ssh -X ${USERNAME}@blikle.cc.gt.atl.ga.us'
alias condesa='ssh -X ${USERNAME}@condesa.cc.gatech.edu'
alias diskaveri='ssh -X ${USERNAME}@diskaveri.cc.gatech.edu'
alias supernovae='ssh -X ${USERNAME}@supernovae.cc.gatech.edu'
#ORNL and other clusters
alias excl='ssh -X excl.ornl.gov'
alias rhea='ssh -X ${UCAMSNAME}@rhea.ccs.ornl.gov'
alias wombat='ssh -Y ${USERNAME}@wombat-login1.ccs.ornl.gov'
alias knl='ssh -X login-knl1.stampede.tacc.utexas.edu'i
alias cori='ssh -X ${USERNAME}@cori.nersc.gov'
#Rogues Gallery - need to be on campus vpn or log in via rglogin
alias rglogin='ssh -Y ${USERNAME}@rg-login.crnch.gatech.edu'
alias rgemu='ssh -X ${USERNAME}@rg-emu-dev.crnch.gatech.edu'
alias rgfpga1='ssh -X ${USERNAME}@rg-fpga-dev-1.crnch.gatech.edu'
alias rgfpga2='ssh -X ${USERNAME}@rg-fpga-dev-2.crnch.gatech.edu'
alias rgfpga3='ssh -X ${USERNAME}@rg-fpga-dev-3.crnch.gatech.edu'
alias rgdev='ssh -Y ${USERNAME}@rg-dev.crnch.gatech.edu'
alias rgneuro='ssh -Y ${USERNAME}@rg-neuro-dev.crnch.gatech.edu'
alias rgneurohost='ssh -Y ${USERNAME}@rg-fpaa-host.crnch.gatech.edu'
alias rgflubber='ssh -Y ${USERNAME}@flubber.crnch.gatech.edu'
alias rgcubed='ssh -X ${USERNAME}@rg-fpga-cubed.crnch.gatech.edu'
alias rgtoolbox='ssh -Y ${USERNAME}@toolbox.crnch.gatech.edu'
alias rgfiles='ssh -X ${USERNAME}@files.crnch.gatech.edu'
#CC machines
alias wingtip1='ssh -X ${USERNAME}@wingtip-bigmem1.cc.gatech.edu'
alias wingtip2='ssh -X ${USERNAME}@wingtip-bigmem2.cc.gatech.edu'
alias wingtip1gpu='ssh -X ${USERNAME}@wingtip-gpu1.cc.gatech.edu'
#P100 GPU
alias wingtip2gpu='ssh -X ${USERNAME}@wingtip-gpu2.cc.gatech.edu'
#Scratch box but also has Skylake Gold 
alias csenvme='ssh -X ${USERNAME}@csenvme.cc.gatech.edu'
#KNL box
alias caesarea='ssh -X ${USERNAME}@caesarea.cc.gatech.edu'
#Power8: power8, power8b, power8c
alias power8='ssh -X ${USERNAME}@power8.cc.gatech.edu'
#Power9: newell1-3
alias newell='ssh -X ${USERNAME}@newell1.cc.gatech.edu'
#DGX
alias dgxstation='ssh -Y ${USERNAME}@dgxstation.cc.gatech.edu'
alias dgx1='ssh -Y ${USERNAME}@dgx1.cc.gatech.edu'
#PACE
alias gthive='ssh -Y ${USERNAME}@login-hive.pace.gatech.edu'
alias gtpaceice='ssh -Y ${USERNAME}@pace-ice.pace.gatech.edu'
alias cocpaceice='ssh -Y ${USERNAME}@coc-ice.pace.gatech.edu'
alias gtphoenix='ssh -Y ${USERNAME}@login-phoenix.pace.gatech.edu'
#Cray PiconGPU
alias ccoe='ssh coe0012@poplar.cray.com'
alias hzdr='ssh -Y jy140476@uts.hzdr.de'
alias summit='ssh -X ${UCAMSNAME}@summit.olcf.ornl.gov'
alias summithome='ssh -X ${UCAMSNAME}@home.ccs.ornl.gov'
alias spock='ssh ${UCAMSNAME}@spock.olcf.ornl.gov'
#CHIPC
alias chipc-login='ssh -Y ${USERNAME}@chipc-login.cc.gatech.edu'
alias chipc-slurm='ssh -Y ${USERNAME}@chipc-slurmctl.cc.gatech.edu'
alias slurm-db='ssh -Y ${USERNAME}@slurm-db.cc.gatech.edu'
#CS3220 - synestia1-18; pynq-z2-<1-10>.cc.gatech.edu
alias synestia1='ssh -Y ${USERNAME}@synestia1.cc.gatech.edu'
alias volvo='ssh jeffyoung@volvo.cc.gt.atl.ga.us'
#Kernel machines
alias aries1='ssh -Y ${USERNAME}@aries1.cc.gatech.edu'
alias aries3='ssh -Y ${USERNAME}@aries3.cc.gatech.edu'

#HPCAI - runs from rg-login only
alias thorbf='ssh -i .ssh/jyoung_hpcai_ed25519 jyoung@gw.hpcadvisorycouncil.com'

#JLSE
#alias jlse='ssh -i .ssh/jyoung_ng_triad ${UCAMSNAME}@login.jlse.login.gov'
alias jlse='ssh ${UCAMSNAME}@login.jlse.anl.gov.'
