# 🎬 Netflix Data Analysis — PostgreSQL

## 📌 Project Overview

This project analyzes Netflix Movies and TV Shows using **PostgreSQL** to answer practical business questions and uncover patterns in Netflix content.

The analysis covers content types, ratings, countries, genres, release years, directors, actors, recent additions, and description-based content categorization.

## 🎯 Business Questions

This project answers questions such as:

- How many Movies and TV Shows are available on Netflix?
- What are the most common ratings for Movies and TV Shows?
- Which countries have the most Netflix content?
- Which year has the highest content activity for India?
- Which TV Shows have more than 5 seasons?
- Which genres contain the most content?
- Which Movies are documentaries?
- How much content is missing director information?
- How many Movies feature a specific actor within the last 10 years?
- Which actors appear most frequently in Indian content?
- How can content be categorized based on keywords in descriptions?

## 🛠️ Tools & Technologies

- **PostgreSQL**
- **SQL**
- **GitHub**

## 📚 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- Subqueries
- CTEs
- Window Functions
- CASE
- ILIKE
- NULL Handling
- Type Casting
- `UNNEST()`
- `STRING_TO_ARRAY()`
- `SPLIT_PART()`
- `TO_DATE()`
- `EXTRACT()`

## 📊 Dataset

The `Netflix` table contains information about Netflix content, including:

- Show ID
- Type
- Title
- Director
- Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genre
- Description

## 🔍 Analysis Performed

### 1. Movies vs TV Shows
Counted the number of Movies and TV Shows available in the dataset.

### 2. Most Common Ratings
Identified the most common rating for Movies and TV Shows using aggregation and window functions.

### 3. Content by Country
Separated multiple country values and analyzed the countries with the highest amount of Netflix content.

### 4. Content by Genre
Analyzed the number of content items associated with each genre.

### 5. Recent Content
Identified content added within the last five years using date conversion and date filtering.

### 6. Long-Running TV Shows
Identified TV Shows with more than five seasons by extracting the season count from the duration field.

### 7. Indian Content Analysis
Analyzed Netflix content associated with India and examined content patterns by year.

### 8. Documentary Movies
Identified Movies categorized as documentaries.

### 9. Missing Director Information
Identified content where director information is unavailable.

### 10. Actor Analysis
Analyzed appearances of specific actors and identified the top actors appearing in Indian content.

### 11. Description-Based Categorization
Used `CASE` and `ILIKE` to categorize content based on keywords such as `"kill"` and `"violence"` found in descriptions.

## 💡 Key SQL Techniques

The project demonstrates practical handling of columns containing multiple values.

For example, country, cast, and genre fields can contain multiple comma-separated values. PostgreSQL functions such as `STRING_TO_ARRAY()` and `UNNEST()` were used to separate these values before analysis.

Window functions were also used to rank grouped results, such as finding the most common rating for each content type.

## 📂 Project Structure

```text
netflix-data-analysis-sql/
│
├── Netflix_Data_Analysis.sql
├── netflix_titles.csv
└── README.md
```

## 🚀 How to Run

1. Clone or download this repository.
2. Open the SQL file in **PostgreSQL / pgAdmin**.
3. Create the `Netflix` table using the table definition provided in the SQL file.
4. Load the Netflix dataset into the table.
5. Run the analysis queries to reproduce the results.

## 🎓 Project Objective

The purpose of this project is to demonstrate practical SQL skills by applying PostgreSQL to a real-world-style dataset and solving business-oriented analytical questions.

The project focuses on using SQL not only to retrieve data, but also to transform, analyze, and interpret information to answer meaningful business questions.

## 👤 Author

**Ajay Katari**

Data Analyst | SQL | Excel | Python | Power BI
