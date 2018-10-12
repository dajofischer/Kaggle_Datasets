function [data,worder,wmedi] = Housetranform(data,istrain,worder)
%HOUSETRANFORM Summary of this function goes here
%   Detailed explanation goes here
% isc=zeros(size(data,2),2);

if istrain==1
   salep= log(cell2mat(table2cell(data(:,81))));
   wmedi=median(salep);
   worder=cell(size(data,2),1);
end

%dataout=zeros(size(data));

% %wtrans=[4 5 27 35 38 39 44 45 47 55 63 67 68 81];
 A=cellfun(@isnumeric,table2cell(data));
 wtrans=sum(A)>0;
 %wtrans(1)=0;
 for i=1:size(data,2)
     subplot(9,9,i)
%     A=cellfun(@isnumeric,table2cell(data(:,i)));
    if wtrans(i)==1
        
        temp=cell2mat(table2cell(data(:,i)));
        A=isnan(temp)|temp==0|isinf(temp);
        temp(A)=1; 
        temp=log(temp); 
        temp=temp-median(temp);
        data(:,i)=cell2table(num2cell(temp));
        wcol='b';
    else
        %wh=[wh,i];
         temp=table2cell(data(:,i));
         [au,bu,temp]=unique(temp);
%         
%         if istrain==1
%         for j=1:length(au)
%             A=cu==j;
%             au(j,2)={median(salep(A))};
%         end
%         worder{i}=au;
%         end
%         
%         for j=1:size(worder{i},1)
%             A=strcmp(worder{i}{j,1},temp);
%             temp(A)=au(j,2);
%         end
%         A=cellfun(@isnumeric,temp)==0;
%         temp(A)={wmedi};
%         temp=cell2mat(temp)-wmedi;
%         
%         %t(:,i)=num2cell(cu);
         wcol='r';
    end
    
%     if isc(i)==1
%     A=isnan(temp)|temp==0|isinf(temp);
%    
%     %if sum(i==wtrans)>0
%        
%        
%        temp(A)=1; 
%        temp=log(temp); 
%        %if i==81
%        %   wtrans= median(temp);
%        %end
%        %temp=temp-median(temp);
%        
%     %else
%     %   temp(A)=0;  
%     % temp=temp-median(temp);
%     %end
%     [i sum(isnan(temp))]
%    
     %dataout(:,i)=temp;
%     end
%     isc(i,2)=length(unique(temp));
     %histogram(temp,'FaceColor',wcol)
     
     plot(temp,salep,'o','color',wcol)
     title([num2str(i),',',data.Properties.VariableNames{i}])
%     
% end


end

