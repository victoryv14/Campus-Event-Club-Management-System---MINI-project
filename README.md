# Campus Event & Club Management System

A relational database mini project for managing student clubs and campus events at a university level.

## Project Status: ✅ Implementation Complete

All core deliverables have been implemented and tested on Oracle Database 26ai as of **September 27, 2026**.

---

## What We Built

### 1️⃣ Database Schema (7 Normalized Tables)
- **ADMIN** – System administrators who approve clubs and events
- **STUDENT** – Students with roll numbers, departments, contact info
- **VENUE** – Campus locations with capacity, projector availability
- **CLUB** – Student organizations (Literary, Coding, etc.)
- **MEMBERSHIP** – Student-club associations with roles (President, Member, etc.)
- **EVENT** – Campus events with venues, organizers, seat limits
- **REGISTRATION** – Event registrations with attendance tracking and feedback

**Integrity enforced via:**
- Primary keys on all tables
- Foreign keys linking students ↔ clubs, events ↔ venues, etc.
- Check constraints (capacity > 0, feedback 1-5, attendance status validation)
- Unique constraints (student email, roll number, club name)

### 2️⃣ PL/SQL Business Logic

| Object | Type | Purpose |
|--------|------|---------|
| `trg_prevent_overbooking` | **TRIGGER** | Automatically blocks event registrations when `max_seats` is reached (fires on every INSERT to `REGISTRATION`) |
| `assign_admin_to_event` | **PROCEDURE** | Assigns an admin as the approval authority for an event |
| `total_present_attendance` | **FUNCTION** | Returns the count of students who attended a given event |

### 3️⃣ Sample Data
Populated with realistic test data:
- 2 admins, 4 students (team members), 2 clubs, 2 venues
- 2 upcoming events (Freshers' Meet, Hackathon 2026)
- 3 sample registrations with attendance status

### 4️⃣ Analytical Queries
Complex SELECT statements demonstrating:
- Multi-table JOINs (events with venue + club details)
- Aggregation (registrations per club, attendance rates)
- Subqueries and filtering (upcoming events with available seats)

---

## Project Structure

```
Campus-Event-Club-Management-System---MINI-project/
├── docs/
│   ├── CECMS_Abstract.docx       # Project abstract
│   ├── ER_Diagram.md             # Mermaid diagram code
│   └── ER_diagram.png            # Visual ER model (Crow's Foot notation)
├── sql/
│   ├── create_tables.sql         # DDL for all 7 tables with constraints
│   ├── seed_data.sql             # Sample data inserts
│   ├── create_trigger.sql        # Over-booking prevention trigger
│   └── create_procedures.sql     # Admin assignment + attendance function
└── README.md                     # This file
```

---

## How to Run

**Prerequisites:**
- Oracle Database 26ai installed and running
- SQL*Plus or SQLcl available on PATH

**Execution Order:**
```bash
# 1. Create schema
sqlplus / as sysdba @sql/create_tables.sql

# 2. Load sample data
sqlplus / as sysdba @sql/seed_data.sql

# 3. Install trigger & procedures
sqlplus / as sysdba @sql/create_trigger.sql
sqlplus / as sysdba @sql/create_procedures.sql

# 4. Verify installation
sqlplus / as sysdba
SQL> SELECT table_name FROM user_tables;       -- 7 tables
SQL> SELECT trigger_name FROM user_triggers;   -- TRG_PREVENT_OVERBOOKING
SQL> SELECT object_name FROM user_objects WHERE object_type IN ('PROCEDURE','FUNCTION');
```

---

## Key Features Demonstrated

✅ **Relational Integrity** – All 7 entities connected via proper foreign keys  
✅ **Normalization** – Schema follows 3NF (no redundancy, atomic values)  
✅ **Automatic Enforcement** – Trigger prevents double-booking without manual checks  
✅ **Reusable Logic** – Procedures/functions encapsulate common operations  
✅ **Complex Queries** – JOIN, GROUP BY, subqueries, and computed columns  

---

## Team Members

| S.No | Name | Roll Number | Role |
|------|------|-------------|------|
| 1 | Muppanaboina Vamsi Kalyan | 25B11CS623 | Project Lead / DB Architect |
| 2 | Pasala Harini | 25B11CS718 | SQL Developer |
| 3 | Laveti Roshini | 25B11CS517 | Query Analyst |
| 4 | Palivela Praharsha Sai Charan | 25B11CS700 | Documentation & Testing |

---

## Tech Stack

- **Database:** Oracle Database 26ai
- **Design Tool:** Mermaid (Crow's Foot ER notation)
- **Version Control:** Git & GitHub
- **Development Environment:** VS Code + SQL*Plus

---

## Success Criteria Met

- ✅ All SQL scripts execute cleanly in sequential order on Oracle 26ai
- ✅ Relational integrity enforced across all operations
- ✅ Venue over-booking prevented via automatic trigger
- ✅ Membership roles and event attendance tracked via bridge tables
- ✅ Complex analytical queries with JOINs and aggregations
- ✅ Schema normalized to 3NF
- ✅ Complete documentation (ER diagram, abstract, README)
