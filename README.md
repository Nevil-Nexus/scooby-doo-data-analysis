# 🐾 Scooby-Doo! — Data Analysis with R

## 📌 Project Overview

This project explores the Scooby-Doo dataset using **R** and data analysis techniques.

The goal is to investigate IMDb ratings, episode durations, television formats, and broadcasting networks to better understand how Scooby-Doo productions have evolved over time.

Through data manipulation, visualization, and statistical analysis, this project explores whether IMDb ratings differ significantly between broadcasting networks.

## 🎯 Objectives

- Explore and understand the structure of the Scooby-Doo dataset.
- Calculate average episode durations and IMDb ratings.
- Analyze the different production formats.
- Visualize IMDb ratings over time.
- Compare ratings across broadcasting networks.
- Investigate whether certain networks have significantly different IMDb ratings.

## 🛠️ Technologies & Libraries

- **R** – Programming language for statistical computing.
- **Tidyverse** – Data manipulation and visualization.
- **Dplyr** – Data filtering, grouping, and summarization.
- **Ggplot2** – Data visualization.
- **Readr** – Dataset importation.

## 📊 Analysis Process

### 1. Data Importation and Exploration
- Import the Scooby-Doo CSV dataset.
- Handle missing values.
- Examine the dataset structure, dimensions, and variable types.

### 2. Exploratory Data Analysis (EDA)
- Calculate the average episode duration.
- Examine IMDb ratings.
- Explore the distribution of production formats.
- Visualize ratings according to release dates.

### 3. Data Cleaning and Transformation
- Remove crossovers and movie productions.
- Group segmented TV episodes by their original air date.
- Calculate average IMDb ratings and total runtime for segmented episodes.
- Combine segmented and non-segmented episodes into a unified dataset.

### 4. Data Visualization
Using ggplot2, the project includes visualizations to explore:
- IMDb ratings over time.
- Ratings by broadcasting network.
- Average IMDb ratings for each network.

### 5. Statistical Analysis

An **ANOVA (Analysis of Variance)** test is performed to investigate whether IMDb ratings differ significantly between broadcasting networks.

A **Tukey HSD post-hoc test** is also used to identify which networks have statistically significant differences in their average ratings.

## 📁 Project Structure

```text
Scooby-Doo-Data-Analysis/
│
├── Script.R
├── scoobydoo.csv
└── README.md
```

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:
- [R](https://cran.r-project.org/)
- [RStudio](https://posit.co/download/rstudio-desktop/)

### Installation

1. Clone this repository:

```bash
git clone https://github.com/YOUR-USERNAME/Scooby-Doo-Data-Analysis.git
```

2. Navigate to the project directory.

3. Install the required R package:

```r
install.packages("tidyverse")
```

4. Make sure `scoobydoo.csv` is located in the project directory.

5. Open `Script.R` in RStudio and run the script.

## 📈 Key Learning Outcomes

This project provides practical experience with:

- Data cleaning and preprocessing.
- Exploratory Data Analysis (EDA).
- Data aggregation and transformation.
- Statistical hypothesis testing.
- ANOVA and Tukey HSD.
- Data visualization with ggplot2.

## 👨‍💻 Author

**Nevil Nexus**

Student in Data Science | Interested in Data Analytics, Statistics, and Programming.

---

*This project was developed as part of my journey into data science and statistical analysis.*
