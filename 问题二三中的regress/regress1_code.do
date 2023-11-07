import excel "D:\桌面面\导入stata用的表格.xlsx",sheet("sheet1")firstrow
regress 乙醇转化率 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度
regress 乙醇转化率 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度,beta
estat imtest,white
regress 乙醇转化率 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度,robust
estat vif
regress C4烯烃选择性 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度
regress C4烯烃选择性 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度,beta
estat imtest,white
regress C4烯烃选择性 装料方式 Co负载量wt CoSiO2质量 装料比 乙醇浓度 温度,robust
estat vif
