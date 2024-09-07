--https://leetcode.com/problems/game-play-analysis-i/description/

WITH RankedPlayers AS (
    SELECT 
        player_id,
        event_date,
        DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) AS first_login
    FROM 
        Activity 
)
SELECT 
    player_id,
    event_date AS first_login
FROM 
    RankedPlayers
WHERE 
    first_login = 1;

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id
ORDER BY player_id;

--Note partition by itu selalu mengambil id nya misal ada tiga id berarti nanti kayak digrouping
    -- ada tiga data gitu