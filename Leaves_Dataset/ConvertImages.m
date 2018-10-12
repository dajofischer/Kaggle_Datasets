function xy=ConvertImages(filename)
%CONVERTIMAGES Summary of this function goes here
%   Detailed explanation goes here
a=imread(filename);
a=a>(255/2);

i=0;

b=double(a);
c=cumsum(sum(b,1));
c=c./max(c);
[~,d]=min(abs(c-0.5));
c=cumsum(sum(b,2));
c=c./max(c);
[~,e]=min(abs(c-0.5));

center=[e d];

A=find(a>a(:,[1 1:end-1]));

xy=[];

while size(xy)<200
    i=i+1;
    try
    [I,J] = ind2sub(size(a),A(i));
xy=bwtraceboundary(a,[I,J],'n');
    end
end




end

