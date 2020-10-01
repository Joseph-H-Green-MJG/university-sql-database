USE university_manager_schema;

-- professor average grades --  
SELECT professors_last_name AS 'Professor', courses_name AS 'Course', AVG(grades_grade) AS 'Average Grade'
FROM grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id
JOIN professors p
ON c.courses_professors_id = p.professors_id
GROUP BY professors_last_name;

-- top grade for students -- 
SELECT students_name AS 'Student', MAX(grades_grade) AS 'Top Score'
FROM students s
JOIN grades g
ON s.students_id = g.grades_students_id
GROUP BY students_name;

-- group students by course --
SELECT courses_name AS 'Course', students_name AS 'Student'
FROM courses c
JOIN grades g
ON c.courses_id = g.grades_courses_id
JOIN students s
ON g.grades_students_id = s.students_id
GROUP BY courses_name
ORDER BY students_name ASC;

-- summary report of courses sorted by difficulty --
SELECT courses_name AS 'Course', AVG(grades_grade) AS 'Average Grade'
FROM courses c
JOIN grades g
ON c.courses_id = g.grades_id
GROUP BY c.courses_name
ORDER BY g.grades_grade ASC;

-- Find professor to student in common --
SELECT students_name AS 'student', courses_name AS 'course', professors_last_name AS 'professor', COUNT(*) AS 'classes in common'
FROM grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id
JOIN professors p
ON c.courses_professors_id = p.professors_id
JOIN students s
ON g.grades_students_id = s.students_id
GROUP BY students_name, professors_last_name
ORDER BY COUNT(*) DESC;

SELECT students_name AS 'student', professors_last_name AS 'professor', COUNT(*) AS 'classes in common'
FROM grades
JOIN students
ON grades.grades_students_id = students_id
JOIN courses c
ON c.courses_id = grades_courses_id
JOIN professors p
ON p.professors_id = c.courses_professors_id
GROUP BY professors_last_name, students_name
ORDER BY COUNT(*) DESC
LIMIT 17;