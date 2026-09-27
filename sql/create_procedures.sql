-- ======================================================
-- Procedure 1: assign an admin as the approved officer for an event
-- ======================================================
CREATE OR REPLACE PROCEDURE assign_admin_to_event (
    p_event_id   IN NUMBER,
    p_admin_id   IN NUMBER
) IS
BEGIN
    UPDATE event
    SET approved_by_admin_id = p_admin_id
    WHERE event_id = p_event_id;
    COMMIT;
END assign_admin_to_event;
/
-- ======================================================
-- Procedure 2: return total attendance (Present registrations) for an event
-- ======================================================
CREATE OR REPLACE FUNCTION total_present_attendance(p_event_id IN NUMBER) RETURN NUMBER IS
    v_cnt NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_cnt
    FROM registration
    WHERE event_id = p_event_id
      AND attendance_status = 'Present';
    RETURN v_cnt;
END total_present_attendance;
/
