function CovidVariantsAppFunc(app)
% Covid Variants Group Project
% Matthew Eleazar & Jake Kalman

%% Clear Workspace
%   clear all
%   clc
%% Load DataSet

covid = readtable('covid-variants-north-america.xlsx');
cases = readtable('COVID-19_Cases_US.xlsx');
% COVID-19-Cases_US.xlsx came from
% https://coronavirus-resources.esri.com/datasets/628578697fb24d8ea4c32fa0c5ae1843_0/explore?location=33.646788%2C-94.045228%2C4.00
%% Bar Graph Plotting Options
iPlotType = app.VariantandCountryDropDown.Value;
%% Pie Chart Plotting Options
iPieType = app.CountryDropDown.Value;
%% Line Graph Button Pressed
iLinePressed = app.LinePlotCheckBox.Value;
%% Map Plottng Options
iMapLocation = app.USStateDropDown.Value;
%% Plot Mass. Deaths County
iMassDeathsPressed = app.MassPlotCheckBox.Value;
%% Bar Covid Variants and Country
switch iPlotType
% Alpha Variant Canada
    case 'Alpha Variant Canada'
        xAlphaCan = covid{2:45,2};
        yAlphaCan = covid{2:45,4};

        bar(app.CovidBar,xAlphaCan,yAlphaCan)
        title(app.CovidBar,"Alpha Variant Canada")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Alpha Variant Mexico
    case 'Alpha Variant Mexico'
        xAlphaMex = covid{46:90,2};
        yAlphaMex = covid{46:90,4};

        bar(app.CovidBar,xAlphaMex,yAlphaMex)
        title(app.CovidBar,"Alpha Variant Mexico")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Alpha Variant United States
    case 'Alpha Variant United States'
        xAlphaUS = covid{91:135,2};
        yAlphaUS = covid{91:135,4};
                
        bar(app.CovidBar,xAlphaUS,yAlphaUS)
        title(app.CovidBar,"Alpha Variant United States")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Delta Variant Canada
    case 'Delta Variant Canada'
        xDeltaCan = covid{1476:1519,2};
        yDeltaCan = covid{1476:1519,4};
       
        bar(app.CovidBar,xDeltaCan,yDeltaCan)
        title(app.CovidBar,"Delta Variant Canada")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Delta Variant Mexico
    case 'Delta Variant Mexico'
        xDeltaMex = covid{1520:1564,2};
        yDeltaMex = covid{1520:1564,4};
        
        bar(app.CovidBar,xDeltaMex,yDeltaMex)
        title(app.CovidBar,"Delta Variant Mexico")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Delta Variant United States
    case 'Delta Variant United States'
        xDeltaUS = covid{1565:1609,2};
        yDeltaUS = covid{1565:1609,4};
        
        bar(app.CovidBar,xDeltaUS,yDeltaUS)
        title(app.CovidBar,"Delta Variant United States")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Omicron Variant Canada
    case 'Omicron Variant Canada'
        xOmiCan = covid{2682:2725,2};
        yOmiCan = covid{2682:2725,4};
         
        bar(app.CovidBar,xOmiCan,yOmiCan)
        title(app.CovidBar,"Omicron Variant Canada")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Omicron Variant Mexico
    case 'Omicron Variant Mexico'
        xOmiMex = covid{2726:2770,2};
        yOmiMex = covid{2726:2770,4};
        
        bar(app.CovidBar,xOmiMex,yOmiMex)
        title(app.CovidBar,"Omicron Variant Mexico")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")

% Omicron Variant United States
    case 'Omicron Variant United States'
        xOmiUS = covid{2771:2815,2};
        yOmiUS = covid{2771:2815,4};
       
        bar(app.CovidBar,xOmiUS,yOmiUS)
        title(app.CovidBar,"Omicron Variant United States")
        xlabel(app.CovidBar,"Time")
        ylabel(app.CovidBar,"Cases (in Thousands)")
end 

