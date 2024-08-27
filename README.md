# add-v6-subnet-to-virtualizor
+ note that you need to create the ipv6-pool in virtualizor panel and add at least one ipv6 address in the pool.

+ first you need to install mysql-client:

apt install mysql-client-core-8.0

+ then find database password from universal.php file:

nano /usr/local/virtualizor/universal.php

+ after finding the password connect to the database:

mysql -u root -pPassword -S /usr/local/emps/var/mysql/mysql.sock

+ and run these queries:

use virtualizor

select * from ips;

+ you will see a table that has ipv4 and ipv6 listed in it.

+ find that one ipv6 address that you added to the v6 pool,then you need to remember the ipid and ippid values of this row in this table.

+ then simply run this query to add ipv6 addresses to the pool:

Template Query:

INSERT INTO ips VALUES ($start_id, 9, 0, 0, '$ip', 1, '', 0, NULL, '', 0, NULL);"

Sample query to add 7 ipv6 addresses:

INSERT INTO ips VALUES (501, 9, 0, 0, '2a0e:0:1:3015:8000::3620', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (502, 9, 0, 0, '2a0e:0:1:3015:8000::3621', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (503, 9, 0, 0, '2a0e:0:1:3015:8000::3622', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (504, 9, 0, 0, '2a0e:0:1:3015:8000::3623', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (505, 9, 0, 0, '2a0e:0:1:3015:8000::3624', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (506, 9, 0, 0, '2a0e:0:1:3015:8000::3625', 1, '', 0, NULL, '', 0, NULL);

INSERT INTO ips VALUES (507, 9, 0, 0, '2a0e:0:1:3015:8000::3626', 1, '', 0, NULL, '', 0, NULL);

+ if you want to create these queries you can add all ipv6 addresses into the  ipv6_list.txt file and save it.

+ then run ipv6-virt.sh script to generate the queries that you want.

+ note that you need to edit the ipv6-virt.sh file and change these values:

start_id= #this is the ipid in the table, you need to set this so it can give each row an id that is unique.

IPPID= #this is the ippid in the table



