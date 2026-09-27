-- ======================================================
-- Trigger: TRG_PREVENT_OVERBOOKING
-- Purpose:  Prevent registration when the event's max_seats
--           are already filled (based on REGISTRATION status = 'Present')
-- ======================================================
CREATE OR REPLACE TRIGGER trg_prevent_overbooking
BEFORE INSERT ON registration
FOR EACH ROW
DECLARE
    v_remaining NUMBER;
BEGIN
    -- Calculate remaining seats for the event the new row belongs to
    SELECT max_seats - NVL(
        (SELECT COUNT(*) FROM registration
         WHERE event_id = :NEW.event_id
           AND attendance_status = 'Present'), 0)
    INTO v_remaining
    FROM event
    WHERE event_id = :NEW.event_id;

    IF v_remaining <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001,
            'All seats are already booked for this event.');
    END IF;
END;
/