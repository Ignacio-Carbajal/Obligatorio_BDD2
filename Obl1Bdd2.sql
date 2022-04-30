DROP TABLE achievements;
DROP TABLE donation;
DROP TABLE favchannels;
DROP TABLE streammessages;
DROP TABLE viewers;
DROP TABLE streams;
DROP TABLE suscriptions;
DROP TABLE users;





CREATE TABLE Users (
username CHAR(20) NOT NULL PRIMARY KEY,
publicName CHAR(20) NOT NULL,
pass CHAR(20) NOT NULL,
biography CHAR(500) NOT NULL,
birthDate DATE NOT NULL,
recoveryForm CHAR(20) NOT NULL,
--profilePicture FILE,
--profileBanner FILE,
bitAmmount NUMBER, 
userLevel CHAR(20),
creationDate DATE);

CREATE TABLE FavChannels(
favUser CHAR NOT NULL REFERENCES Users(username),
favStreamer CHAR NOT NULL REFERENCES Users(username),
PRIMARY KEY(favUser, favStreamer)
);

CREATE TABLE Achievements (
username CHAR NOT NULL,
achivement NUMBER NOT NULL
);

CREATE TABLE Suscriptions(
suscriber CHAR NOT NULL REFERENCES Users(username),
channel CHAR NOT NULL REFERENCES Users(username),
country CHAR NOT NULL,
renovationPeriod NUMBER NOT NULL,
startDate DATE NOT NULL,
endDate DATE NOT NULL ,       --CHECK (endDate > startDate)
activeSubscription CHAR(1) NOT NULL,
price NUMBER NOT NULL,
paymentMedium CHAR NOT NULL,
PRIMARY KEY(suscriber, channel)
);

CREATE TABLE Streams(
title CHAR NOT NULL UNIQUE,
username CHAR NOT NULL REFERENCES Users(username),
startDate DATE NOT NULL,
endDate DATE NOT NULL,
startHour TIMESTAMP NOT NULL,
endHour TIMESTAMP NOT NULL,
streamTime NUMBER NOT NULL,
streamQuality CHAR NOT NULL,
topic NUMBER NOT NULL,
maxAmountOfViewers NUMBER NOT NULL,
PRIMARY KEY(title, username)
);


CREATE TABLE Donation(
userDoner CHAR NOT NULL REFERENCES Users(username),
userReciever CHAR NOT NULL REFERENCES Users(username),
bits NUMBER NOT NULL,
donationDate DATE,
donationHour TIMESTAMP,
PRIMARY KEY (userDoner, userReciever)
);

CREATE TABLE StreamMessages(
message CHAR NOT NULL, 
messageDate DATE NOT NULL,
messageSender CHAR REFERENCES Users(username),
messageStream CHAR REFERENCES Streams(title),
PRIMARY KEY(messageSender, messageStream)
);

CREATE TABLE Viewers(
username CHAR NOT NULL REFERENCES Users(username),
country CHAR NOT NULL,
liveWatch CHAR(1) NOT NULL,
streamWatcher CHAR REFERENCES Streams(title),
PRIMARY KEY(username, streamWatcher)
);


INSERT INTO Users
(username, publicname, pass, biography, birthdate, recoveryform, bitammount, userlevel, creationdate)
VALUES
('nachitoxx', 'Ignacio Carbajal', 'pete', 'Soy amigo del mesita y el peke',to_date('31/08/2010','dd/mm/yyyy'), 'mail', 0, 'Petardo', to_date(SYSDATE,'dd/mm/yyyy'));


