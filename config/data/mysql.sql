CREATE DATABASE stamps;
ALTER TABLE user_credentials ADD COLUMN in_use_time TIMESTAMP NOT NULL AFTER in_use;
GRANT ALL ON stamps.* TO rcruz;

UPDATE user_credentials SET user_credentials.in_use = 0 where username = 'cchrvv6qp';
select * from user_credentials where username = 'cchrvv6qp';

CREATE TABLE user_credentials (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	username CHAR(16) NOT NULL UNIQUE, 
	password CHAR(16) NOT NULL,
  test_env CHAR(5) NOT NULL,
	in_use TINYINT unsigned NOT NULL,
  in_use_date DATE NOT NULL,
  in_use_time DATE NOT NULL,
	account_status TINYINT unsigned NOT NULL,
	user_status CHAR(20) NOT NULL, 
	user_role CHAR(100) NOT NULL, 
	comment CHAR(200), 
	date_added DATE NOT NULL
);

INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cchrvv6qp', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cch1maxo3ygfk', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccy1qzgbk3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccyygzhuv2', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccjicx88o5tz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccixjqr1mt', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cciknhgc217', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cczehokrt6b', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccbrbh9chkhq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cczxq96spvzl', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cch17q3rcnj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccwr4o0fj2m', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccgbkhk86', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccvdxljnw0u', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccoovnm9y', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccxftv8vqwd8', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccuxmz2pu', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cccd59jdd1', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cch1diko9k', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccci395ao2dmob', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cct66h6a45x', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccvx65ajbq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccflk3r4fho', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccbvu1ri4', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccs2pr9qai6', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccnjxhrxqdea', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccszhksei26q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccdasjmgym', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccbc73g6z3qc1w', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccq1whuzi', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cch9xq5rtpuuj0', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccfaly2qge8f', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccqx4232iwz0', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccc2pibjl', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccyg3i7nvroz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccoiju2yc7nta3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccnskya524serx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccf4eo74i7', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cciohuv3l3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccal2j548ueixt', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccgaych583', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccwwuzm7n84', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cczehokrt6b', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccli81gjyf', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccpdwyxzxrfuuo', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccq89mdqfkohn', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccrqt0njv22', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccm8n1m8u2f5t8', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccbzmbc5mf', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccdfdsygmdgh2', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccjrofky09rja', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccehzjlux', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccumrgb1h', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccd06hnjx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccuxufnwdzmb', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccl0ks2wfjqcn', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccg33w4232', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cchph0q864mh', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccos8dfb746cg', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cci86p81ndb99c', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccoizuae8iffnw', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccf3uo9cjoq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cchzi36ay6wcv', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccz1gs3sfjzunr', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccbj4iufpz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cct6sj1z4g', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccuoptg6rv', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccfj3szid2zced', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccr5818iu', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccck9bat9u272', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccvm40okp12', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cco80r376', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccgf87kzhm75wy', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccm229brshq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccaz98jidd', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccqqoz4mj99m', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccy0q8392o6w8d', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccrtgih2soz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccppytzzy6u', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccdch4ew8q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccxbyitaewqm3r', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccg0vet7k7', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cch59tjlcq7y3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccjn80bm61vb', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccyvjxopxznj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccz9aa8h5ygxd', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccpy9a5szb9', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccspkvzy90', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccec1bdx3gees', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccxkn50rcvcm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccneaga32r', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'txdq1khl', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mpanilrcqgxmz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'lsv9xmm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'i18yzz9pt3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'lmyc7on9t', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ryzymjfr0s', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ifkirzik55td4h', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ybz43m9mrp6x', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'pbxeqimim', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'uughc31aenj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'w5s9lr2kett0', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'om8tabs4mx2', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'za0xh2034rmu8', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'rxkuzwwclobat', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'p74c4js', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cctibua3epgnq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'qp1z9dnytt62r', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ales8sj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'eubyiccm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'swd4e1ai4lz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cm5jn67dm05', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'pbgwtrqhe', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ma6sawp2uj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'iuc75alcb8', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xha5o97', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccshp1k9eg0qh', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'kulwyj9vs0f3kd', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mysfp0c9g', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mysfp0c9g', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'i92zdwav5', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'iotkm2t8nbf3', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'u0d9jawgcqaj', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xk0v35wf9ndq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccx9sfswq05pm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'knmeaba', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccje975fmb', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccslm4rnxg42q', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'swv6wmuno', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccx9sfswq05pm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccyobxzc3gq', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccmzk4brh5qgm', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccpwx5l3y86b', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cccy2r7bkbl0vp', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccomnqgyq170xz', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccvsedf2d', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cck8p3tmp3ee', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'cclea6xme7n8ka', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccfw2jpdg', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccjepoq84ze', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ccfoe2dgmz91ad', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());


