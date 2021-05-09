CREATE OR REPLACE FUNCTION fibbon(ile numeric)
RETURNS SETOF numeric
LANGUAGE SQL
AS $$
WITH RECURSIVE recfib (n, fib_n, fib_prev) AS (
       VALUES (1::numeric, 1::numeric, 0::numeric)
      ),
      fib (n, fib_n, fib_prev) AS (
       SELECT n, fib_n, fib_prev
       FROM recfib
       UNION ALL
       SELECT n + 1, fib_n + fib_prev, fib_n
       FROM fib
       WHERE n < ile
     )
SELECT fib_n
FROM fib
ORDER BY n;
$$;



CREATE OR REPLACE PROCEDURE fibbon_p(len numeric)
LANGUAGE sql
    AS $$
        SELECT * FROM postgres.public.fibbon(len);
    $$;

CALL fibbon_p(50);