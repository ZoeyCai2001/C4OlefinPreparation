%% 导入电子表格中的数据
% 用于从以下电子表格导入数据的脚本:
%
%    工作簿: D:\2021国赛\CUMCM2021Probelms\B\附件1.xlsx
%    工作表: 性能数据表
%
% 由 MATLAB 于 2021-09-10 10:52:08 自动生成

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 6);

% 指定工作表和范围
opts.Sheet = "性能数据表";
opts.DataRange = "A51:F55";

% 指定列名称和类型
opts.VariableNames = ["Var1", "Var2", "temp", "yichun", "Var5", "C4"];
opts.SelectedVariableNames = ["temp", "yichun", "C4"];
opts.VariableTypes = ["char", "char", "double", "double", "char", "double"];

% 指定变量属性
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var5"], "EmptyFieldRule", "auto");

% 导入数据
A10 = readtable("D:\2021国赛\CUMCM2021Probelms\B\附件1.xlsx", opts, "UseExcel", false);


%% 清除临时变量
clear opts
%%
A10array = table2array(A10);
A10temp = A10array(:,1);
A10yichun = A10array(:,2);
A10c4 = A10array(:,3);
%% Initialization.

% Initialize arrays to store fits and goodness-of-fit.
fitresult = cell( 2, 1 );
gof = struct( 'sse', cell( 2, 1 ), ...
    'rsquare', [], 'dfe', [], 'adjrsquare', [], 'rmse', [] );

%% Fit: 'A10temp-乙醇'.
[xData, yData] = prepareCurveData( A10temp, A10yichun );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[fitresult{1}, gof(1)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'A10temp-乙醇' );
h = plot( fitresult{1}, xData, yData );
legend( h, 'A10yichun vs. A10temp', 'A10temp-乙醇', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( '乙醇转化率', 'Interpreter', 'none' );
xlim([225,425]);
set(gca,'XTick',[225:25:425]);

%% Fit: 'A10temp-c4'.
[xData, yData] = prepareCurveData( A10temp, A10c4 );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[fitresult{2}, gof(2)] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'A10temp-c4' );
h = plot( fitresult{2}, xData, yData );
legend( h, 'A10c4 vs. A10temp', 'A10temp-c4', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '温度', 'Interpreter', 'none' );
ylabel( 'C4烯烃选择性', 'Interpreter', 'none' );
xlim([225,425]);
set(gca,'XTick',[225:25:425]);
%% 提取评价指标
critic = cell2mat(struct2cell(gof))';