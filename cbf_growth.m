%cbf change map
load age
cbf_mask=mean(cbf_masks,4);
% write_ANALYZE(cbf_mask,['cbf_mask.img'],[45,54,45],[4 4 4],1,16);
cbf_mask=cbf_mask==1;
cbf_mat=zeros(48,sum(cbf_mask(:)));
age_c=[age,ones(48,1)];

for i=1:48
    tmp=cbf_imgs(:,:,:,i);
    cbf_mat(i,:)=tmp(cbf_mask);
end

beta=age_c\cbf_mat;

error=cbf_mat-age_c*beta;
SSres=sum(error.^2);
SStol=sum((cbf_mat-repmat(mean(cbf_mat),[48,1])).^2);
rsq=1-SSres./SStol;

rsq_map=zeros(45,54,45);
rsq_map(cbf_mask)=rsq;
pred_age=[0 6 12 18 24]';
pred_age_c=[pred_age,ones(length(pred_age),1)];
cbf_pred=pred_age_c*beta;

cbf_pred_img=zeros(45,54,45,length(pred_age));
for i=1:length(pred_age)
    tmp=zeros(45,54,45);
    tmp(cbf_mask)=cbf_pred(i,:);
    cbf_pred_img(:,:,:,i)=tmp;% predicted rCBF at 0,6,12,18,24 months 
    
end
% 
% tmp=zeros(45,54,45);
% tmp(cbf_mask)=beta(1,:);
% %   write_ANALYZE(cbf_pred_img(:,:,:,end),['cbf_pred_24mon.img'],[45,54,45],[4 4 4],1,16);
%  write_ANALYZE(tmp,['beta.img'],[45,54,45],[4 4 4],1,16);
