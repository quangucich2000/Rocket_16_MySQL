SELECT 
    a.*, d.DepartmentName
FROM
    `account` a
        JOIN
    `department` d ON a.DepartmentId = d.DepartmentId;

SELECT 
    *
FROM
    `account`
WHERE
    CreateDate >= '2020-12-20';

SELECT 
    a.*, p.PositionName
FROM
    `account` a
        JOIN
    `position` p ON a.PositionID = p.PositionID
WHERE
    p.PositionName LIKE 'DEV%'
;

-- Q4 cách 1
select * from department
where DepartmentID =
(SELECT 
    DepartmentId 
FROM
    `account` 
group by DepartmentId
having count(DepartmentId) > 3)
;

-- Q4 cách 2
SELECT 
    t.DepartmentName, COUNT(DepartmentId)
FROM
    (SELECT 
        a.*, d.DepartmentName
    FROM
        `account` a
    JOIN `department` d ON a.DepartmentId = d.DepartmentId) AS t
GROUP BY t.DepartmentId
HAVING COUNT(DepartmentId) > 3
;

-- Q5
select * from question where QuestionID =
(select QuestionID from examquestion group by QuestionID order by count(QuestionID) desc limit 1);
    
-- Q6
SELECT 
    A.CategoryID, C.CategoryName, a.`Dem Category`
FROM
    (SELECT 
        CategoryID, COUNT(CategoryID) AS 'Dem Category'
    FROM
        question
    GROUP BY CategoryID) A
        JOIN
    categoryquestion C ON a.CategoryID = c.CategoryID
; 

SELECT 
    cq.CategoryID, cq.CategoryName, count(q.CategoryID)
FROM
    `question` q
        JOIN
    `categoryquestion` cq ON q.CategoryID = cq.CategoryID
group by q.CategoryID    
;

-- Q7
SELECT 
    q.*, count(eq.QuestionID)
FROM
    `question` q
        JOIN
    `examquestion` eq on q.QuestionID = eq.QuestionID
group by eq.QuestionID
order by q.QuestionID
;

-- Q8
SELECT 
    q.*, COUNT(a.QuestionID) AS 'Dem'
FROM
    `question` q
        JOIN
    `answer` a ON q.QuestionID = a.QuestionID
GROUP BY a.QuestionID
ORDER BY Dem DESC
LIMIT 1;

-- Q9
SELECT 
    ga.*, COUNT(ga.GroupID) 'Luong acc trong group'
FROM
    `groupaccount` ga
GROUP BY ga.GroupID
;

-- Q10
SELECT 
    p.*, COUNT(a.PositionID) AS 'DEM'
FROM
    `account` a
        JOIN
    `position` p ON a.PositionID = p.PositionID
GROUP BY a.PositionID
ORDER BY DEM
LIMIT 1
;

-- Q11
SELECT 
    d.DepartmentName, p.PositionName, count(*)
FROM
    `account` a
        JOIN
    `position` p ON a.PositionID = p.PositionID
		JOIN
	`department` d on a.DepartmentId = d.DepartmentId
group by d.DepartmentID, p.PositionID
;

-- Q12
SELECT 
    *
FROM
    `account` a
        JOIN
    `question` q ON a.AccountID = q.CreatorID
		JOIN
	`typequestion` tq on q.TypeID = tq.TypeID
		JOIN
	`answer` ans on ans.QuestionID = q.QuestionID
;

-- Q13
SELECT 
    *, count(q.QuestionID)
FROM
    `typequestion` tq
        JOIN
    `question` q ON tq.TypeID = q.TypeID
where tq.TypeName in ('tự luận', 'trắc nghiệm')
group by tq.TypeID
;

-- Q14, Q15
SELECT DISTINCT
    g.GroupID, g.GroupName
FROM
    `group` g
        LEFT JOIN
    `groupaccount` ga ON g.GroupID = ga.GroupID
WHERE
    ga.AccountID IS NULL;

-- Q16
SELECT 
    *
FROM
    Question
WHERE
    QuestionID NOT IN (SELECT 
            QuestionID
        FROM
            Answer);

-- Q17
select * from `account` a join `groupaccount` ga on a.AccountID = ga.AccountID where ga.GroupID = 1	
union select * from `account` a join `groupaccount` ga on a.AccountID = ga.AccountID where ga.GroupID = 2;

-- Q18
select *, count(AccountID) as 'DEM' from `group` g join `groupaccount` ga on g.GroupID = ga.GroupID group by g.GroupID having DEM > 5
union select *, count(AccountID) as 'DEM' from `group` g join `groupaccount` ga on g.GroupID = ga.GroupID group by g.GroupID having DEM <7;

