function [a,b,at,a1] = Match2Leafs(a1,a2,plotit)
%MATCH2LEAFS Summary of this function goes here


    a1=a1./mean(mean(a1));
    center=[sum(a1(:,1).*a1(:,2))./sum(a1(:,2)) sum(a1(:,1).*a1(:,2))./sum(a1(:,1))];
    a1=[a1(:,1)-center(1) a1(:,2)-center(2)];
    
    a2=a2./mean(mean(a2));
    center=[sum(a2(:,1).*a2(:,2))./sum(a2(:,2)) sum(a2(:,1).*a2(:,2))./sum(a2(:,1))];
    a2=[a2(:,1)-center(1) a2(:,2)-center(2)];
    
    M=zeros(360,1);

    for theta=1:360
    R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
    temp=a2*R;
    
    %M(theta)=sqrt(sum(((temp(:,1)-temp(:,2))-(a1(:,1)-a1(:,2))).^2)./size(temp,1));
    [a,b]=min(sum([abs(temp(1,1)-a1(:,1)) abs(temp(1,2)-a1(:,2))],2));
    temp=[temp(size(temp,1)-b:end,:);temp(1:size(temp,1)-b-1,:)];
     
    M(theta)=sum(abs(a1(:,1)-temp(:,1))+abs(a1(:,2)-temp(:,2)));
    %M(theta)=sqrt(sum((a1(:,1)-temp(:,1)).^2+(a1(:,2)-temp(:,2)).^2)./size(temp,1));
    %M(theta)=sqrt(sum(sum([(temp(:,1)-a1(:,1)).^2 (temp(:,2)-a1(:,2))],2))./size(temp,1));
    %clf;
    %plot(a1(:,1),a1(:,2),temp(:,1),temp(:,2))
    %title(num2str(M(theta)));
    %pause(0.1)
    end

    [a,b]=min(M);
    R = [cosd(b) -sind(b); sind(b) cosd(b)];
    at=a2*R;
    
    if nargin>2
        if plotit==1
            plot(a1(:,1),a1(:,2),at(:,1),at(:,2))
        end
    end
    
end

