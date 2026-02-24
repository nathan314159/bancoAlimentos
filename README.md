# Banco de Alimentos de Imbabura 
## Socioeconomic Data Management System

## Purpose

This project is a socioeconomic data collection and management system developed for the Banco de Alimentos de Imbabura (B.A.D.I.), a government-supported organization that assists low-income families.
The purpose of the system is to:

- Digitize the household survey process conducted by field employees

- Standardize data collection across provinces and cantons

- Structure beneficiary information in a relational database

- Support decision-making based on accurate and organized data

- Prepare validated data for future deployment and production use

It replaces manual or paper-based surveys with a structured digital workflow.

## Problem Statement

Before this system, the data collection process faced several challenges:

- Manual and inconsistent data collection

- Human error

- Incomplete forms

- Inconsistent formats

- Difficulty validating information

- No centralized database

- No real-time validation

- Difficulty generating reports

- Lack of data traceability

- Limited scalability

## Tech Stack

- Backend: PHP (CodeIgniter)

- Frontend: JavaScript

- Database: MySQL

- Mobile: Python (Flet)

- Version Control: Git & GitHub

## Key Features

- Dynamic household member registration (supports unlimited members)

- Hierarchical geographic selection (Province → Canton → Parish)

- Conditional survey logic

- Role-based authentication

- Data validation and integrity enforcement

- REST API integration between web and mobile

## Technical Challenges Solved

- Designed a relational schema to handle variable household sizes (1–10+ members)

- Implemented dependent dropdown logic (Province → Canton → Parish)

- Built conditional form flows based on user selections

- Developed REST API communication between web and mobile platforms

- Ensured data integrity through validation rules

## Composer Dependencies

This project uses Composer-managed dependencies, including:

- CodeIgniter 4.6.1

- PHPSpreadsheet (Excel report generation)

- Predis (Redis client)

- Symfony Components

- PHPUnit (Testing framework)

## Installation

```bash
git clone https://github.com/nathan314159/bancoAlimentos.git
cd bancoAlimentos
composer install
cp env .env
php spark key:generate
php spark migrate
php spark serve
```

## Methodology
![image alt](https://github.com/nathan314159/bancoAlimentos/blob/c0a38eb5b3efd1f07f61f5bcda81b7f42c3666de/metodologia.pptx.png)

## System Architecture
![image alt](https://github.com/nathan314159/bancoAlimentos/blob/768df928da3f0f4f14d5475d513dacebcbe304f5/arquitectura.pptx.png)
## Screenshots
![image alt](https://github.com/nathan314159/bancoAlimentos/blob/c0a38eb5b3efd1f07f61f5bcda81b7f42c3666de/celular%20badi.pptx.png)
![image alt](https://github.com/nathan314159/bancoAlimentos/blob/c0a38eb5b3efd1f07f61f5bcda81b7f42c3666de/dashboard.pptx.png
)
![image alt](https://github.com/nathan314159/bancoAlimentos/blob/c0a38eb5b3efd1f07f61f5bcda81b7f42c3666de/login.pptx.png
)

## Project Status
This project is a functional prototype designed for academic and portfolio purposes.
Future improvements may include production deployment, analytics dashboards, and performance optimization.


