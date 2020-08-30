-- Challenge Deliverable 1

SELECT e.emp_no, e.first_name, e.last_name,t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as t
on e.emp_no = t.emp_no
WHERE (e.birth_date Between '1952-1-1' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
--INTO mentorship_eligibilty.csv
FROM employees as e 
LEFT Join dept_emp as de 
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date Between '1965-1-1' AND '1965-12-31')
ORDER BY emp_no ASC;