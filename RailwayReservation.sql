
create database RailwayTicketReservation
use RailwayTicketReservation

create table Authentication(AuthID char(11) primary key,
							UserPassword char(15) not null)
                            
create table Users(PhNo char(11),
					foreign key(PhNo) references Authentication(AuthID),
					FirstName varchar(10) not null,
					LastName varchar(10) not null,
                    primary key(PhNo))

create table staff(staffId varchar(11) primary key,
					firstName char(10) not null,
                    lastName char(10) not null,
                    position char(15),
                    salary int,
                    dob date)

create table TrainRoute(RouteID char(4) primary key,
					RouteName varchar(20) not null,
					Distance int not null,
					established date)

create table RouteStation(stationNo int not null ,
					StationID varchar(4) primary key,
					StationName varchar(25) not null,
					RouteID char(4) ,
                    foreign key (RouteID) references TrainRoute(RouteID))

create table Train(TrainID char(5) primary key,
					TrainName varchar(15) not null,
					RouteID char(4),
                    foreign key (RouteID) references TrainRoute(RouteID))

create table TrainStations(StationNo int not null,
					TrainID char(4) ,
                    foreign key (TrainID) references Train(TrainID) ,
					StationName varchar(25) not null,
					departureTime time,
					arrivalTime time,
					primary key(StationNo,TrainID))
                    
create table TrainSchedule(TrainID char(4),
						foreign key (TrainID) references Train(TrainID),
                        departureDate date not null,
                        constraint schedules primary key(TrainID, departureDate))

create table TrainCoach(CoachNo varchar(4),
					TrainID char(4),
                    foreign key  (TrainID) references Train(TrainID),
					CoachType varchar(15) not null,
					TicketFee int not null,
                    primary key(CoachNo,TrainID))

create table CoachSeats(SeatNo varchar(5),
					CoachNo varchar(4),
                    foreign key (CoachNo) references TrainCoach(CoachNo),
					primary key(SeatNo,CoachNo))

create table Reservation(UserID char(11) ,
					foreign key (UserID) references Users(PhNo) ,
					SeatNo varchar(5),
					CoachNo varchar(4),
					constraint Reservation foreign key(SeatNo,CoachNo) references CoachSeats(SeatNo,CoachNo),
					PassengerName char(15) not null,
					reservationDate date not null,
					derpartCity char(15) not null,
					ArrivalCity char(15) not null,
					primary key(SeatNo,CoachNo,reservationDate))


select * from TrainRoute

select * from RouteStation
where RouteID = 'ML6'

select * from TrainStations
inner join Train on Train.TrainID = TrainStations.TrainID
where Train.TrainName = 'Multan'

insert into Authentication(AuthID,UserPassword)
values('03058761739','12345678'),('03002485294','12345678'),
('03111671546','Hanzla12'),('03134834266','Rizwan23')

insert into Authentication(AuthID,UserPassword)
values('SA-09-AD','admin@1234')

insert into staff(staffId,firstName,lastName,dob,position,salary)
values('SA-09-AD','Asad','Saif','1998-12-08','Admin',20000),('SA-10','Hamza','Raza','1996-1-19','Driver',12000),
('SA-11','Ali','Raza','1978-03-08','Clerck',10000),('SA-12','Haroon','Ali','1998-12-08','Driver',12000)

insert into Users(PhNo,FirstName,LastName)
values('03058761739','Ali','Saif'),
('03002485294','Asad','Saif'),
('03111671546','Hanzla','Mirza'),
('03134834266','Rizwan','Sabir')


select * from TrainStations
where TrainID = 'TR7'

select * from TrainRoute

select * from RouteStation
where RouteID = 'ML5'

insert into TrainRoute(RouteID,RouteName,Distance,established)
values('ML1','Main Line1',1764,'1881-02-19'),
('ML2','Main Line2',1600,'1916-08-23'),
('ML3','Main Line3',414,'1906-04-13'),
('ML4','Main Line4',196, '1902-09-24')

select * from TrainRoute

select * from RouteStation
order by stationNo desc LIMIT 1

