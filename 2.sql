--Показати ПІБ усіх студентів з мінімальною оцінкою
--у вказаному діапазоні.
--SELECT full_name
--FROM StudentsGrades
--WHERE average_grade >= min_grade AND average_grade <= max_grade

--Показати інформацію про студентів, яким виповнилося 20 років.
--SELECT *
--FROM StudentsGrades
--WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) > 25 

--Показати інформацію про студентів з віком, у вказаному діапазоні
--SELECT *
--FROM StudentsGrades
--WHERE date_of_birth BETWEEN '2000-01-01' AND '2001-12-20' 

--Показати інформацію про студентів із конкретним
--ім’ям. Наприклад, показати студентів з ім’ям Борис.
--SELECT *
--FROM StudentsGrades
--WHERE full_name LIKE '%Дмитро%'

--Показати інформацію про студентів, в номері яких
--є три сімки
--SELECT *
--FROM StudentsGrades
--WHERE phone_number LIKE '%777%'

--Показати електронні адреси студентів, що починаються з конкретної літери.
--SELECT *
--FROM StudentsGrades
--WHERE email LIKE 'o%'

--Показати мінімальну середню оцінку по всіх 
--студентах
--SELECT MIN(average_grade) AS min_average_grade
--FROM StudentsGrades

--Показати максимальну середню оцінку по всіх студентах.
--SELECT MAX(average_grade) AS max_average_grade
--FROM StudentsGrades

--Показати статистику міст. Має відображатися назва
--міста та кількість студентів з цього міста.
--SELECT city, COUNT(*) AS students_count
--FROM StudentsGrades
--GROUP BY city

--Показати статистику студентів. Має відображатися
--назва країни та кількість студентів з цієї країни.
--SELECT country, COUNT(*) AS students_count
--FROM StudentsGrades
--GROUP BY country

--Показати кількість студентів з мінімальною середньою
--оцінкою з математики.
--SELECT COUNT(*) AS min_math_students_count
--FROM StudentsGrades
--WHERE min_subject = 'Математика' AND average_grade = (
--	SELECT MIN(average_grade) 
--	FROM StudentsGrades
--	WHERE min_subject = 'Математика'
--)

--Показати кількість студентів з максимальною середньою оцінкою з математики.
--SELECT COUNT(*) AS max_math_students_count
--FROM StudentsGrades
--WHERE max_subject = 'Математика' AND average_grade = (
--	SELECT MAX(average_grade) 
--	FROM StudentsGrades
--	WHERE max_subject = 'Математика'
--)

--Показати кількість студентів у кожній групі.
--SELECT group_name, COUNT(*) AS students_count
--FROM StudentsGrades
--GROUP BY group_name

--Показати середню оцінку групи.
--SELECT group_name, AVG(average_grade) AS group_average_grade
--FROM StudentsGrades
--GROUP BY group_name


--вивести середню оцінку по групах, лише для груп 
--де кількість студентів більша 3
--SELECT group_name, AVG(average_grade) AS group_average_grade
--FROM StudentsGrades
--WHERE group_name IN (
--	SELECT group_name
--	FROM StudentsGrades
--	GROUP BY group_name
--	HAVING COUNT(*) > 3
--)
--GROUP BY group_name



--вивести ті групи середня оцінка яких лежить в межах 70-80, 
--не враховувати студентів  яким менше 25 років
SELECT group_name, AVG(average_grade) AS group_average_grade
FROM StudentsGrades
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) > 25 
GROUP BY group_name
HAVING AVG(average_grade) BETWEEN 70 AND 80






