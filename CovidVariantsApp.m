% Covid Variants Group Project
% Matthew Eleazar & Jake Kalman

%% Clear Workspace
%   clear all
   clc
%% Load DataSet

covid = readtable('covid-variants-north-america.xlsx');
cases = readtable('COVID-19_Cases_US.xlsx');

%% Alpha Variant Canada
xAlphaCan = covid{2:45,2};
yAlphaCan = covid{2:45,4};

figure(1)
bar(xAlphaCan,yAlphaCan)
title("Alpha Variant Canada")
xlabel("Time")
ylabel("Cases in Thousands")

%% Alpha Variant Mexico
xAlphaMex = covid{46:90,2};
yAlphaMex = covid{46:90,4};

figure(2)
bar(xAlphaMex,yAlphaMex)
title("Alpha Variant Mexico")
xlabel("Time")
ylabel("Cases in Thousands")

%% Alpha Variant United States
xAlphaUS = covid{91:135,2};
yAlphaUS = covid{91:135,4};

figure(3)
bar(xAlphaUS,yAlphaUS)
title("Alpha Variant United States")
xlabel("Time")
ylabel("Cases in Thousands")

%% Delta Variant Canada
xDeltaCan = covid{1476:1519,2};
yDeltaCan = covid{1476:1519,4};

figure(4)
bar(xDeltaCan,yDeltaCan)
title("Delta Variant Canada")
xlabel("Time")
ylabel("Cases in Thousands")

%% Delta Variant Mexico
xDeltaMex = covid{1520:1564,2};
yDeltaMex = covid{1520:1564,4};

figure(5)
bar(xDeltaMex,yDeltaMex)
title("Delta Variant Mexico")
xlabel("Time")
ylabel("Cases in Thousands")

%% Delta Variant United States
xDeltaUS = covid{1565:1609,2};
yDeltaUS = covid{1565:1609,4};

figure(6)
bar(xDeltaUS,yDeltaUS)
title("Delta Variant United States")
xlabel("Time")
ylabel("Cases in Thousands")

%% Omicron Variant Canada
xOmiCan = covid{2682:2725,2};
yOmiCan = covid{2682:2725,4};

figure(7)
bar(xOmiCan,yOmiCan)
title("Omicron Variant Canada")
xlabel("Time")
ylabel("Cases in Thousands")

%% Omicron Variant Mexico
xOmiMex = covid{2726:2770,2};
yOmiMex = covid{2726:2770,4};

figure(8)
bar(xOmiMex,yOmiMex)
title("Omicron Variant Mexico")
xlabel("Time")
ylabel("Cases in Thousands")

%% Omicron Variant United States
xOmiUS = covid{2771:2815,2};
yOmiUS = covid{2771:2815,4};

figure(9)
bar(xOmiUS,yOmiUS)
title("Omicron Variant United States")
xlabel("Time")
ylabel("Cases in Thousands")
%% Pie Chart
% Alpha
CanPieAlpha = sum(yAlphaCan);
MexPieAlpha = sum(yAlphaMex);
USPieAlpha = sum(yAlphaUS);
% Delta
CanPieDelta = sum(yDeltaCan);
MexPieDelta = sum(yDeltaMex);
USPieDelta = sum(yDeltaUS);
% Omicron 
CanPieOmi = sum(yOmiCan);
MexPieOmi = sum(yOmiMex);
USPieOmi = sum(yOmiUS);
%% Pie Countries (UNRESOLVED)
% Canada
% CanCases = CanPieAlpha + CanPieDelta + CanPieOmi 
% CanPercAlpha = (CanPieAlpha/CanCases)*100
% CanPercDelta = (CanPieDelta/CanCases)*100
% CanPercOmi = (CanPieOmi/CanCases)*100


Canada = [CanPieAlpha,CanPieDelta,CanPieOmi]
figure(10)
title('Canada')
labels = {'Alpha','Delta','Omicron'};
CAN = pie(Canada);
%
T = CAN(strcmpi(get(CAN,'Type'),'text'));
P = cell2mat(get(T,'Position'));
set(T,{'Position'},num2cell(P*0.4,2))
text(P(:,1),P(:,2),labels(:))



% Mexico
Mexico = [MexPieAlpha,MexPieDelta,MexPieOmi]
figure(11)
title('Mexico')
labels1 = {'Alpha','Delta','Omicron'};
MEX = pie(Mexico);
%
T1 = MEX(strcmpi(get(MEX,'Type'),'text'));
P1 = cell2mat(get(T1,'Position'));
set(T1,{'Position'},num2cell(P1*0.4,2))
text(P1(:,1),P1(:,2),labels1(:))



% United States
US = [USPieAlpha,USPieDelta,USPieOmi]
figure(12)
title('United States')
labels2 = {'Alpha','Delta','Omicron'};
USA = pie(US);
%
T2 = USA(strcmpi(get(USA,'Type'),'text'));
P2 = cell2mat(get(T2,'Position'));
set(T2,{'Position'},num2cell(P2*0.4,2))
text(P2(:,1),P2(:,2),labels2(:))

%% Line Graph
% Super Total Total Cases
yAlphaCan1 = covid{2:45,6};
yAlphaMex1 = covid{46:90,6};
yAlphaUS1 = covid{91:135,6};
yDeltaCan1 = covid{1476:1519,6};
yDeltaMex1 = covid{1520:1564,6};
yDeltaUS1 = covid{1565:1609,6};
yOmiCan1 = covid{2682:2725,6};
yOmiMex1 = covid{2726:2770,6};
yOmiUS1 = covid{2771:2815,6};

figure (13)
plot(xAlphaCan, yAlphaCan1,'r-',xAlphaMex,yAlphaMex1,'g-',xAlphaUS,yAlphaUS1,'b-')
title('North American Total Covid Cases')
xlabel("Time")
ylabel("Number of Cases (in Thousands)")
legend('Canada','Mexico','United States','Location','northwest')

%% Map For Loop
figure(14)
% Due to the overwhelming amount of data, only confirmed Covid cases from Indiana, Texas,
% California, and New York will be displayed. 

% % Indiana
% for irow = 709:800
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end

% % Texas
% for irow = 2635:2889
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end
% 

% % California
% for irow = 189:247
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end

% New York
for irow = 1855:1910
    lat = cases{irow,7};
    long = cases{irow,8};
    geoscatter(lat,long) 
    hold on
end


legend(' cases < 100', '100< cases <1000', '1000< cases <10000', 'cases > 10000' )

%% Massachusetts Pie Deaths by County

figure(15)
title("Massachusetts Deaths by County")
MassCounty = cases{1234:1246,13}
MassDeaths = cases{1234:1246,11}
MASS = pie(MassDeaths)
%
T3 = MASS(strcmpi(get(MASS,'Type'),'text'));
P3 = cell2mat(get(T3,'Position'));
set(T3,{'Position'},num2cell(P3*0.6,2))
text(P3(:,1),P3(:,2),MassCounty(:))


%% New Map

% myImage = imread('as.jpg');
% set(handles.axes7,'Units','pixels');
% resizePos = get(handles.axes7,'Position');
% myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
% axes(handles.axes7);
% imshow(myImage);
% set(handles.axes7,'Units','normalized');
figure(16)
ind = imread('indiana.png');
imshow(ind);
figure(17)
tex = imread('texas.png');
imshow(tex);
figure(18)
cali = imread('california.png');
imshow(cali);
figure(19)
ny = imread('newyork.png');
imshow(ny);
