WITH valid AS (
    SELECT id, visit_date, people
    FROM Stadium
    WHERE people >= 100
),
numbered AS (
    SELECT *,
           id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM valid
)
SELECT id, visit_date, people
FROM numbered
WHERE grp IN (
    SELECT grp
    FROM numbered
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date;
