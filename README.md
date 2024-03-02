## LiSQL

### Usage
```common-lisp
(ql:quickload :lisql)
(use-package :lisql)

(select * from account where id = "c49a8035-e59e-49ab-ad80-f51e2cd91001")
"SELECT * FROM ACCOUNT WHERE ID = 'c49a8035-e59e-49ab-ad80-f51e2cd91001'"

(insert into account (name) values ("cxxxr"))
"INSERT INTO ACCOUNT (NAME) VALUES ('cxxxr')"
```
