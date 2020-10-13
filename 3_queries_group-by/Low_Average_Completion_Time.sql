SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration,
avg(assignments.duration) as wverage_estimated_duration
FROM students
JOIN assignment_submissions ON  students.id = assignment_submissions.student_id
JOIN assignments ON  assignment_submissions.assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration ASC;