insert into RouteStation(stationNo,StationID,StationName,RouteID)
values(1,'KR1','Karachi','ML1'),(2,'KR2','Karachi Cant','ML1'),
(3,'KT1','Kotri','ML1'),(4,'HYD','Hyderabad','ML1'),
(5,'NA1','Nawabshah','ML1'),(6,'ROH','Rohri','ML1'),
(7,'KHAN','Khanpur','ML1'),(8,'LO1','Lodhran','ML1'),
(9,'MU1','Multan Cant','ML1'),(10,'MU2','Multan City','ML1'),
(11,'KA','Khanewal','ML1'),(12,'LAH','Lahore Cant','ML1'),
(13,'LAH1','Lahore City','ML1'),(14,'LAH2','Shadra Bagh','ML1'),
(15,'GU','Gujranwala','ML1'),(16,'WZ','Wazirabad','ML1'),
(17,'GJ1','Gujrat','ML1'),(18,'LM2','Lala Musa','ML1'),
(19,'JH','Jhelum','ML1'),(20,'RW3','Rawalpindi','ML1'),
(21,'TX','Taxila','ML1'),(22,'HSB','Hasan Abdal','ML1'),
(23,'ATK','Attock','ML1'),(24,'NWS','Nowshera','ML1'),
(25,'PS1','Peshawar','ML1'),(26,'PS2','Peshawar Cant','ML1'),
(27,'KT2','Kotri','ML2'),(28,'JM2','Jamshoro','ML2'),
(29,'PAT','Petaro','ML2'),(30,'SS1','Sehwan Sharif','ML2'),
(31,'DD','Dadu','ML2'),(32,'MHJ','Mehonjodaro','ML2'),
(33,'LRK1','Larkana','ML2'),(34,'HK2','Habib Kot','ML2'),
(35,'JC','Jacobabad','ML2'),(36,'KK1','Kandkot','ML2'),
(37,'KSH','Kashmore','ML2'),(38,'RJP','Rajanpur','ML2'),
(39,'DGK','DG Khan','ML2'),(40,'LYH','Layyah','ML2'),
(41,'BKR','Bakkhar','ML2'),(42,'KJ','Kundian','ML2'),
(43,'MNW','MianWali','ML2'),(44,'DDK','Dadu Khel','ML2'),
(45,'JND','Jand','ML2'),(46,'BSL','Bassal','ML2'),
(47,'ATK5','Attock City','ML2'),(48,'RHR4','Rohri','ML3'),
(49,'SKR','Sakkur','ML3'),(50,'SHKP','Shikarpur','ML3'),
(51,'JC3','Jacobabad','ML3'),(52,'DM2','Dera Murad','ML3'),
(53,'SIBI','Sibi','ML3'),(54,'MCH','Mach','ML3'),
(55,'SPD','Spezand','ML3'),(56,'QU1','Quetta','ML3'),
(57,'KUC','Kuchlak','ML3'),(58,'BST','Bostan','ML3'),
(59,'QA5','Qila Abdullah','ML3'),(60,'CHM2','Chamman','ML3'),
(61,'QU3','Quetta','ML4'),(62,'SPD2','Spezand','ML4'),
(63,'NSK8','Nushki','ML4'),(64,'AHDW','Ahmedwal','ML4'),
(65,'DLB','Dalbandian','ML4'),(66,'NKI','Nok Kundi','ML4'),
(67,'KTF','Kohe-Tafftan','ML4'),(68,'BNP','BoundaryPillar','ML4'),
(69,'MRV','Mirjaveh','ML4'),(70,'ZHD','Zahedan','ML4')


insert into Train(TrainID,TrainName,RouteID)
values('TR1','Iqbal Express','ML1'),
('TR2','Subak Kharam','ML1'),
('TR3','Rawal Express','ML1'),
('TR4','Sukkur Express','ML3'),
('TR5','Jand Passenger','ML2'),
('TR6','Shah Latif','ML3')


insert into TrainSchedule(TrainID,departureDate)
values('TR1','2023-1-20'),('TR1','2023-1-21'),('TR1','2023-1-22'),
('TR1','2023-01-24'),('TR1','2023-01-25'),('TR2','2023-1-19'),('TR2','2023-01-20'),
('TR2','2023-1-21'),('TR3','2023-1-22'),('TR3','2023-1-23'),('TR5','2023-1-25'),
('TR5','2023-1-26'),('TR5','2023-1-27'),('TR5','2023-1-28'),
('TR6','2023-1-23'),('TR6','2023-1-24')

select * from Train
order by TrainID desc LIMIT 1

insert into TrainStations(StationNo,TrainID,StationName,departureTime,arrivalTime)
values(1,'TR1','Sialkot JN','07:00',null),(2,'TR1','Chawinda','07:28','07:30'),
(3,'TR1','Pasrur','07:42','07:44'),(4,'TR1','Kila Sobha Singh','08:06','08:08'),
(5,'TR1','Narowal JN','08:50','08:55'),(6,'TR1','Baddomali','09:23','09:25'),
(7,'TR1','Narang','09:43','09:45'),(8,'TR1','Shahdra Bagh','10:40','10:42'),
(9,'TR1','Lahore JN','11:10','11:45'),(10,'TR1','Kot Lakhpat','12:05','12:07'),
(11,'TR1','Raiwind JN','12:30','12:35'),(12,'TR1','Kot Radha Kishen','12:53','12:55'),
(13,'TR1','Pattoki','13:18','13:20'),(14,'TR1','Okara','13:58','14:00'),
(15,'TR1','Sahiwal','14:40','14:45'),(16,'TR1','Chichawatni','15:18','15:20'),
(17,'TR1','Mian Channun','15:46','15:48'),(18,'TR1','Khanewal','16:25','16:50'),
(19,'TR1','Jahania','17:18','17:20'),(20,'TR1','Dunyapur','17:42','17:44'),
(21,'TR1','Lodhran JN','18:14','18:16'),(22,'TR1','Bahawalpur','18:35','18:40'),
(23,'TR1','Khanpur JN','20:15','20:20'),(24,'TR1','Rahim Yar Khan','20:49','20:54'),
(25,'TR1','Sadikabad','21:14','21:16'),(26,'TR1','Ghotki','22:27','22:29'),
(27,'TR1','Rohri JN','23:40','00:05'),(28,'TR1','Mahrabpur','1:41','1:43'),
(29,'TR1','Nawabshah JN','03:35','03:40'),(30,'TR1','Tando Adam','04:55','04:57'),
(31,'TR1','Hyderabad JN','05:35','05:40'),(32,'TR1','Kotri JN','05:54','05:56'),
(33,'TR1','Landhi JN','07:33','07:35'),(34,'TR1','Drigh Road','07:56','07:58'),
(35,'TR1','Karachi Cantt',null,'08:20'),
(1,'TR2','Lahore JN','16:30',null),
(2,'TR2','Gujranwala','17:25','17:27'),(3,'TR2','Wazirabad','17:55','17:57'),
(4,'TR2','Gujrat','18:16','18:18'),(5,'TR2','Lala Musa JN','18:44','18:46'),
(6,'TR2','Jhelum','19:24','19:26'),(7,'TR2','Chak Lala','21:20','21:22'),
(8,'TR2','Rawalpindi',null,'21:35'),
(1,'TR3','Rawalpindi','00:30',null),(2,'TR3','Lahore',null,'04:40'),
(1,'TR5','Jand JN','13:00',null),
(2,'TR5','Langar','13:08','13:09'),(3,'TR5','Chur Sharif','13:15','13:16'),
(4,'TR5','Nammal','13:22','13:23'),(5,'TR5','Domel','13:37','13:38'),
(6,'TR5','Basal JN','13:47','13:48'),(7,'TR5','Sulaimanabad','13:59','14:00'),
(8,'TR5','Jhalar','14:07','14:08'),(9,'TR5','Attock City',null,'14:40'),
(1,'TR6','Dabheji','08:25',null),
(2,'TR6','Jungshahi','08:49','08:51'),(3,'TR6','Jhimpir','09:16','09:18'),
(4,'TR6','Meting','09:32','09:36'),(5,'TR6','Kotri JN','09:58','10:00'),
(6,'TR6','Hyderabad JN','10:20','10:25'),(7,'TR6','Tando Jam','10:52','10:53'),
(8,'TR6','Tando Alahyar','11:22','11:24'),(9,'TR6','Mirpur Khas JN',null,'11:55')


