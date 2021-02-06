# Infant_CBF_Rest
version 1.1
Title: Physiological underpinning of default-mode network emergence in the human infant brain 


The following items are included:
1. Custom code in Matlab for rCBF growth map generation and permutation test of the significance of coupling
   1) cbf.m;
   2) cbf_growth.m;
   2) Permutation.m;

2. Input data:
	1) age.mat: ages of 48 subject
	2) gmmask.mat: gray matter mask at template space
	3) DMN_mask.mat: mask of DMN network, value 1 for PCC, 2 for MPFC, 3 for IPL, 4 for LTC
	4) SM_mask.mat: mask of sensory motor network
	5) VI_mask.mat: mask of visual network
	6) FC_within.mat: 48 subjects x 3 networks (DMN, SM and Vis)
	7) in cbf and cbf_mask folder, several subject in .img format for example
	
3. Expected output:
	1) beta value (rCBF growth per month) and R square at each gray matter(GM) voxel
	2) prediected rCBF map at arbitary age
	3) percentile of significant coupling voxel at each network

4. Demo and Instructions for Use
Open scripts in Matlab, and change scripts' directory as Current Folder directory in Matlab. Click "Run" button in Matlab EDITOR tab to execute scripts.
Here, scripts take demo input data including FC_within.mat (function connectivity within DMN, SM and Vis for all subjects) and rCBF_sample.mat.
Expected run time for demo on a 'normal' desktop computer is less than 30 seconds.

5. System requirements
Scripts have been tested on Matlab 2018a in Windows operating systems. 
Hardware requirement: Matlab scripts require only a standard computer with enough RAM (8+ GB is recommended).
