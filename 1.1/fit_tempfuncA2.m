%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 6);

% 指定工作表和范围
opts.Sheet = "性能数据表";
opts.DataRange = "A7:F11";

% 指定列名称和类型
opts.VariableNames = ["Var1", "Var2", "temp", "yichun", "Var5", "C4"];
opts.SelectedVariableNames = ["temp", "yichun", "C4"];
opts.VariableTypes = ["char", "char", "double", "double", "char", "double"];

% 指定变量属性
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "EmptyFieldRule", "auto");

% 导入数据
A2 = readtable("D:\2021国赛\CUMCM2021Probelms\B\附件1.xlsx", opts, "UseExcel", false);


%% 清除临时变量
clear opts
%%
A2array = table2array(A2);
A2temp = A2array(:,1);
A2yichun = A2array(:,2);
A2c4 = A2array(:,3);
%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'A2temp-乙醇'.
[xData, yData] = prepareCurveData( A2temp, A2yichun );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'A2temp-乙醇' );
h = plot( fitresult{1}, xData, yData );
%legend( h, 'A2yichun vs. A2temp', 'A2temp-乙醇', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( '乙醇转化率', 'Interpreter', 'none' );
xlim([225,375]);
set(gca,'XTick',[225:25:375]);
%% Fit: 'A2temp-c4'.
[xData, yData] = prepareCurveData( A2temp, A2c4 );

% Set up fittype and options.
ft = fittype( 'fourier1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0.0628318530717959];

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'A2temp-c4' );
h = plot( fitresult{2}, xData, yData );
%legend( h, 'A2c4 vs. A2temp', 'A2temp-c4', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( 'C4烯烃选择性', 'Interpreter', 'none' );
xlim([225,375]);
set(gca,'XTick',[225:25:375]);
%% 提取评价指标
critic = cell2mat(struct2cell(gof))';