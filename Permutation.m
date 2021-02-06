
%permutation test
load FC_within.mat% FC_within: 48 subject x 3 networks(DMN, SM, VI)

cbf_gm2=cbf_gm';

cp=corr(cbf_gm2,FC_within);

% for i=1:size(cbf_gm2,2)
%     tmp=cbf_gm2(:,i);
%     keep=tmp>0;
%     keep=1:48;
%     cp(i,:)=corr(FC_within(keep,:),tmp(keep));
% 
% end

tcri=0.28;

seln=1;% DMN 1, SM 2, VI 3
pt=10000;% permuted time
n=size(cp,1);
tmpnet=cp(:,seln);
nvo=[sum(DMN_mask2),sum(SM_mask2),sum(VI_mask2)]; % number of voxels in three networks
svo=[sum(cp(DMN_mask2>0,seln)>tcri),sum(cp(SM_mask2>0,seln)>tcri),sum(cp(VI_mask2>0,seln)>tcri)];% number of significant voxel
psvo=svo./nvo;% percent of significant voxel;

mnvo=round(mean(nvo));% average the number of voxels within three networks

ndis=[];% Null distribution

for i=1:pt
    tmpnets=tmpnet(randperm(n));%shuffle the voxels
    tmpnets2=tmpnets(1:mnvo);% sample the voxels
    ndis(i)=sum(tmpnets2>tcri)/mnvo;% percent of the signicant voxel in ith permutation
    
end

ndiss=sort(ndis,'descend');

sig=[];% significant of the permutation test
for i=1:3
    sig(i)=sum(ndiss>psvo(i))/pt;
    
end

sig
