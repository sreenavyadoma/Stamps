CREATE DATABASE stamps;

CREATE TABLE user_credentials (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	username CHAR(16) NOT NULL UNIQUE, 
	password CHAR(16) NOT NULL, 	
	environment CHAR(5) NOT NULL,
	in_use TINYINT unsigned NOT NULL,
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
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());

INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());
INSERT INTO user_credentials (id, username, password, environment, in_use, user_status, user_role, comment, date_added) VALUES (NULL, 'xxxxxx', 'pass111', 'qacc', 0, 'Active', 'Meter Admin, Meter User', NULL, NOW());




























	account_status CHAR(20) NOT NULL, 
	account_type CHAR(16) NOT NULL, 
	last_name CHAR(20), NOT NULL 
	first_name CHAR(20) NOT NULL, 
	middle_name CHAR(20), 
	account_no CHAR(20), 
	meter_no CHAR(20), 
	account_info CHAR(20), 
	status_reason CHAR(20), 	
	email CHAR(20), 
	billing_address CHAR(20), 
	company_name CHAR(20), 
	phone_no CHAR(20), 