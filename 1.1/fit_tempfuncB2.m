%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: D:\2021国赛\CUMCM2021Probelms\B\附件1.xlsx
%    工作表: 性能数据表
%
% 由 MATLAB 于 2021-09-10 13:35:46 自动生成

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 6);

% 指定工作表和范围
opts.Sheet = "性能数据表";
opts.DataRange = "A81:F85";

% 指定列名称和类型
opts.VariableNames = ["Var1", "Var2", "temp", "yichun", "Var5", "C4"];
opts.SelectedVariableNames = ["temp", "yichun", "C4"];
opts.VariableTypes = ["char", "char", "double", "double", "char", "double"];

% 指定变量属性
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "EmptyFieldRule", "auto");

% 导入数据
B2 = readtable("D:\2021国赛\CUMCM2021Probelms\B\附件1.xlsx", opts, "UseExcel", false);


%% 清除临时变量
clear opts
%%
B2 = table2array(B2);
B2temp = B2(:,1);
B2yichun = B2(:,2);
B2c4 = B2(:,3);
%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'B2temp-乙醇'.
[xData, yData] = prepareCurveData( B2temp, B2yichun );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.0313824103244615 0.0180449921036743];

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'B2temp-乙醇' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'B2yichun vs. B2temp', 'B2temp-乙醇', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( '乙醇转化率', 'Interpreter', 'none' );
xlim([225,425]);
set(gca,'XTick',[225:25:425]);
%% Fit: 'B2temp-c4'.
[xData, yData] = prepareCurveData( B2temp, B2c4 );

% Set up fittype and options.
ft = fittype( 'fourier1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0 0 0 0.0418879020478639];

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'B2temp-c4' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'B2c4 vs. B2temp', 'B2temp-c4', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( 'C4烯烃选择性', 'Interpreter', 'none' );
xlim([225,425]);
set(gca,'XTick',[225:25:425]);
%% 提取评价指标
critic = cell2mat(struct2cell(gof))';