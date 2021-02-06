load gmmask
load DMN_mask.mat
load SM_mask.mat
load VI_mask.mat

cbf_imgs=zeros(45,54,45,48);
cbf_masks=zeros(45,54,45,48);
cbf_m=zeros(48,8);
for i=1:48
    cbf_sub=loadimage(['cbf/sub_',num2str(i),'.img']);
    cbf_sub_mask=loadimage(['cbf_mask/sub_',num2str(i),'_mask.img']);
    tmpcbf=cbf_sub.*cbf_sub_mask;
    cbf_imgs(:,:,:,i)=tmpcbf;
    cbf_masks(:,:,:,i)=cbf_sub_mask;

    cbf_m(i,1)=mean(cbf_sub(DMN_mask==1&cbf_sub_mask>0));%PCC
    cbf_m(i,2)=mean(cbf_sub(DMN_mask==2&cbf_sub_mask>0));%MPFC
    cbf_m(i,3)=mean(cbf_sub(DMN_mask==3&cbf_sub_mask>0));%IPL
    cbf_m(i,4)=mean(cbf_sub(DMN_mask==4&cbf_sub_mask>0));%LTC
    cbf_m(i,5)=mean(cbf_sub(DMN_mask>0&cbf_sub_mask>0));%DMN
    cbf_m(i,6)=mean(cbf_sub(gmmask>0&cbf_sub_mask>0));%GM
    cbf_m(i,7)=mean(cbf_sub(SM_mask>0&cbf_sub_mask>0));%SM
    cbf_m(i,8)=mean(cbf_sub(VI_mask>0&cbf_sub_mask>0));%VI
    
end

cbf_masks2=sum(cbf_masks,4)==48;
cbf_gm=[];
tolmask=cbf_masks2.*gmmask;

for i=1:48
    tmpcbf= cbf_imgs(:,:,:,i);
    cbf_gm(:,i)=tmpcbf(tolmask>0);
end

DMN_mask2=DMN_mask(tolmask>0)>0;

SM_mask2=SM_mask(tolmask>0);

VI_mask2=VI_mask(tolmask>0);
