DROP SCHEMA IF EXISTS student_mgmt CASCADE;
CREATE SCHEMA IF NOT EXISTS student_mgmt;

DROP TABLE IF EXISTS student_mgmt.users;
CREATE TABLE student_mgmt.users (
    user_id TEXT PRIMARY KEY,
    password TEXT,
    first_name TEXT,
    last_name TEXT,
    created_at DATE,
    email TEXT
);

DROP TABLE IF EXISTS student_mgmt.parents;
CREATE TABLE student_mgmt.parents (
    parent_id TEXT PRIMARY KEY,
    father_first_name TEXT,
    father_last_name TEXT,
    father_email TEXT,
    father_phone TEXT,
    father_job TEXT,
    mother_first_name TEXT,
    mother_last_name TEXT,
    mother_email TEXT,
    mother_phone TEXT,
    mother_job TEXT
);

DROP TABLE IF EXISTS student_mgmt.teachers;
CREATE TABLE student_mgmt.teachers (
    teacher_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    dob DATE,
    email TEXT,
    phone TEXT,
    joined_on DATE,
    registration_id TEXT UNIQUE
);

DROP TABLE IF EXISTS student_mgmt.classes;
CREATE TABLE student_mgmt.classes (
    class_id TEXT PRIMARY KEY,
    class_teacher_id TEXT REFERENCES student_mgmt.teachers (teacher_id),
    class_year TEXT
);

DROP TABLE IF EXISTS student_mgmt.students;
CREATE TABLE student_mgmt.students (
    student_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    dob DATE,
    class_id TEXT REFERENCES student_mgmt.classes (class_id),
    roll_number TEXT,
    email TEXT,
    parent_id TEXT REFERENCES student_mgmt.parents (parent_id),
    joined_on DATE,
    registration_id TEXT UNIQUE
);

DROP TABLE IF EXISTS student_mgmt.subjects;
CREATE TABLE student_mgmt.subjects (
    subject_id TEXT PRIMARY KEY,
    name TEXT,
    class_year TEXT,
    head_teacher_id TEXT REFERENCES student_mgmt.teachers (teacher_id)
);

DROP TABLE IF EXISTS student_mgmt.subject_assignments;
CREATE TABLE student_mgmt.subject_assignments (
    assignment_id SERIAL PRIMARY KEY,
    subject_id TEXT REFERENCES student_mgmt.subjects (subject_id),
    teacher_id TEXT REFERENCES student_mgmt.teachers (teacher_id),
    class_id TEXT REFERENCES student_mgmt.classes (class_id)
);
