# CUMCM
Explored the influence of catalyst and temperature on products based on groups of experiments. 

### Abstract

Starting from ethanol to produce C4 olefins is an effective alternative to traditional fossil energy sources. However, the wide variety and distribution of products during the conversion process lead to low ethanol conversion rates and C4 olefin selectivity. In response, a Co/SiO2-HAP catalyst was designed for catalyzing the coupling of ethanol to produce C4 olefins. This study utilizes reasonable numerical values for catalyst combinations, temperature, ethanol conversion rate, C4 olefin selectivity, and C4 olefin yield to establish statistical regression models. The analysis of the impact of catalyst combinations and temperature on experimental results has valuable implications for exploring C4 olefin preparation process conditions.

#### Problem 1:
- Identified relationships between ethanol conversion rates, C4 olefin selectivity, and temperature within each catalyst combination.
- Used MATLAB's Curve Fitting toolbox to fit data with linear, exponential, polynomial, and Fourier functions.
- Performed time series analysis for each experiment to identify the optimal time for maximizing product yield.
- Findings: Ethanol conversion rates increase monotonically with reaction temperature, and C4 olefin selectivity generally rises with temperature, with occasional peak-and-fall phenomena.

#### Problem 2:
- Analyzed six influencing factors for ethanol conversion rates and C4 olefin selectivity based on Attachment 1 data.
- Conducted qualitative analysis through line charts, considering the control variable principle.
- Established multivariate linear regression models for catalyst combinations, temperature, ethanol conversion rates, and C4 olefin selectivity.
- Utilized robust standard errors to address heteroscedasticity issues, resulting in VIFmax=1.39 and low inter-variable correlation.
- Conclusions: 
  - Ethanol conversion rates are positively influenced by catalyst mass and temperature and negatively influenced by ethanol concentration.
  - For C4 olefin selectivity, Type A loading is more effective, and positive effects are observed with ethanol concentration, catalyst mass, and temperature.

#### Problem 3:
- Conducted qualitative analysis using bar charts for variable analysis.
- Preprocessed independent variables, introduced nonlinear variables, and established a nonlinear regression model for C4 olefin yield.
- Utilized robust standard errors to address heteroscedasticity.
- Conclusions: 
  - To maximize C4 olefin yield, use Type A loading, Co/SiO2 mass of 200mg, HAP blend ratio of 1:1, Co loading of 2wt%, ethanol concentration of 0.9ml/min, and reaction temperature of 400°C.
  - If the temperature requirement is below 350°C, use Type A loading, Co/SiO2 mass of 200mg, HAP blend ratio of 1:1, Co loading of 1wt%, and reaction temperature of 350°C.

#### Problem 4:
- Applied a "local search" approach to design parameters for five new experiments, using C4 olefin yield as the criterion.
- Set parameters for loading type, Co/SiO2 mass, ethanol concentration, and temperature based on optimal values from Problem 3 and adjusted two insignificant variables.
- **Built a dynamic experiment design pipeline based on A/B testing to address the problem in Problem 4:**
  - Utilized the A/B testing methodology to iteratively refine experimental parameters for optimal C4 olefin yield.
  - Adjusted loading type, Co/SiO2 mass, ethanol concentration, and temperature based on real-time feedback from previous experiments.
  - Optimized the experimental pipeline to converge quickly towards the most favorable conditions for C4 olefin yield.

- Adopting these approaches near the optimal values already obtained is beneficial for further improvement in C4 olefin yield with fewer experimental iterations.

### Interpretation Model based on LASSO and Ridge Regression:

To enhance the interpretability and robustness of our regression models, we further built interpretation models based on LASSO (Least Absolute Shrinkage and Selection Operator) and Ridge regression techniques. These regularization methods help mitigate multicollinearity and select essential features.

#### LASSO and Ridge Analysis:
- Applied LASSO and Ridge regression to the established linear and nonlinear regression models.
- Evaluated the impact of regularization on feature selection and coefficient shrinkage.
- Analyzed the resulting models to identify significant predictors for each response variable.
