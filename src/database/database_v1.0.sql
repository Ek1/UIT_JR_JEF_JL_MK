CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE "User" (
    "idUser" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT,
    "isAdmin" INTEGER NOT NULL DEFAULT (0)
);
CREATE TABLE "Project" (
    "idProject" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "isOpen" INTEGER NOT NULL DEFAULT (1),
    "idOwner" INTEGER NOT NULL
);
CREATE TABLE "Person" (
    "idPerson" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL
);
CREATE TABLE "Member" (
    "idPerson" INTEGER NOT NULL,
    "idEvent" INTEGER NOT NULL
);
CREATE TABLE event (
    "idEvent" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT NOT NULL,
    "description" BLOB,
    "time" TEXT NOT NULL,
    "completionLevel" INTEGER NOT NULL
, "idProject" INTEGER NOT NULL  DEFAULT (0));
