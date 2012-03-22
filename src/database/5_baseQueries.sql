--Retrieve the Owner information from the project ID
	--Working version
	SELECT u.* FROM `User` u INNER JOIN `Project` pro ON u.userID  = pro.ownerID WHERE pro.projectID = 1;

--Retrieve the project of an user
	SELECT pro.* FROM project pro INNER JOIN `user` u ON pro.ownerID = u.userID WHERE u.userID = 1;

--Retrieve all the events of a project
	SELECT e.* FROM event e INNER JOIN project pro ON pro.projectID = e.projectID WHERE pro.projectID = 1;

--Retrieve the project information from a given event
	SELECT pro.* FROM project pro INNER JOIN event e ON e.projectID = pro.projectID WHERE e.eventID = 3;

--Retrieve the project information from a the person 
	SELECT pro.* FROM project pro INNER JOIN Person p ON p.personID = pro.personID WHERE p.personID =  1;

--Retrieve the person from the project
	SELECT p.* FROM person p INNER JOIN Project pro ON p.personID = pro.projectID WHERE pro.projectID = 2;

--Retrieve the completion level of a project from all its events
	--If we consider that the completion level is the maximum value contained in the completionLevel field of the events of one project
	SELECT pro.*, max(e.completionLevel) as "Completion Level of the project" FROM project pro INNER JOIN event e ON e.projectID = pro.projectID WHERE pro.projectID = 1;

	--If we consider that the completion level is the sum of the completion level values of all the events related to a project
	SELECT pro.*, sum(e.completionLevel) as "Completion Level of the project" FROM project pro INNER JOIN event e ON e.projectID = pro.projectID WHERE pro.projectID = 1;

--Retrieve a project relying on its name
	SELECT pro.* FROM project pro WHERE pro.name LIKE '%linux%';
