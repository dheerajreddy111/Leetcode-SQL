# Write your MySQL query statement below
SELECT p.firstName,
p.Lastname,
a.city,
a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personID;