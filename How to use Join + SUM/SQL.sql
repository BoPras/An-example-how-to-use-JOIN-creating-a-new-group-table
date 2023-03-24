use Scooters
SELECT Domisili, SUM(Total_Revenue) AS Total_Revenue
FROM 
(SELECT t2.Domisili, t1.Customer, t1.Total_Revenue
FROM
(SELECT Customer, SUM(Harga_Asli) AS Total_Revenue
FROM [dbo].[Transaksi Main Product]
GROUP BY Customer)
t1
JOIN
(SELECT Name AS Customer, Domisili
FROM dbo.Customer)
t2
ON t1.[Customer]=t2.Customer) AS T
GROUP BY Domisili
ORDER BY Total_Revenue DESC