#STAGING


INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgom0dqgzppy', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgo0e9lb9fpv', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgp6389urwj4', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgxz0386tftl1', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stge7x4xybj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgih31vmh', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgi0jkgbdy3xs', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgbh3mebdk6', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stggyotwzye', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgnagml24', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgzom0awk67', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgp6389urwj4', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgpa86i6exeaq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgtx2t22766vg', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stggm2z3od6o5t', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgo162k9hy', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgvoc0kcnt6rw', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgnhscvwnf', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgqklz1vjekq6', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgih31vmh', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stghwb2ojyi', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgs8713b6h', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stglu3dg6e4n', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgsc35s82cmlv', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stguspu8o4655f', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgo5krbjtc', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgswz5afiev', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgsqtuz7x2', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgld1uw4sroe7', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stghy955swcbcm', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stghi5sqaoe', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgvw4zzd8jgj7', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgbt9h9oleseq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgy8vviww576v', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgo0j3xg9kp2o', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgrym5ihjq8ct', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgtvq2xfm85et', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgmxelasxpm', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgp91jwqgvj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgrvoewgc201t', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgj8i2z4hkb1', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgmyq420argi2', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stguqdqnih', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgw0k8dhzo', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgd76d5a6an2', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgwcbp7zfwh', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgx3slcgzx7y', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgmvjak5bfr1', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgodca4qsozo', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgm2w98o9cerb', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgvrjacmfiat', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgozl1gt0sm7g', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgtwyde44v3', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgriysbcbw7zy', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stged0k1dq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgk093al8hji3', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgm8tbgv5ubu', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgd62qmfx', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgccoqkot', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgdbah0hr', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgssw8nb3zpho', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgs9dz6diu', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgfwpmg4qp', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgsbwtcsf0e6', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgbgvuyj1ypvg', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgti8jxq8cm', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgw0kxjmvgd', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgue5hryv', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgag0dpqqp19', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgxmprkalp44', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgum4i835po21', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgpoa24o3xe', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgbxeq2w5x6b', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stggmsyc7t', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgswgrj575eoa', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgzv5o8oqv23s', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgwgxvcjkucm', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgupr2smgtub', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stggx2jnf6n', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgghi616t', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stghkgtpwkxhk8', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgonw7nzydeio', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgir6pm3goo', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgzieusp1q', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgi3eicvj8d7b', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'i992vss4lipq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mwn2ghor', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgsj7lchcx30q', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'qksd97py', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ssk059sth', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'b0vffjuv', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'hh8tfayv0', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'qqn9ee7v', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'hfqxnmkdsi', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 's0ca2y0on9r6', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'jb47pt7wc', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'pxzip2a0mshfa', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'rp9qdyawdqqx8', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'm1imyz6hwk0lrn', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'n5r1wleq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'pm5lf5804', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'bpgjftki', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'td4wcrwb6f8mi', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'paxok4qecrbv', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'enpdd08aew5', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'tv3td1cp6', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xg6ar0zae', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'o6kzymy8rn94ax', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'x31q76qtkucf', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'q5bfct2', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'wwelioo2e0nlf', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mwnp2cwefg', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'vncmsvqa1', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'lngmwr21', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'fhix7qqr9', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'b25wtqtq3nvk5v', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'j2i75rsxxtj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'uk6oxddbk16', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'dks7plhj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'lxowg9cu', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'b9avaywj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 't8jnj7r4rwc1n', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'r185heirbqv76l', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xa4sk9jsk', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'wmzvi1kmzab7', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'h12wjdrskuyu', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'sm0z7fnr', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'dgskuwa16ion4m', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'q5z9uzb', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'enmsmy77n', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ehe96944qsb8', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'nnrvo1u9bpr', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'rappxugbk', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ko5cwhazj9csh', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'gazqbag62', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 't243vtu', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'rb5cc5xtkq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'urgnhlodv7zyvz', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 's582uohx', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'tkyf6l0', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgyoxkifp15', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'tc7lbuuldm7gud', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'gsw1raa5', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mi6cu3n0', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'n7n9kolwtc', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'qwjsdoq', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'yfq03xbol', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'z53ocf1', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'chzeav3fsz', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'z46dgktbl', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'w8u81mj', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'w6x3pwfwy', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'gl3ippf3slyiod', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'mtyni6ic0zcs', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'y619bx4cuj5', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgpsmuft2y', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'pj174e11wmg', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'htlylt2', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'uc7p0o9c3x6j8u', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'ubjr6w9i4eom5z', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'jr118nj7pf35', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'c1k4p8bga4cmg', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgyvngqz27b66', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'kocp1opzgz', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'stgsaufv05k13n', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'b2vc5867', 'pass111', 'stg', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());




















