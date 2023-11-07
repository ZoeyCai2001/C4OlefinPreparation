import excel "D:\桌面面\导入stata用的表格.xlsx",sheet("sheet1")firstrow
gen  c4烯烃收率= 乙醇转化率* C4烯烃选择性
gen  乙醇浓度与09距离的平方= (乙醇浓度-0.9)* (乙醇浓度-0.9)
gen  乙醇浓度与09距离= abs(乙醇浓度-0.9)
gen  装料比与1的距离= abs(装料比-1)
gen  装料比与1的距离的平方= (装料比-1)*(装料比-1)
gen  co负载量与2的距离的平方= ( Co负载量wt-2)*( Co负载量wt-2)
gen  co负载量与2的距离= abs( Co负载量wt-2)
gen  总质量=CoSiO2质量*(1+ 装料比)

regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度,beta
estat imtest,white
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度,robust

regress  c4烯烃收率  co负载量与2的距离的平方  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度
regress  c4烯烃收率  co负载量与2的距离的平方  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度,beta
estat imtest,white
regress  c4烯烃收率  co负载量与2的距离的平方  总质量 装料比与1的距离 乙醇浓度与09距离的平方  温度,robust

regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离  温度
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离  温度,beta
estat imtest,white
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离 乙醇浓度与09距离  温度,robust

regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离的平方 乙醇浓度与09距离  温度
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离的平方 乙醇浓度与09距离  温度,beta
estat imtest,white
regress  c4烯烃收率  co负载量与2的距离  总质量 装料比与1的距离的平方 乙醇浓度与09距离  温度,robust