insert into TrainCoach(TrainID,TicketFee,CoachType,CoachNo)
values('TR1',3000,'Business','CO01'),('TR1',3000,'Business','CO02'),('TR1',5000,'AC Class','CO03'),
('TR1',1800,'Economy','CO04'),('TR1',1800,'Economy','CO05'),('TR1',1800,'Economy','CO06'),
('TR2',2000,'Business','CO07'),('TR2',2000,'Business','CO08'),('TR2',2000,'Business','CO09'),
('TR2',3500,'AC Class','CO10'),('TR2',3500,'AC Class','CO11'),('TR2',1200,'Economy','CO12'),
('TR2',1200,'Economy','CO13'),('TR2',1200,'Economy','CO14'),('TR2',1200,'Economy','CO15'),
('TR3',2500,'Business','CO16'),('TR3',2500,'Business','CO17'),('TR3',1000,'Economy','CO18'),
('TR3',1000,'Economy','CO19'),('TR3',1000,'Economy','CO20'),('TR4',4800,'Business','CO21'),
('TR4',4800,'Business','CO22'),('TR4',4800,'Business','CO23'),('TR4',4800,'Business','CO24'),
('TR4',2000,'Economy','CO25'),('TR4',2000,'Economy','CO26'),('TR4',2000,'Economy','CO27'),
('TR4',2000,'Economy','CO28'),('TR4',2000,'Economy','CO29'),('TR4',2000,'Economy','CO30'),
('TR5',1500,'Economy','CO31'),('TR5',1500,'Economy','CO32'),('TR5',1500,'Economy','CO33'),
('TR5',1500,'Economy','CO34'),('TR5',1500,'Economy','CO35'),('TR5',1500,'Economy','CO36'),
('TR6',1900,'Business','CO37'),('TR6',1900,'Business','CO38'),('TR6',1900,'Business','CO39'),
('TR6',1900,'Business','CO40'),('TR6',2000,'AC Class','CO41'),('TR6',2000,'AC Class','CO42'),
('TR6',2000,'AC Class','CO43'),('TR6',2000,'AC Class','CO44'),('TR6',950,'Economy','CO45'),
('TR6',950,'Economy','CO46'),('TR6',950,'Economy','CO47'),('TR6',950,'Economy','CO48'),
('TR6',950,'Economy','CO49'),('TR6',950,'Economy','CO50')



