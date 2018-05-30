%load workspace
%load mnist;
 
%compare against values 0-9
N = 10000;
I = find(labels < 5);%10
digits = digits(:, I);
labels = labels(I);
[m,N] = size(digits);
 
%randomly generate K=5 clusters
K = 10; %10
%creates matrix of 784 by K
Z = rand(784, K);


for a=1:5,%change
index=zeros(N,1);
for i=1:N, %i=1:N
    image = digits(:,i);
    d1=norm(image-Z(:,1));
    d2=norm(image-Z(:,2));
    d3=norm(image-Z(:,3));
    d4=norm(image-Z(:,4));
    d5=norm(image-Z(:,5));
  if (d1<=d2&&d1<=d3&&d1<=d4&&d1<=d5)
      index(i)=1;
  elseif (d2<=d1&&d2<=d3&&d2<=d4&&d2<=d5)
      index(i)=2;
  elseif (d3<=d1&&d3<=d2&&d3<=d4&&d3<=d5)
      index(i)=3;
  elseif (d4<=d1&&d4<=d2&&d4<=d3&&d4<=d5)
      index(i)=4;
  else
      index(i)=5;
  end 
 
end

for i=1:K,
    vectorSum=0;
    count=0;
 for j=1:N,
     if(index(j)==i)
         vectorSum=vectorSum+digits(:,j);
         count=count+1;
     end  
 end
 Z(:,i)=(vectorSum/count);
    
end
end
  

figure();
subplot(1,5,1);
X = reshape(Z(:,1),28,28);
imshow(1-X);
subplot(1,5,2);
X = reshape(Z(:,2),28,28);
imshow(1-X);
subplot(1,5,3);
X = reshape(Z(:,3),28,28);
imshow(1-X);
subplot(1,5,4);
X = reshape(Z(:,4),28,28);
imshow(1-X);
subplot(1,5,5);
X = reshape(Z(:,5),28,28);
imshow(1-X);

