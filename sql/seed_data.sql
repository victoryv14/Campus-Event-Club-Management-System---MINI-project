SET DEFINE OFF;

-- ==============================
-- 1. ADMIN
-- ==============================
INSERT INTO ADMIN (admin_id, full_name, email, role)
VALUES (1, 'Dr. Anil Kumar', 'anil.kumar@college.edu', 'Senior Admin');

INSERT INTO ADMIN (admin_id, full_name, email, role)
VALUES (2, 'Prof. Maya Singh', 'maya.singh@college.edu', 'Junior Admin');

-- ==============================
-- 2. STUDENT
-- ==============================
INSERT INTO STUDENT (student_id, roll_number, full_name, email, department, year_of_study, phone_number)
VALUES (101, '25B11CS623', 'Muppanaboina Vamsi Kalyan', 'vamsi.kalyan@student.edu', 'CS', 3, '9876543210');

INSERT INTO STUDENT (student_id, roll_number, full_name, email, department, year_of_study, phone_number)
VALUES (102, '25B11CS718', 'Pasala Harini', 'harini.pasala@student.edu', 'IT', 2, '9876501234');

INSERT INTO STUDENT (student_id, roll_number, full_name, email, department, year_of_study, phone_number)
VALUES (103, '25B11CS517', 'Laveti Roshini', 'roshini.laveti@student.edu', 'ME', 3, '9876514567');

INSERT INTO STUDENT (student_id, roll_number, full_name, email, department, year_of_study, phone_number)
VALUES (104, '25B11CS700', 'Palivela Praharsha Sai Charan', 'praharsha@student.edu', 'CE', 4, '9876527890');

-- ==============================
-- 3. VENUE
-- ==============================
INSERT INTO VENUE (venue_id, venue_name, building, room_number, capacity, has_projector, is_active)
VALUES (1, 'Auditorium Hall', 'Main Building', 'A101', 250, 'Y', 'Y');

INSERT INTO VENUE (venue_id, venue_name, building, room_number, capacity, has_projector, is_active)
VALUES (2, 'Lab Room 302', 'Computer Lab', '302', 40, 'N', 'Y');

-- ==============================
-- 4. CLUB
-- ==============================
INSERT INTO CLUB (club_id, club_name, category, description, established_date, created_by_admin_id)
VALUES (1, 'Literary Club', 'Culture', 'Promotes reading and writing', TO_DATE('2025-01-10', 'YYYY-MM-DD'), 1);

INSERT INTO CLUB (club_id, club_name, category, description, established_date, created_by_admin_id)
VALUES (2, 'Coding Club', 'Tech', 'Programming contests and workshops', TO_DATE('2025-02-15', 'YYYY-MM-DD'), 2);

-- ==============================
-- 5. MEMBERSHIP
-- ==============================
INSERT INTO MEMBERSHIP (membership_id, student_id, club_id, role, join_date, status)
VALUES (10, 101, 1, 'President', TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'ACTIVE');

INSERT INTO MEMBERSHIP (membership_id, student_id, club_id, role, join_date, status)
VALUES (11, 102, 2, 'Member', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'ACTIVE');

INSERT INTO MEMBERSHIP (membership_id, student_id, club_id, role, join_date, status)
VALUES (12, 104, 2, 'Secretary', TO_DATE('2025-07-20', 'YYYY-MM-DD'), 'ACTIVE');

-- ==============================
-- 6. EVENT
-- ==============================
INSERT INTO EVENT (event_id, event_title, description, event_date, start_time, end_time, max_seats,
                   status, club_id, venue_id, approved_by_admin_id)
VALUES (101, 'Freshers'' Meet', 'Welcome event for new students',
        TO_DATE('2026-10-15', 'YYYY-MM-DD'),
        TO_TIMESTAMP('2026-10-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2026-10-15 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        200, 'Upcoming', 1, 1, 1);

INSERT INTO EVENT (event_id, event_title, description, event_date, start_time, end_time, max_seats,
                   status, club_id, venue_id, approved_by_admin_id)
VALUES (102, 'Hackathon 2026', '24-hour coding marathon',
        TO_DATE('2026-11-05', 'YYYY-MM-DD'),
        TO_TIMESTAMP('2026-11-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2026-11-06 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        50, 'Planned', 2, 2, 2);

-- ==============================
-- 7. REGISTRATION
-- ==============================
INSERT INTO REGISTRATION (registration_id, student_id, event_id, registration_date, attendance_status, feedback_rating)
VALUES (1001, 101, 101, TO_TIMESTAMP('2026-10-01 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Present', 4);

INSERT INTO REGISTRATION (registration_id, student_id, event_id, registration_date, attendance_status, feedback_rating)
VALUES (1002, 102, 101, TO_TIMESTAMP('2026-10-02 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Absent', NULL);

INSERT INTO REGISTRATION (registration_id, student_id, event_id, registration_date, attendance_status, feedback_rating)
VALUES (1003, 103, 102, TO_TIMESTAMP('2026-10-10 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Present', 5);

COMMIT;