insert into CoachSeats(SeatNo,CoachNo)
values('S01','CO01'),('S02','CO01'),('S03','CO01'),('S04','CO01'),('S05','CO01'),('S06','CO01'),
('S07','CO01'),('S08','CO01'),('S09','CO01'),('S10','CO01'),('S11','CO01'),('S12','CO01'),('S13','CO01'),
('S14','CO01'),('S15','CO01'),('A01','CO02'),('A02','CO02'),('A03','CO02'),('A04','CO02'),('A05','CO02'),
('A06','CO02'),('A07','CO02'),('A08','CO02'),('A09','CO02'),('A10','CO02'),('A11','CO02'),('A12','CO02'),
('A13','CO02'),('A14','CO02'),('A15','CO02'),('A16','CO02'),('A17','CO02'),('A18','CO02'),('A19','CO02'),
('A20','CO02'),('B01','CO03'),('B02','CO03'),('B03','CO03'),('B04','CO03'),('B05','CO03'),('B06','CO03'),
('B07','CO03'),('B08','CO03'),('B09','CO03'),('B10','CO03'),('B11','CO03'),('B12','CO03'),('B13','CO03'),
('B14','CO03'),('B15','CO03'),('B16','CO03'),('B17','CO03'),('B18','CO03'),('B19','CO03'),('B20','CO03'),
('C01','CO04'),('C02','CO04'),('C03','CO04'),('C04','CO04'),('C05','CO04'),('C06','CO04'),('C07','CO04'),
('C08','CO04'),('C09','CO04'),('C10','CO04'),('C11','CO04'),('C12','CO04'),('C13','CO04'),('C14','CO04'),
('C15','CO04'),('C16','CO04'),('C17','CO04'),('C18','CO04'),('C19','CO04'),('C20','CO04'),('C21','CO04'),
('C22','CO04'),('C23','CO04'),('C24','CO04'),('C25','CO04'),('C26','CO04'),('C27','CO04'),('C28','CO04'),
('C29','CO04'),('SA01','CO05'),('SA02','CO05'),('SA03','CO05'),('SA04','CO05'),('SA05','CO05'),('SA06','CO05'),
('SA07','CO05'),('SA08','CO05'),('SA09','CO05'),('SA10','CO05'),('SA11','CO05'),('SA12','CO05'),('SA13','CO05'),
('SA14','CO05'),('SA15','CO05'),('AA01','CO06'),('AA02','CO06'),('AA03','CO06'),('AA04','CO06'),('AA05','CO06'),
('AA06','CO06'),('AA07','CO06'),('AA08','CO06'),('AA09','CO06'),('AA10','CO06'),('AA11','CO06'),('AA12','CO06'),
('AA13','CO06'),('AA14','CO06'),('AA15','CO06'),('AA16','CO06'),('AA17','CO06'),('AA18','CO06'),('AA19','CO06'),
('AA20','CO06'),('BA01','CO07'),('BA02','CO07'),('BA03','CO07'),('BA04','CO07'),('BA05','CO07'),('BA06','CO07'),
('BA07','CO07'),('BA08','CO07'),('BA09','CO07'),('BA10','CO07'),('BA11','CO07'),('BA12','CO07'),('BA13','CO07'),
('BA14','CO07'),('BA15','CO07'),('BA16','CO07'),('BA17','CO07'),('BA18','CO07'),('BA19','CO07'),('BA20','CO07'),
('CA01','CO08'),('CA02','CO08'),('CA03','CO08'),('CA04','CO08'),('CA05','CO08'),('CA06','CO08'),('CA07','CO08'),
('CA08','CO08'),('CA09','CO08'),('CA10','CO08'),('CA11','CO08'),('CA12','CO08'),('CA13','CO08'),('CA14','CO08'),
('CA15','CO08'),('CA16','CO08'),('CA17','CO08'),('CA18','CO08'),('CA19','CO08'),('CA20','CO08'),('CA21','CO08'),
('CA22','CO08'),('CA23','CO08'),('CA24','CO08'),('CA25','CO08'),('CA26','CO08'),('CA27','CO08'),('CA28','CO08'),
('CA29','CO08'),('SB01','CO09'),('SB02','CO09'),('SB03','CO09'),('SB04','CO09'),('SB05','CO09'),('SB06','CO09'),
('SB07','CO09'),('SB08','CO09'),('SB09','CO09'),('SB10','CO09'),('SB11','CO09'),('SB12','CO09'),('SB13','CO09'),
('SB14','CO09'),('SB15','CO09'),('AB01','CO10'),('AB02','CO10'),('AB03','CO10'),('AB04','CO10'),('AB05','CO10'),
('AB06','CO10'),('AB07','CO10'),('AB08','CO10'),('AB09','CO10'),('AB10','CO10'),('AB11','CO10'),('AB12','CO10'),
('AB13','CO10'),('AB14','CO10'),('AB15','CO10'),('AB16','CO10'),('AB17','CO10'),('AB18','CO10'),('AB19','CO10'),
('AB20','CO10'),('BB01','CO11'),('BB02','CO11'),('BB03','CO11'),('BB04','CO11'),('BB05','CO11'),('BB06','CO11'),
('BB07','CO11'),('BB08','CO11'),('BB09','CO11'),('BB10','CO11'),('BB11','CO11'),('BB12','CO11'),('BB13','CO11'),
('BB14','CO11'),('BB15','CO11'),('BB16','CO11'),('BB17','CO11'),('BB18','CO11'),('BB19','CO11'),('BB20','CO11'),
('CB01','CO12'),('CB02','CO12'),('CB03','CO12'),('CB04','CO12'),('CB05','CO12'),('CB06','CO12'),('CB07','CO12'),
('CB08','CO12'),('CB09','CO12'),('CB10','CO12'),('CB11','CO12'),('CB12','CO12'),('CB13','CO12'),('CB14','CO12'),
('CB15','CO12'),('CB16','CO12'),('CB17','CO12'),('CB18','CO12'),('CB19','CO12'),('CB20','CO12'),('CB21','CO12'),
('CB22','CO12'),('CB23','CO12'),('CB24','CO12'),('CB25','CO12'),('CB26','CO12'),('CB27','CO12'),('CB28','CO12'),
('CB29','CO12'),('SE01','CO13'),('SE02','CO13'),('SE03','CO13'),('SE04','CO13'),('SE05','CO13'),('SE06','CO13'),
('SE07','CO13'),('SE08','CO13'),('SE09','CO13'),('SE10','CO13'),('SE11','CO13'),('SE12','CO13'),('SE13','CO13'),
('SE14','CO13'),('SE15','CO13'),('AE01','CO14'),('AE02','CO14'),('AE03','CO14'),('AE04','CO14'),('AE05','CO14'),
('AE06','CO14'),('AE07','CO14'),('AE08','CO14'),('AE09','CO14'),('AE10','CO14'),('AE11','CO14'),('AE12','CO14'),
('AE13','CO14'),('AE14','CO14'),('AE15','CO14'),('AE16','CO14'),('AE17','CO14'),('AE18','CO14'),('AE19','CO14'),
('AE20','CO14'),('BE01','CO15'),('BE02','CO15'),('BE03','CO15'),('BE04','CO15'),('BE05','CO15'),('BE06','CO15'),
('BE07','CO15'),('BE08','CO15'),('BE09','CO15'),('BE10','CO15'),('BE11','CO15'),('BE12','CO15'),('BE13','CO15'),
('BE14','CO15'),('BE15','CO15'),('BE16','CO15'),('BE17','CO15'),('BE18','CO15'),('BE19','CO15'),('BE20','CO15'),
('CE01','CO16'),('CE02','CO16'),('CE03','CO16'),('CE04','CO16'),('CE05','CO16'),('CE06','CO16'),('CE07','CO16'),
('CE08','CO16'),('CE09','CO16'),('CE10','CO16'),('CE11','CO16'),('CE12','CO16'),('CE13','CO16'),('CE14','CO16'),
('CE15','CO16'),('CE16','CO16'),('CE17','CO16'),('CE18','CO16'),('CE19','CO16'),('CE20','CO16'),('CE21','CO16'),
('CE22','CO16'),('CE23','CO16'),('CE24','CO16'),('CE25','CO16'),('CE26','CO16'),('CE27','CO16'),('CE28','CO16'),
('CE29','CO16'),('SD01','CO17'),('SD02','CO17'),('SD03','CO17'),('SD04','CO17'),('SD05','CO17'),('SD06','CO17'),
('SD07','CO17'),('SD08','CO17'),('SD09','CO17'),('SD10','CO17'),('SD11','CO17'),('SD12','CO17'),('SD13','CO17'),
('SD14','CO17'),('SD15','CO17'),('AD01','CO18'),('AD02','CO18'),('AD03','CO18'),('AD04','CO18'),('AD05','CO18'),
('AD06','CO18'),('AD07','CO18'),('AD08','CO18'),('AD09','CO18'),('AD10','CO18'),('AD11','CO18'),('AD12','CO18'),
('AD13','CO18'),('AD14','CO18'),('AD15','CO18'),('AD16','CO18'),('AD17','CO18'),('AD18','CO18'),('AD19','CO18'),
('AD20','CO18'),('BD01','CO19'),('BD02','CO19'),('BD03','CO19'),('BD04','CO19'),('BD05','CO19'),('BD06','CO19'),
('BD07','CO19'),('BD08','CO19'),('BD09','CO19'),('BD10','CO19'),('BD11','CO19'),('BD12','CO19'),('BD13','CO19'),
('BD14','CO19'),('BD15','CO19'),('BD16','CO19'),('BD17','CO19'),('BD18','CO19'),('BD19','CO19'),('BD20','CO19'),
('CD01','CO20'),('CD02','CO20'),('CD03','CO20'),('CD04','CO20'),('CD05','CO20'),('CD06','CO20'),('CD07','CO20'),
('CD08','CO20'),('CD09','CO20'),('CD10','CO20'),('CD11','CO20'),('CD12','CO20'),('CD13','CO20'),('CD14','CO20'),
('CD15','CO20'),('CD16','CO20'),('CD17','CO20'),('CD18','CO20'),('CD19','CO20'),('CD20','CO20'),('CD21','CO20'),
('CD22','CO20'),('CD23','CO20'),('CD24','CO20'),('CD25','CO20'),('CD26','CO20'),('CD27','CO20'),('CD28','CO20'),
('CD29','CO20'),('SC01','CO21'),('SC02','CO21'),('SC03','CO21'),('SC04','CO21'),('SC05','CO21'),('SC06','CO21'),
('SC07','CO21'),('SC08','CO21'),('SC09','CO21'),('SC10','CO21'),('SC11','CO21'),('SC12','CO21'),('SC13','CO21'),
('SC14','CO21'),('SC15','CO21'),('AC01','CO22'),('AC02','CO22'),('AC03','CO22'),('AC04','CO22'),('AC05','CO22'),
('AC06','CO22'),('AC07','CO22'),('AC08','CO22'),('AC09','CO22'),('AC10','CO22'),('AC11','CO22'),('AC12','CO22'),
('AC13','CO22'),('AC14','CO22'),('AC15','CO22'),('AC16','CO22'),('AC17','CO22'),('AC18','CO22'),('AC19','CO22'),
('AC20','CO22'),('BC01','CO23'),('BC02','CO23'),('BC03','CO23'),('BC04','CO23'),('BC05','CO23'),('BC06','CO23'),
('BC07','CO23'),('BC08','CO23'),('BC09','CO23'),('BC10','CO23'),('BC11','CO23'),('BC12','CO23'),('BC13','CO23'),
('BC14','CO23'),('BC15','CO23'),('BC16','CO23'),('BC17','CO23'),('BC18','CO23'),('BC19','CO23'),('BC20','CO23'),
('CC01','CO24'),('CC02','CO24'),('CC03','CO24'),('CC04','CO24'),('CC05','CO24'),('CC06','CO24'),('CC07','CO24'),
('CC08','CO24'),('CC09','CO24'),('CC10','CO24'),('CC11','CO24'),('CC12','CO24'),('CC13','CO24'),('CC14','CO24'),
('CC15','CO24'),('CC16','CO24'),('CC17','CO24'),('CC18','CO24'),('CC19','CO24'),('CC20','CO24'),('CC21','CO24'),
('CC22','CO24'),('CC23','CO24'),('CC24','CO24'),('CC25','CO24'),('CC26','CO24'),('CC27','CO24'),('CC28','CO24'),
('CC29','CO24')


