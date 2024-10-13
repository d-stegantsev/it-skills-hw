DECLARE
    v_err VARCHAR2(100);
BEGIN
    util.add_new_jobs(p_job_id     => 'IT_QA',
                      p_job_title  => 'QA_Engineer',
                      p_min_salary => 10000,
                      p_max_salary => 15000,
                      po_err       => v_err);
    dbms_output.put_line (v_err);
END;
/