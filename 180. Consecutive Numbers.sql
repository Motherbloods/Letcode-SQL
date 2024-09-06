-- https://leetcode.com/problems/consecutive-numbers/description/

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
join Logs l2 on l2.id = l1.id+1
join Logs l3 on l3.id = l1.id+2
where l1.num = l2.num and l2.num = l3.num

--Note :  l1.num itu adalah nama alias dari kolom num dari tabel Logs asli,
    -- jadi maksud dari logs l2 logs l3 itu adalah mudahnya itu nanti ada tiga tabel data
    -- dari tabel asli Logs soal

-- Contoh data:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+

--akan seperti ini =

-- l1_id | l1_num | l2_id | l2_num | l3_id | l3_num
-- ------|--------|-------|--------|-------|-------
--   1   |   1    |   2   |   1    |   3   |   1
--   2   |   1    |   3   |   1    |   4   |   2
--   3   |   1    |   4   |   2    |   5   |   1
--   4   |   2    |   5   |   1    |   6   |   2
--   5   |   1    |   6   |   2    |   7   |   2