insert into CoachSeats(SeatNo,CoachNo)
values('S01','CO25'),('S02','CO25'),('S03','CO25'),('S04','CO25'),('S05','CO25'),('S06','CO25'),
('S07','CO25'),('S08','CO25'),('S09','CO25'),('S10','CO25'),('S11','CO25'),('S12','CO25'),('S13','CO25'),
('S14','CO25'),('S15','CO25'),('A01','CO26'),('A02','CO26'),('A03','CO26'),('A04','CO26'),('A05','CO26'),
('A06','CO26'),('A07','CO26'),('A08','CO26'),('A09','CO26'),('A10','CO26'),('A11','CO26'),('A12','CO26'),
('A13','CO26'),('A14','CO26'),('A15','CO26'),('A16','CO26'),('A17','CO26'),('A18','CO26'),('A19','CO26'),
('A20','CO26'),('B01','CO27'),('B02','CO27'),('B03','CO27'),('B04','CO27'),('B05','CO27'),('B06','CO27'),
('B07','CO27'),('B08','CO27'),('B09','CO27'),('B10','CO27'),('B11','CO27'),('B12','CO27'),('B13','CO27'),
('B14','CO27'),('B15','CO27'),('B16','CO27'),('B17','CO27'),('B18','CO27'),('B19','CO27'),('B20','CO27'),
('C01','CO28'),('C02','CO28'),('C03','CO28'),('C04','CO28'),('C05','CO28'),('C06','CO28'),('C07','CO28'),
('C08','CO28'),('C09','CO28'),('C10','CO28'),('C11','CO28'),('C12','CO28'),('C13','CO28'),('C14','CO28'),
('C15','CO28'),('C16','CO28'),('C17','CO28'),('C18','CO28'),('C19','CO28'),('C20','CO28'),('C21','CO28'),
('C22','CO28'),('C23','CO28'),('C24','CO28'),('C25','CO28'),('C26','CO28'),('C27','CO28'),('C28','CO28'),
('C29','CO28'),('SA01','CO29'),('SA02','CO29'),('SA03','CO29'),('SA04','CO29'),('SA05','CO29'),('SA06','CO29'),
('SA07','CO29'),('SA08','CO29'),('SA09','CO29'),('SA10','CO29'),('SA11','CO29'),('SA12','CO29'),('SA13','CO29'),
('SA14','CO29'),('SA15','CO29'),('AA01','CO30'),('AA02','CO30'),('AA03','CO30'),('AA04','CO30'),('AA05','CO30'),
('AA06','CO30'),('AA07','CO30'),('AA08','CO30'),('AA09','CO30'),('AA10','CO30'),('AA11','CO30'),('AA12','CO30'),
('AA13','CO30'),('AA14','CO30'),('AA15','CO30'),('AA16','CO30'),('AA17','CO30'),('AA18','CO30'),('AA19','CO30'),
('AA20','CO30'),('BA01','CO31'),('BA02','CO31'),('BA03','CO31'),('BA04','CO31'),('BA05','CO31'),('BA06','CO31'),
('BA07','CO31'),('BA08','CO31'),('BA09','CO31'),('BA10','CO31'),('BA11','CO31'),('BA12','CO31'),('BA13','CO31'),
('BA14','CO31'),('BA15','CO31'),('BA16','CO31'),('BA17','CO31'),('BA18','CO31'),('BA19','CO31'),('BA20','CO31'),
('CA01','CO32'),('CA02','CO32'),('CA03','CO32'),('CA04','CO32'),('CA05','CO32'),('CA06','CO32'),('CA07','CO32'),
('CA08','CO32'),('CA09','CO32'),('CA10','CO32'),('CA11','CO32'),('CA12','CO32'),('CA13','CO32'),('CA14','CO32'),
('CA15','CO32'),('CA16','CO32'),('CA17','CO32'),('CA18','CO32'),('CA19','CO32'),('CA20','CO32'),('CA21','CO32'),
('CA22','CO32'),('CA23','CO32'),('CA24','CO32'),('CA25','CO32'),('CA26','CO32'),('CA27','CO32'),('CA28','CO32'),
('CA29','CO32'),('SB01','CO33'),('SB02','CO33'),('SB03','CO33'),('SB04','CO33'),('SB05','CO33'),('SB06','CO33'),
('SB07','CO33'),('SB08','CO33'),('SB09','CO33'),('SB10','CO33'),('SB11','CO33'),('SB12','CO33'),('SB13','CO33'),
('SB14','CO33'),('SB15','CO33'),('AB01','CO34'),('AB02','CO34'),('AB03','CO34'),('AB04','CO34'),('AB05','CO34'),
('AB06','CO34'),('AB07','CO34'),('AB08','CO34'),('AB09','CO34'),('AB10','CO34'),('AB11','CO34'),('AB12','CO34'),
('AB13','CO34'),('AB14','CO34'),('AB15','CO34'),('AB16','CO34'),('AB17','CO34'),('AB18','CO34'),('AB19','CO34'),
('AB20','CO34'),('BB01','CO35'),('BB02','CO35'),('BB03','CO35'),('BB04','CO35'),('BB05','CO35'),('BB06','CO35'),
('BB07','CO35'),('BB08','CO35'),('BB09','CO35'),('BB10','CO35'),('BB11','CO35'),('BB12','CO35'),('BB13','CO35'),
('BB14','CO35'),('BB15','CO35'),('BB16','CO35'),('BB17','CO35'),('BB18','CO35'),('BB19','CO35'),('BB20','CO35'),
('CB01','CO36'),('CB02','CO36'),('CB03','CO36'),('CB04','CO36'),('CB05','CO36'),('CB06','CO36'),('CB07','CO36'),
('CB08','CO36'),('CB09','CO36'),('CB10','CO36'),('CB11','CO36'),('CB12','CO36'),('CB13','CO36'),('CB14','CO36'),
('CB15','CO36'),('CB16','CO36'),('CB17','CO36'),('CB18','CO36'),('CB19','CO36'),('CB20','CO36'),('CB21','CO36'),
('CB22','CO36'),('CB23','CO36'),('CB24','CO36'),('CB25','CO36'),('CB26','CO36'),('CB27','CO36'),('CB28','CO36'),
('CB29','CO36'),('SE01','CO37'),('SE02','CO37'),('SE03','CO37'),('SE04','CO37'),('SE05','CO37'),('SE06','CO37'),
('SE07','CO37'),('SE08','CO37'),('SE09','CO37'),('SE10','CO37'),('SE11','CO37'),('SE12','CO37'),('SE13','CO37'),
('SE14','CO37'),('SE15','CO37'),('AE01','CO38'),('AE02','CO38'),('AE03','CO38'),('AE04','CO38'),('AE05','CO38'),
('AE06','CO38'),('AE07','CO38'),('AE08','CO38'),('AE09','CO38'),('AE10','CO38'),('AE11','CO38'),('AE12','CO38'),
('AE13','CO38'),('AE14','CO38'),('AE15','CO38'),('AE16','CO38'),('AE17','CO38'),('AE18','CO38'),('AE19','CO38'),
('AE20','CO38'),('BE01','CO39'),('BE02','CO39'),('BE03','CO39'),('BE04','CO39'),('BE05','CO39'),('BE06','CO39'),
('BE07','CO39'),('BE08','CO39'),('BE09','CO39'),('BE10','CO39'),('BE11','CO39'),('BE12','CO39'),('BE13','CO39'),
('BE14','CO39'),('BE15','CO39'),('BE16','CO39'),('BE17','CO39'),('BE18','CO39'),('BE19','CO39'),('BE20','CO39'),
('CE01','CO40'),('CE02','CO40'),('CE03','CO40'),('CE04','CO40'),('CE05','CO40'),('CE06','CO40'),('CE07','CO40'),
('CE08','CO40'),('CE09','CO40'),('CE10','CO40'),('CE11','CO40'),('CE12','CO40'),('CE13','CO40'),('CE14','CO40'),
('CE15','CO40'),('CE16','CO40'),('CE17','CO40'),('CE18','CO40'),('CE19','CO40'),('CE20','CO40'),('CE21','CO40'),
('CE22','CO40'),('CE23','CO40'),('CE24','CO40'),('CE25','CO40'),('CE26','CO40'),('CE27','CO40'),('CE28','CO40'),
('CE29','CO40'),('SD01','CO41'),('SD02','CO41'),('SD03','CO41'),('SD04','CO41'),('SD05','CO41'),('SD06','CO41'),
('SD07','CO41'),('SD08','CO41'),('SD09','CO41'),('SD10','CO41'),('SD11','CO41'),('SD12','CO41'),('SD13','CO41'),
('SD14','CO41'),('SD15','CO41'),('AD01','CO42'),('AD02','CO42'),('AD03','CO42'),('AD04','CO42'),('AD05','CO42'),
('AD06','CO42'),('AD07','CO42'),('AD08','CO42'),('AD09','CO42'),('AD10','CO42'),('AD11','CO42'),('AD12','CO42'),
('AD13','CO42'),('AD14','CO42'),('AD15','CO42'),('AD16','CO42'),('AD17','CO42'),('AD18','CO42'),('AD19','CO42'),
('AD20','CO42'),('BD01','CO43'),('BD02','CO43'),('BD03','CO43'),('BD04','CO43'),('BD05','CO43'),('BD06','CO43'),
('BD07','CO43'),('BD08','CO43'),('BD09','CO43'),('BD10','CO43'),('BD11','CO43'),('BD12','CO43'),('BD13','CO43'),
('BD14','CO43'),('BD15','CO43'),('BD16','CO43'),('BD17','CO43'),('BD18','CO43'),('BD19','CO43'),('BD20','CO43'),
('CD01','CO44'),('CD02','CO44'),('CD03','CO44'),('CD04','CO44'),('CD05','CO44'),('CD06','CO44'),('CD07','CO44'),
('CD08','CO44'),('CD09','CO44'),('CD10','CO44'),('CD11','CO44'),('CD12','CO44'),('CD13','CO44'),('CD14','CO44'),
('CD15','CO44'),('CD16','CO44'),('CD17','CO44'),('CD18','CO44'),('CD19','CO44'),('CD20','CO44'),('CD21','CO44'),
('CD22','CO44'),('CD23','CO44'),('CD24','CO44'),('CD25','CO44'),('CD26','CO44'),('CD27','CO44'),('CD28','CO44'),
('CD29','CO44'),('SC01','CO45'),('SC02','CO45'),('SC03','CO45'),('SC04','CO45'),('SC05','CO45'),('SC06','CO45'),
('SC07','CO45'),('SC08','CO45'),('SC09','CO45'),('SC10','CO45'),('SC11','CO45'),('SC12','CO45'),('SC13','CO45'),
('SC14','CO45'),('SC15','CO45'),('AC01','CO46'),('AC02','CO46'),('AC03','CO46'),('AC04','CO46'),('AC05','CO46'),
('AC06','CO46'),('AC07','CO46'),('AC08','CO46'),('AC09','CO46'),('AC10','CO46'),('AC11','CO46'),('AC12','CO46'),
('AC13','CO46'),('AC14','CO46'),('AC15','CO46'),('AC16','CO46'),('AC17','CO46'),('AC18','CO46'),('AC19','CO46'),
('AC20','CO46'),('BC01','CO47'),('BC02','CO47'),('BC03','CO47'),('BC04','CO47'),('BC05','CO47'),('BC06','CO47'),
('BC07','CO47'),('BC08','CO47'),('BC09','CO47'),('BC10','CO47'),('BC11','CO47'),('BC12','CO47'),('BC13','CO47'),
('BC14','CO47'),('BC15','CO47'),('BC16','CO47'),('BC17','CO47'),('BC18','CO47'),('BC19','CO47'),('BC20','CO47'),
('CC01','CO48'),('CC02','CO48'),('CC03','CO48'),('CC04','CO48'),('CC05','CO48'),('CC06','CO48'),('CC07','CO48'),
('CC08','CO48'),('CC09','CO48'),('CC10','CO48'),('CC11','CO48'),('CC12','CO48'),('CC13','CO48'),('CC14','CO48'),
('CC15','CO48'),('CC16','CO48'),('CC17','CO48'),('CC18','CO48'),('CC19','CO48'),('CC20','CO48'),('CC21','CO48'),
('CC22','CO48'),('CC23','CO48'),('CC24','CO48'),('CC25','CO48'),('CC26','CO48'),('CC27','CO48'),('CC28','CO48'),
('CC29','CO48')

