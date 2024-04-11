CREATE DATABASE IF NOT EXISTS SorP;

USE SorP;


CREATE TABLE IF NOT EXISTS Preferences (
prefid INT NOT NULL,
genderPref ENUM('Female', 'Male', 'Non-Binary', 'No Preference')NOT NULL,
agePref INT NOT NULL,
locationMin INT NOT NULL,
locationMax INT NULL,
PRIMARY KEY (prefid)
);


CREATE TABLE IF NOT EXISTS Interests (
interestid INT NOT NULL,
interestName VARCHAR(100),
PRIMARY KEY (interestid)
);

CREATE TABLE IF NOT EXISTS Users (
userid INT NOT NULL,
firstName VARCHAR(100) NOT NULL,
lastName VARCHAR(100) NOT NULL,
dob DATE NOT NULL,
gender ENUM('Female', 'Male', 'Non-Binary', 'Prefer Not to Say') NOT NULL,
ethnicity ENUM('White', 'Black', 'Asian', 'Mixed', 'Other', 'Prefer Not to Say') NOT NULL,
location VARCHAR(200) NOT NULL,
about VARCHAR(500) NOT NULL,
prefid INT NOT NULL,
interestid INT NOT NULL,
PRIMARY KEY (userid),
FOREIGN KEY (prefid) REFERENCES Preferences (prefid),
FOREIGN KEY (interestid) REFERENCES Interests (interestid)
);


CREATE TABLE Matches (
matchid INT NOT NULL,
userid INT NOT NULL,
PRIMARY KEY (matchid),
FOREIGN KEY (userid) REFERENCES Users (userid)
);


CREATE TABLE messages (
messageid INT NOT NULL,
messageText VARCHAR(1000) NOT NULL,
timeSent TIME NOT NULL,
PRIMARY KEY (messageid)
);

CREATE TABLE anonChat (
anonid INT NOT NULL,
userid INT NOT NULL,
matchid INT NOT NULL,
messageid INT NOT NULL,
PRIMARY KEY (anonid),
FOREIGN KEY (userid) REFERENCES Users (userid),
FOREIGN KEY (matchid) REFERENCES Matches (matchid),
FOREIGN KEY (messageid) REFERENCES Matches (messageid)
);
