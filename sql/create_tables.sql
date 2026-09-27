-- ==============================
-- 1. ADMIN
-- ==============================
CREATE TABLE ADMIN (
    admin_id      NUMBER PRIMARY KEY,
    full_name     VARCHAR2(100) NOT NULL,
    email         VARCHAR2(150) UNIQUE,
    role          VARCHAR2(50),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==============================
-- 2. STUDENT
-- ==============================
CREATE TABLE STUDENT (
    student_id    NUMBER PRIMARY KEY,
    roll_number   VARCHAR2(20) UNIQUE NOT NULL,
    full_name     VARCHAR2(100) NOT NULL,
    email         VARCHAR2(150) UNIQUE,
    department    VARCHAR2(50),
    year_of_study NUMBER,
    phone_number  VARCHAR2(15)
);

-- ==============================
-- 3. VENUE
-- ==============================
CREATE TABLE VENUE (
    venue_id      NUMBER PRIMARY KEY,
    venue_name    VARCHAR2(100) NOT NULL,
    building      VARCHAR2(50),
    room_number   VARCHAR2(20),
    capacity      NUMBER CHECK (capacity > 0),
    has_projector CHAR(1) DEFAULT 'N' CHECK (has_projector IN ('Y','N')),
    is_active     CHAR(1) DEFAULT 'Y' CHECK (is_active IN ('Y','N'))
);

-- ==============================
-- 4. CLUB
-- ==============================
CREATE TABLE CLUB (
    club_id          NUMBER PRIMARY KEY,
    club_name        VARCHAR2(100) UNIQUE NOT NULL,
    category         VARCHAR2(50),
    description      VARCHAR2(400),
    established_date DATE DEFAULT SYSDATE,
    created_by_admin_id NUMBER,
    CONSTRAINT fk_club_admin FOREIGN KEY (created_by_admin_id) REFERENCES ADMIN(admin_id)
);

-- ==============================
-- 5. MEMBERSHIP
-- ==============================
CREATE TABLE MEMBERSHIP (
    membership_id   NUMBER PRIMARY KEY,
    student_id      NUMBER NOT NULL,
    club_id         NUMBER NOT NULL,
    role            VARCHAR2(50),
    join_date       DATE DEFAULT SYSDATE,
    status          VARCHAR2(20) DEFAULT 'ACTIVE',
    CONSTRAINT fk_membership_student FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    CONSTRAINT fk_membership_club    FOREIGN KEY (club_id)      REFERENCES CLUB(club_id),
    CONSTRAINT uq_student_club UNIQUE (student_id, club_id)
);

-- ==============================
-- 6. EVENT
-- ==============================
CREATE TABLE EVENT (
    event_id          NUMBER PRIMARY KEY,
    event_title       VARCHAR2(150) NOT NULL,
    description       VARCHAR2(400),
    event_date        DATE,
    start_time        TIMESTAMP,
    end_time          TIMESTAMP,
    max_seats         NUMBER CHECK (max_seats > 0),
    status            VARCHAR2(20) DEFAULT 'Pending',
    club_id           NUMBER NOT NULL,
    venue_id          NUMBER NOT NULL,
    approved_by_admin_id NUMBER,
    CONSTRAINT fk_event_club      FOREIGN KEY (club_id)           REFERENCES CLUB(club_id),
    CONSTRAINT fk_event_venue     FOREIGN KEY (venue_id)          REFERENCES VENUE(venue_id),
    CONSTRAINT fk_event_admin     FOREIGN KEY (approved_by_admin_id) REFERENCES ADMIN(admin_id)
);

-- ==============================
-- 7. REGISTRATION
-- ==============================
CREATE TABLE REGISTRATION (
    registration_id   NUMBER PRIMARY KEY,
    student_id        NUMBER NOT NULL,
    event_id          NUMBER NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    attendance_status VARCHAR2(20) DEFAULT 'Absent',
    feedback_rating   NUMBER CHECK (feedback_rating BETWEEN 1 AND 5),
    CONSTRAINT fk_registration_student FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    CONSTRAINT fk_registration_event   FOREIGN KEY (event_id)   REFERENCES EVENT(event_id)
);