insert into Reservation(UserID,CoachNo,SeatNo,PassengerName,reservationDate,derpartCity,ArrivalCity)
values('03058761739','CO24','CC22','Ali Saif',curdate(),'Karachi','Kotri'),
('03002485294','CO24','CC23','Asad Saif',curdate(),'Kotri','Nawabshah'),
('03134834266','CO29','SA03','Rizwan Sabir',curdate(),'Hyderabad','Khanpur'),
('03058761739','CO06','AA09','Ali Saif',curdate(),'Kotri','Rohri')

select CoachSeats.CoachNo from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
inner join Train on Train.TrainID = TrainCoach.TrainID
where seatNo = 'AA09' and TrainName = 'Iqbal Express'

select SeatNo,TrainCoach.CoachNo,PassengerName,TicketFee from Reservation
inner join TrainCoach on TrainCoach.CoachNo = Reservation.CoachNo
where UserID = '03058761739'

select * from TrainStations
inner join Train on Train.TrainID = TrainStations.TrainID
where Train.TrainName = 'Nations Train'

select * from Reservation
inner join TrainCoach on TrainCoach.CoachNo = Reservation.CoachNo
where userID = '03058761739'

select * from Users
where PhNo = '03058761739'

select * from Train
where TrainName = 'Iqbal Express'

