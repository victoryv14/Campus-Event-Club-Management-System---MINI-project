# Campus Event & Club Management System - ER Diagram

You can copy the code block below and paste it into [Mermaid Live Editor](https://mermaid.live/) to generate a high-quality visualization for your project report screenshot.

```mermaid
erDiagram
    ADMIN {
        NUMBER admin_id PK
        VARCHAR2 full_name
        VARCHAR2 email UK
        VARCHAR2 role
        TIMESTAMP created_at
    }

    STUDENT {
        NUMBER student_id PK
        VARCHAR2 roll_number UK
        VARCHAR2 full_name
        VARCHAR2 email UK
        VARCHAR2 department
        NUMBER year_of_study
        VARCHAR2 phone_number
    }

    VENUE {
        NUMBER venue_id PK
        VARCHAR2 venue_name
        VARCHAR2 building
        VARCHAR2 room_number
        NUMBER capacity
        CHAR has_projector
        CHAR is_active
    }

    CLUB {
        NUMBER club_id PK
        VARCHAR2 club_name UK
        VARCHAR2 category
        VARCHAR2 description
        DATE established_date
        NUMBER created_by_admin_id FK
    }

    MEMBERSHIP {
        NUMBER membership_id PK
        NUMBER student_id FK
        NUMBER club_id FK
        VARCHAR2 role
        DATE join_date
        VARCHAR2 status
    }

    EVENT {
        NUMBER event_id PK
        VARCHAR2 event_title
        VARCHAR2 description
        DATE event_date
        TIMESTAMP start_time
        TIMESTAMP end_time
        NUMBER max_seats
        VARCHAR2 status
        NUMBER club_id FK
        NUMBER venue_id FK
        NUMBER approved_by_admin_id FK
    }

    REGISTRATION {
        NUMBER registration_id PK
        NUMBER student_id FK
        NUMBER event_id FK
        TIMESTAMP registration_date
        VARCHAR2 attendance_status
        NUMBER feedback_rating
    }

    %% Relationships (Crow's Foot Notation)
    ADMIN ||--o{ CLUB : "approves/creates"
    ADMIN ||--o{ EVENT : "approves"
    
    CLUB ||--o{ MEMBERSHIP : "has"
    STUDENT ||--o{ MEMBERSHIP : "joins"
    
    CLUB ||--o{ EVENT : "hosts"
    VENUE ||--o{ EVENT : "hosts"
    
    EVENT ||--o{ REGISTRATION : "receives"
    STUDENT ||--o{ REGISTRATION : "makes"
```
