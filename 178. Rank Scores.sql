-- https://leetcode.com/problems/rank-scores/description/
select
    score,
    dense_rank() over (
        order by
            score desc
    ) AS "rank"
from
    Scores
    -- Note = untuk membuat kolom baru di output pakai AS, lalu memberi nilai rank pakai 
    -- rank() untuk membuat urutannya ada yang sama tetapi lanjut ke 3, misal urutan 1 dan 2 
    -- sama berartikan 1 1 3 nah bukan 2 tetapi 3
    -- dense_rank() sesuai soal