select * from TrainSchedule
where TrainID = 'TR1'

select * from Train
inner join TrainSchedule on TrainSchedule.TrainID = Train.TrainID
where TrainName = 'Iqbal Express'
order by departureDate desc LIMIT 1

select * from Authentication
where PhNo = '03058761739'

select * from TrainSchedule

select * from staff
where staffId = 'SA-09-AD'

select * from TrainStations
inner join TrainSchedule on TrainSchedule.TrainID = TrainStations.TrainID
inner join Train on Train.TrainID = TrainStations.TrainID
where  StationName='Lahore JN'  and departureDate = '2023-1-24'
having TrainStations.stationNo < (select stationNo from TrainStations
where StationName = 'Karachi Cantt')

select *, (count(CoachSeats.SeatNo) - count(Reservation.SeatNo)) from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
inner join Train on Train.TrainID = TrainCoach.TrainID
left join Reservation on Reservation.SeatNo = CoachSeats.SeatNo and Reservation.CoachNo = CoachSeats.CoachNo
where Reservation.SeatNo is null
group by TrainCoach.TrainID,TrainCoach.CoachType,CoachSeats.SeatNo
having TrainCoach.CoachType = 'Economy' and Train.TrainName = 'Iqbal Express'

select * from TrainStations
inner join TrainCoach on TrainCoach.TrainID = TrainStations.TrainID
inner join Train on Train.TrainID = TrainStations.TrainID
where  Train.TrainName = 'Iqbal Express' and TrainCoach.CoachType = 'Economy'
group by TicketFee

