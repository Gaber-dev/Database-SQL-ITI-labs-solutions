# Database Systems Lab Solutions

![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft%20sql%20server&logoColor=white)
![Database](https://img.shields.io/badge/Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

This repository contains my lab solutions and practical implementations for the Database Systems course, covering fundamental to advanced database concepts using SQL Server with teaching by Ramy Nagy.

## Table of Contents
- [Course Structure](#course-structure)
- [Lab Solutions](#lab-solutions)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Key Concepts Covered](#key-concepts-covered)
- [Usage](#usage)
- [License](#license)

## Course Structure

The course is divided into 10 days of intensive database training:

| Day | Topics Covered |
|-----|---------------|
| ① | DB Design, ERD, File vs DB systems, DB Life cycle |
| ② | DB Schema, SQL Basics, Database Creation |
| ③ | Normalization Techniques |
| ④ | Aggregate Functions, Grouping, Subqueries, EERD |
| ⑤ | DB Engine, Ranking Functions, T-SQL |
| ⑥ | DB Constraints, SQL Server DB Creation Rules |
| ⑦ | Variables, Control Flow (IF/WHILE), Functions |
| ⑧ | Views, Indexes, Merge & Pivot Tables |
| ⑨ | Stored Procedures, Triggers, XML Handling |
| ⑩ | Backup/Restore, Mirroring, Cursors, Jobs, SQL CLR |

## Lab Solutions

The repository is organized by day with corresponding solutions:
/Database-Labs
│
├── Day1-ERD/
│ ├── Entity_Relationship_Diagram.vsd
│ └── Design_Documentation.md
│
├── Day2-Schema-Mapping/
│ ├── Database_Schema.sql
│ └── Table_Creation_Queries.sql
│
├── Day3-Normalization/
│ ├── Normalization_Process.docx
│ └── Normalized_Tables.sql
│
├── ... (other day folders)
│
└── README.md

Copy

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Transact-SQL (T-SQL)
- Visual Studio (for SQL CLR)
- Database Diagram Tools (ERD/EERD)

## Setup Instructions

To run these lab solutions:

1. Install [SQL Server Developer Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
2. Install [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
3. Clone this repository:
   ```bash
   git clone https://github.com/your-username/Database-Labs.git
Open the SQL files in SSMS and execute against your local SQL Server instance

Key Concepts Covered
Database Design
Entity-Relationship Diagrams (ERD/EERD)

Database normalization (1NF to 3NF)

Schema design and mapping

SQL Programming
DDL, DML, DCL commands

Complex queries with joins and subqueries

Aggregate functions and grouping

Stored procedures and functions

Advanced Topics
Database constraints and rules

Index optimization

Transaction control

XML handling in SQL Server

Database administration (backup/restore, mirroring)

Usage
These lab solutions can be used as:

Reference for database course students

Practical examples of T-SQL implementation

Study material for SQL Server certification

Foundation for real-world database projects

License
This project is licensed under the MIT License - see the LICENSE file for details.

Copy

This README provides:

1. Clear structure matching your course days
2. Visual badges for SQL Server
3. Organized directory structure preview
4. Setup instructions for others to use your solutions
5. Comprehensive list of covered concepts
6. Professional formatting with markdown

You can enhance it further by:
- Adding screenshots of important database diagrams
- Including sample query outputs
- Adding a "How to Contribute" section
- Linking to additional learning resources
- Including your personal notes/insights for each day
