use project
go

CREATE TABLE dbHostel (
HostelId int IDENTITY(1,1) PRIMARY KEY,
HostelName varchar(50) not null,
HostelType varchar(7) not null
)
go

insert dbHostel(HostelName,HostelType) values ('Ayesha Hall', 'Girls');

create Table dbDepartments(
DptId int IDENTITY(1,1) PRIMARY KEY,
DptName varchar(50) not null,
CONSTRAINT UNStudent_Dpt UNIQUE (DptName)
)
go

insert dbDepartments(DptName ) values ('Computer Engineering');
insert dbDepartments(DptName ) values ('Electrical Engineering');

create Table dbLogin(
LoginId int IDENTITY(1,1) primary key not null,
LoginEmail varchar(50) not null,
LoginPass varchar(50) not null,
LoginType varchar(1) not null,
CONSTRAINT UNLogin_pass UNIQUE (LoginPass),
)
go

insert dbLogin(LoginEmail,LoginPass,LoginType) values ('kitnu786@gmail.com',HASHBYTES('SHA1', '543'),'s');
insert dbLogin(LoginEmail,LoginPass,LoginType) values ('fato786@gmail.com',HASHBYTES('SHA1','123'),'s');
insert dbLogin(LoginEmail,LoginPass,LoginType) values ('lubu786@gmail.com', HASHBYTES('SHA1','090'),'s');

insert dbLogin(LoginEmail,LoginPass,LoginType) values ('bla786@gmail.com',HASHBYTES('SHA1','654'),'e');
insert dbLogin(LoginEmail,LoginPass,LoginType) values ('fufu786@gmail.com',HASHBYTES('SHA1','345'),'e');

create Table dbStudent (
S_CNIC Bigint primary key not null,
S_RegNO varchar(12) not null,
S_Session varchar(4) not null,
S_Name varchar(75) not null,
S_FatherName varchar(75) not null,
S_Address varchar(75) not null,
S_PhoneNo Bigint not null,
S_DOB date not null,
S_DptId int foreign key references dbDepartments(DptId) not null,
S_LoginId int foreign key references dbLogin(LoginId) not null,
S_CurrentDate datetime not null, 
CONSTRAINT UNStudent_CNIC UNIQUE (S_CNIC),
CONSTRAINT UNStudent_RegNO UNIQUE (S_RegNO),
)
go

insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_DptId,S_CurrentDate, S_LoginId) values(2345678091234, '2016-CE-67', '2016', 'Zahra', 'Afzaal','Lahore', '03325687943','1998-04-02' ,1, GETDATE(),1);
insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_DptId,S_CurrentDate, S_LoginId) values(9865678761232, '2016-CE-57', '2016', 'Maryam', 'Saeed','Lahore', '03256687941','1998-08-01',1, GETDATE(),2);
insert dbStudent(S_CNIC,S_RegNO,S_Session,S_Name,S_FatherName,S_Address,S_PhoneNo,S_DOB,S_DptId,S_CurrentDate, S_LoginId) values(3942568768212, '2016-CE-53', '2016', 'Alishba', 'Rauf','Lahore', '03458787959','1998-06-07', 1, GETDATE(),3);

create Table dbEmployee(
EmpCNIC Bigint primary key not null,
EmpName varchar(75) not null,
EmpFatherName varchar(75) not null,
EmpPhoneNo Bigint not null,
EmpDOB datetime not null,
EmpDesignation varchar(50) not null,
EmpIsActive bit not null,
Emp_HostelId int foreign key references dbHostel(HostelId) not null,
Emp_LoginId int foreign key references dbLogin(LoginId) not null,
CONSTRAINT UN_CNIC UNIQUE (EmpCNIC)
)
go

insert dbEmployee(EmpCNIC, EmpName, EmpFatherName, EmpPhoneNo, EmpDOB, EmpDesignation, Emp_HostelId, Emp_LoginId,EmpIsActive) values (3456784328459, 'Faisal', 'Khalid',03387623657,1980-3-4, 'Staff Member', 1,1,0);
insert dbEmployee(EmpCNIC, EmpName, EmpFatherName, EmpPhoneNo, EmpDOB, EmpDesignation, Emp_HostelId, Emp_LoginId,EmpIsActive) values (3456784321456, 'Azhar', 'Khalid',03345023657,1980-3-3, 'Staff Member', 1,2,1);

create Table dbRoom(
RoomId int IDENTITY(1,1) primary key not null,
Room_HostelId int foreign key references dbHostel(HostelId),
RoomNO int not null,
RoomCapacity tinyint not null,
Details varchar(900) 
)
go

insert dbRoom(Room_HostelID, RoomNO, RoomCapacity) values (1,50,40);

create Table dbAllotment(
AllotmentId int IDENTITY(1,1) primary key not null,
A_RoomId int foreign key references dbRoom(RoomId) not null,
A_StudentId Bigint foreign key references dbStudent(S_CNIC) not null, 
A_Status bit not null,
A_DateIN date not null,
A_DateOut date
)
go

insert dbAllotment(A_RoomId, A_StudentId, A_Status, A_DateIN) values (1,2345678091234,1, '2016-01-07');

create Table dbMenu(
MenuId int IDENTITY(1,1) primary key not null,
MenuName varchar(50) not null,
Menu_HostelId int foreign key references dbHostel(HostelId),
Menu_StartDate date not null,
Menu_EndDate date,
Menu_Comments varchar(200)
)
go

insert dbMenu(MenuName,Menu_HostelId, Menu_StartDate) values ('Biryani',1,'2016-08-02');
insert dbMenu(MenuName,Menu_HostelId, Menu_StartDate) values ('Chicken Karaahi',1,'2016-02-02');

create Table dbMess(
MessId int IDENTITY(1,1) primary key not null,
Mess_S_CNIC Bigint foreign key references dbStudent(S_CNIC) not null,
MessCurrentDate date not null,
MessLunch int,
MessDinner int,
)
go

create Table dbFoodItems(
FoodId int IDENTITY(1,1) primary key not null,
FoodName varchar(50) not null,
FoodPrice int not null,
FoodDay varchar(50) not null,
FoodType varchar(10) not null,
Food_MenuId int foreign key references dbMenu(MenuId) not null,
)


create Table dbMessAttendance(
MessAid int IDENTITY(1,1) primary key not null,
MessA_RoomId int foreign key references dbRoom(RoomId) not null,
MessA_S_CNIC Bigint foreign key references dbStudent(S_CNIC) not null,
MessA_FoodId int foreign key references dbFoodItems(FoodId) not null,
MessACurrentDate date not null,
MessACount int,
)

go