%% Pie Chart Country and Variants 
% Total Cases
yAlphaCan = covid{2:45,4};
yAlphaMex = covid{46:90,4};
yAlphaUS = covid{91:135,4};
yDeltaCan = covid{1476:1519,4};
yDeltaMex = covid{1520:1564,4};
yDeltaUS = covid{1565:1609,4};
yOmiCan = covid{2682:2725,4};
yOmiMex = covid{2726:2770,4};
yOmiUS = covid{2771:2815,4};
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
%% Pie Countries
switch iPieType
        % Canada
    case 'Canada'
        Canada = [CanPieAlpha,CanPieDelta,CanPieOmi];
        title(app.PieChart,'Canada')
        labels = {'Alpha','Delta','Omicron'};
        pie(app.PieChart,Canada,{'Alpha','Delta','Omicron'})
    case 'Mexico'
        % Mexico
        Mexico = [MexPieAlpha,MexPieDelta,MexPieOmi];
        title(app.PieChart,'Mexico')
        labels1 = {'Alpha','Delta','Omicron'};
        pie(app.PieChart,Mexico,labels1)
        % United States
    case 'United States'
        US = [USPieAlpha,USPieDelta,USPieOmi];
        title(app.PieChart,'United States')
        labels2 = {'Alpha','Delta','Omicron'};
        pie(app.PieChart,US,labels2)
end
%% Line Graph
% Super Total Total Cases y
yAlphaCan1 = covid{2:45,6};
yAlphaMex1 = covid{46:90,6};
yAlphaUS1 = covid{91:135,6};
yDeltaCan1 = covid{1476:1519,6};
yDeltaMex1 = covid{1520:1564,6};
yDeltaUS1 = covid{1565:1609,6};
yOmiCan1 = covid{2682:2725,6};
yOmiMex1 = covid{2726:2770,6};
yOmiUS1 = covid{2771:2815,6};
% Super Total Total Cases x
xAlphaCan = covid{2:45,2};
xAlphaMex = covid{46:90,2};
xAlphaUS = covid{91:135,2};
xDeltaCan = covid{1476:1519,2};
xDeltaMex = covid{1520:1564,2};
xDeltaUS = covid{1565:1609,2};
xOmiCan = covid{2682:2725,2};
xOmiMex = covid{2726:2770,2};
xOmiUS = covid{2771:2815,2};

if iLinePressed == 1
    plot(app.LineGraph,xAlphaCan, yAlphaCan1,'r-',xAlphaMex,yAlphaMex1,'g-',xAlphaUS,yAlphaUS1,'b-')
    title(app.LineGraph,'North American Total Covid Cases')
    xlabel(app.LineGraph,"Time")
    ylabel(app.LineGraph,"Number of Cases (in Thousands)")
    legend(app.LineGraph,'Canada','Mexico','United States','Location','northwest')
end

%% Map For Loop
% Due to the overwhelming amount of data, only confirmed Covid cases from Indiana, Texas,
% California, and New York will be displayed. 

% switch iMapLocation
%     case 'Indiana'
% % Indiana
% % for irow = 709:800
% %     lat = cases{irow,7};
% %     long = cases{irow,8};
% %     gx = geoaxes(app.USMap);
% %     geoscatter(app.USMap,lat,long)
% %     hold on
% % end
% 
% for irow = 709:800
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end
% 
% 
% hold off
%     case 'Texas'
% % Texas
% for irow = 2635:2889
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end
% hold off
% 
%     case 'California'
% % California
% for irow = 189:247
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end
% hold off
% 
%     case 'New York'
% % New York
% for irow = 1855:1910
%     lat = cases{irow,7};
%     long = cases{irow,8};
%     geoscatter(lat,long)
%     hold on
% end
% hold off
% 
% end
% 
% legend(' cases < 100', '100< cases <1000', '1000< cases <10000', 'cases > 10000' )

%% Massachusetts Pie Deaths

if iMassDeathsPressed == 1

title(app.MassPieGraph,"Massachusetts Deaths by County")
MassCounty = cases{1234:1246,13}
MassDeaths = cases{1234:1246,11}
MASS = pie(app.MassPieGraph,MassDeaths)
%
T3 = MASS(strcmpi(get(MASS,'Type'),'text'));
P3 = cell2mat(get(T3,'Position'));
set(T3,{'Position'},num2cell(P3*0.6,2))
text(app.MassPieGraph,P3(:,1),P3(:,2),MassCounty(:))

end
%% New Map

switch iMapLocation
    case 'Indiana'
ind = imread('indiana.png');
indy = imshow(ind,'InitialMagnification','fit', 'Parent', app.USMap)
    case 'Texas'
tex = imread('texas.png');
texass = imshow(tex,'InitialMagnification','fit', 'Parent', app.USMap)
    case 'California'
cali = imread('california.png');
califf = imshow(cali,'InitialMagnification','fit', 'Parent', app.USMap)
    case 'New York'
ny = imread('newyork.png');
nuuyyork = imshow(ny,'InitialMagnification','fit', 'Parent', app.USMap)
end