select * from TrainStations
inner join Train on Train.TrainID = TrainStations.TrainID
where Train.TrainName = 'Iqbal Express'

delete from Users
where PhNo = '03406505056'

select * from Users
where phNo = '03058761739' and UserPassword = '12345678'

SELECT * from Reservation

--Give Option to User
select * from Train

--Show Stations of Selected Train
select * from TrainStations
where TrainStations.TrainID = (select TrainID from Train where TrainName = 'Iqbal Express')

--Reserve a Seat
select TrainCoach.CoachType from TrainCoach
inner join Train on Train.TrainID = TrainCoach.TrainID
where Train.TrainID = 'TR1'
group by CoachType

--Check Ticktes Available for Trains TR1 and TR3
select TrainCoach.TrainID,CoachType,(count(CoachSeats.CoachNo)-count(Reservation.SeatNo)) from TrainCoach
inner join CoachSeats on CoachSeats.CoachNo = TrainCoach.CoachNo
left join Reservation on Reservation.SeatNo = CoachSeats.SeatNo 
and Reservation.CoachNo = CoachSeats.CoachNo
where TrainCoach.TrainID = 'TR1'
group by TrainCoach.TrainID,CoachType

--Total Seats in Trains with Categories
select TrainCoach.TrainID,TrainCoach.CoachType, count(SeatNo) as [Tickets] from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
group by TrainCoach.TrainID,TrainCoach.CoachType

--Total Seats in Trains Without Categories
select TrainCoach.TrainID, count(SeatNo) as [Tickets] from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
group by TrainCoach.TrainID

--Check Total Tickets Available After Reservation
select TrainCoach.TrainID, (count(CoachSeats.SeatNo) - count(Reservation.SeatNo)) as [Remaining Tickets] from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
left join Reservation on Reservation.SeatNo = CoachSeats.SeatNo and Reservation.CoachNo = CoachSeats.CoachNo
group by TrainCoach.TrainID order by TrainID asc

--Check Total Tickets Available After Reservation with Categories
select CoachSeats.SeatNo,TrainCoach.TrainID,TrainCoach.CoachType, (count(CoachSeats.SeatNo) - count(Reservation.SeatNo))
from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
left join Reservation on Reservation.SeatNo = CoachSeats.SeatNo and Reservation.CoachNo = CoachSeats.CoachNo
group by TrainCoach.TrainID,TrainCoach.CoachType,CoachSeats.SeatNo 
having TrainCoach.CoachType = 'Economy' and TrainCoach.TrainID = 'TR1'

select * from CoachSeats
inner join TrainCoach on TrainCoach.CoachNo = CoachSeats.CoachNo
where CoachType = 'Bussiness'

