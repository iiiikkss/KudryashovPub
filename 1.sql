SELECT *
FROM students st
WHERE st.score = 
(
SELECT MAX (st.score)
FROM students st)