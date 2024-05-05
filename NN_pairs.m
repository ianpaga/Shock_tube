function [W_array,dWdx_array, niac,pair_i,pair_j] = NN_pairs(Y,N)
%N-pair-search function looks for nearest beighboring pairs.

global dim;
 
kappa = 2; 
niac=0; 

X = Y(dim+2:2*dim+1, :);
H = Y(end-1,:);

for i=1:N-1
   for j=i+1:N
       h = (H(i)+ H(j))/2;
       dx = X(:,i)-X(:,j);
       
       if norm(dx) <= kappa*h
          niac = niac + 1;
          pair_i(niac) = i;
          pair_j(niac) = j;
          
          [W,dWdx] = Kernel(dx,h);
          W_array(niac) = W;
          dWdx_array(:,niac) = dWdx;     
 
       end  
   end
end


end