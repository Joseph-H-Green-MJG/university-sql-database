USE university_manager_schema;

BEGIN;

-- Insert into professors --
INSERT INTO professors(professors_last_name)
VALUE("professors_name");

-- Insert into students --
INSERT INTO students(students_name)
VALUE("students_name");

-- Insert into courses --
INSERT INTO courses(courses_name, courses_professors_id)
VALUE("courses_name", RAND()*17);

-- inster student course and the grade they got for that course --
INSERT INTO grades(grades_students_id, grades_courses_id, grades_grade)
VALUE(12,RAND()*17,RAND()*100);
INSERT INTO grades(grades_students_id, grades_courses_id, grades_grade)
VALUE(12,RAND()*17,RAND()*100);
INSERT INTO grades(grades_students_id, grades_courses_id, grades_grade)
VALUE(12,RAND()*17,RAND()*100);
INSERT INTO grades(grades_students_id, grades_courses_id, grades_grade)
VALUE(12,RAND()*17,RAND()*100);
INSERT INTO grades(grades_students_id, grades_courses_id, grades_grade)
VALUE(12,RAND()*17,RAND()*100);


ROLLBACK;

-- run if student ended up with the same class twice
UPDATE grades
SET grades_courses_id = RAND()*17
WHERE grades_id = 1;