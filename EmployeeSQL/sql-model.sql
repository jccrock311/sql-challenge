-- creating tables from CSVs

CREATE TABLE "employee" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(20) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    PRIMARY KEY ("emp_no")
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(20) NOT NULL,
    "title" VARCHAR(40) NOT NULL,
    PRIMARY KEY ("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    PRIMARY KEY ("emp_no","salary")
);

CREATE TABLE "department" (
    "dept_no" VARCHAR(30) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(30) NOT NULL,
    PRIMARY KEY ("emp_no","dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30) NOT NULL,
    "emp_no" INT  NOT NULL,
    PRIMARY KEY ("dept_no","emp_no")
);

ALTER TABLE "employee" ADD CONSTRAINT "foreign_employee_title"
FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "foreign_salaries_emp_no"
FOREIGN KEY("emp_no") REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_dept_emp_no"
FOREIGN KEY("emp_no") REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "foreign_dept_dept_no"
FOREIGN KEY("dept_no") REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_manager_dept_no"
FOREIGN KEY("dept_no") REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "foreign_manager_emp_no"
FOREIGN KEY("emp_no") REFERENCES "employee" ("emp_no");