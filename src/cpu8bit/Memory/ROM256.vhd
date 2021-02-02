
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM256 is
Port(
	adr : in STD_LOGIC_VECTOR(7 downto 0);
	En : in STD_LOGIC;
	DO : out STD_LOGIC_VECTOR(7 downto 0)
);
end ROM256;

architecture Behavioral of ROM256 is

component Mux64 is
Port(
	sel : in STD_LOGIC_VECTOR(5 downto 0);
	
	I0, I1, I2, I3, I4, I5, I6, I7,
	I8, I9, I10, I11, I12, I13, I14, I15,
	I16, I17, I18, I19, I20, I21, I22, I23,
	I24, I25, I26, I27, I28, I29, I30, I31,
	I32, I33, I34, I35, I36, I37, I38, I39,
	I40, I41, I42, I43, I44, I45, I46, I47,
	I48, I49, I50, I51, I52, I53, I54, I55,
	I56, I57, I58, I59, I60, I61, I62, I63
	: in STD_LOGIC_VECTOR(7 downto 0);
	
	d : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

component Mux4 is
Port(
	I0, I1, I2, I3 : in STD_LOGIC_VECTOR(7 downto 0);
	sel : in STD_LOGIC_VECTOR(1 downto 0);
	o : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;

signal I : STD_LOGIC_VECTOR(2047 downto 0);
signal DO_aux : STD_LOGIC_VECTOR(7 downto 0);

signal M0_d, M1_d, M2_d, M3_d : STD_LOGIC_VECTOR(7 downto 0); 

begin

	DO(0) <= DO_aux(0) and En;
	DO(1) <= DO_aux(1) and En;
	DO(2) <= DO_aux(2) and En;
	DO(3) <= DO_aux(3) and En;
	DO(4) <= DO_aux(4) and En;
	DO(5) <= DO_aux(5) and En;
	DO(6) <= DO_aux(6) and En;
	DO(7) <= DO_aux(7) and En;
	
	M4: Mux4 port map(M0_d, M1_d, M2_d, M3_d, adr(7 downto 6), DO_aux);

	M64_0: Mux64 port map(
		adr(5 downto 0),

		I(7    downto 0   ), I(15   downto 8   ), I(23   downto 16  ), I(31   downto 24  ), I(39   downto 32  ), I(47   downto 40  ), I(55   downto 48  ), I(63   downto 56  ), 
		I(71   downto 64  ), I(79   downto 72  ), I(87   downto 80  ), I(95   downto 88  ), I(103  downto 96  ), I(111  downto 104 ), I(119  downto 112 ), I(127  downto 120 ), 
		I(135  downto 128 ), I(143  downto 136 ), I(151  downto 144 ), I(159  downto 152 ), I(167  downto 160 ), I(175  downto 168 ), I(183  downto 176 ), I(191  downto 184 ), 
		I(199  downto 192 ), I(207  downto 200 ), I(215  downto 208 ), I(223  downto 216 ), I(231  downto 224 ), I(239  downto 232 ), I(247  downto 240 ), I(255  downto 248 ), 
		I(263  downto 256 ), I(271  downto 264 ), I(279  downto 272 ), I(287  downto 280 ), I(295  downto 288 ), I(303  downto 296 ), I(311  downto 304 ), I(319  downto 312 ), 
		I(327  downto 320 ), I(335  downto 328 ), I(343  downto 336 ), I(351  downto 344 ), I(359  downto 352 ), I(367  downto 360 ), I(375  downto 368 ), I(383  downto 376 ), 
		I(391  downto 384 ), I(399  downto 392 ), I(407  downto 400 ), I(415  downto 408 ), I(423  downto 416 ), I(431  downto 424 ), I(439  downto 432 ), I(447  downto 440 ), 
		I(455  downto 448 ), I(463  downto 456 ), I(471  downto 464 ), I(479  downto 472 ), I(487  downto 480 ), I(495  downto 488 ), I(503  downto 496 ), I(511  downto 504 ), 

		M0_d
	);
	
	M64_1: Mux64 port map(
		adr(5 downto 0),

		I(519  downto 512 ), I(527  downto 520 ), I(535  downto 528 ), I(543  downto 536 ), I(551  downto 544 ), I(559  downto 552 ), I(567  downto 560 ), I(575  downto 568 ), 
		I(583  downto 576 ), I(591  downto 584 ), I(599  downto 592 ), I(607  downto 600 ), I(615  downto 608 ), I(623  downto 616 ), I(631  downto 624 ), I(639  downto 632 ), 
		I(647  downto 640 ), I(655  downto 648 ), I(663  downto 656 ), I(671  downto 664 ), I(679  downto 672 ), I(687  downto 680 ), I(695  downto 688 ), I(703  downto 696 ), 
		I(711  downto 704 ), I(719  downto 712 ), I(727  downto 720 ), I(735  downto 728 ), I(743  downto 736 ), I(751  downto 744 ), I(759  downto 752 ), I(767  downto 760 ), 
		I(775  downto 768 ), I(783  downto 776 ), I(791  downto 784 ), I(799  downto 792 ), I(807  downto 800 ), I(815  downto 808 ), I(823  downto 816 ), I(831  downto 824 ), 
		I(839  downto 832 ), I(847  downto 840 ), I(855  downto 848 ), I(863  downto 856 ), I(871  downto 864 ), I(879  downto 872 ), I(887  downto 880 ), I(895  downto 888 ), 
		I(903  downto 896 ), I(911  downto 904 ), I(919  downto 912 ), I(927  downto 920 ), I(935  downto 928 ), I(943  downto 936 ), I(951  downto 944 ), I(959  downto 952 ), 
		I(967  downto 960 ), I(975  downto 968 ), I(983  downto 976 ), I(991  downto 984 ), I(999  downto 992 ), I(1007 downto 1000), I(1015 downto 1008), I(1023 downto 1016), 

		M1_d
	);
	
	M64_2: Mux64 port map(
		adr(5 downto 0),
		
		I(1031 downto 1024), I(1039 downto 1032), I(1047 downto 1040), I(1055 downto 1048), I(1063 downto 1056), I(1071 downto 1064), I(1079 downto 1072), I(1087 downto 1080), 
		I(1095 downto 1088), I(1103 downto 1096), I(1111 downto 1104), I(1119 downto 1112), I(1127 downto 1120), I(1135 downto 1128), I(1143 downto 1136), I(1151 downto 1144), 
		I(1159 downto 1152), I(1167 downto 1160), I(1175 downto 1168), I(1183 downto 1176), I(1191 downto 1184), I(1199 downto 1192), I(1207 downto 1200), I(1215 downto 1208), 
		I(1223 downto 1216), I(1231 downto 1224), I(1239 downto 1232), I(1247 downto 1240), I(1255 downto 1248), I(1263 downto 1256), I(1271 downto 1264), I(1279 downto 1272), 
		I(1287 downto 1280), I(1295 downto 1288), I(1303 downto 1296), I(1311 downto 1304), I(1319 downto 1312), I(1327 downto 1320), I(1335 downto 1328), I(1343 downto 1336), 
		I(1351 downto 1344), I(1359 downto 1352), I(1367 downto 1360), I(1375 downto 1368), I(1383 downto 1376), I(1391 downto 1384), I(1399 downto 1392), I(1407 downto 1400), 
		I(1415 downto 1408), I(1423 downto 1416), I(1431 downto 1424), I(1439 downto 1432), I(1447 downto 1440), I(1455 downto 1448), I(1463 downto 1456), I(1471 downto 1464), 
		I(1479 downto 1472), I(1487 downto 1480), I(1495 downto 1488), I(1503 downto 1496), I(1511 downto 1504), I(1519 downto 1512), I(1527 downto 1520), I(1535 downto 1528), 

		M2_d
	);
	
	M64_3: Mux64 port map(
		adr(5 downto 0),
		
		I(1543 downto 1536), I(1551 downto 1544), I(1559 downto 1552), I(1567 downto 1560), I(1575 downto 1568), I(1583 downto 1576), I(1591 downto 1584), I(1599 downto 1592), 
		I(1607 downto 1600), I(1615 downto 1608), I(1623 downto 1616), I(1631 downto 1624), I(1639 downto 1632), I(1647 downto 1640), I(1655 downto 1648), I(1663 downto 1656), 
		I(1671 downto 1664), I(1679 downto 1672), I(1687 downto 1680), I(1695 downto 1688), I(1703 downto 1696), I(1711 downto 1704), I(1719 downto 1712), I(1727 downto 1720), 
		I(1735 downto 1728), I(1743 downto 1736), I(1751 downto 1744), I(1759 downto 1752), I(1767 downto 1760), I(1775 downto 1768), I(1783 downto 1776), I(1791 downto 1784), 
		I(1799 downto 1792), I(1807 downto 1800), I(1815 downto 1808), I(1823 downto 1816), I(1831 downto 1824), I(1839 downto 1832), I(1847 downto 1840), I(1855 downto 1848), 
		I(1863 downto 1856), I(1871 downto 1864), I(1879 downto 1872), I(1887 downto 1880), I(1895 downto 1888), I(1903 downto 1896), I(1911 downto 1904), I(1919 downto 1912), 
		I(1927 downto 1920), I(1935 downto 1928), I(1943 downto 1936), I(1951 downto 1944), I(1959 downto 1952), I(1967 downto 1960), I(1975 downto 1968), I(1983 downto 1976), 
		I(1991 downto 1984), I(1999 downto 1992), I(2007 downto 2000), I(2015 downto 2008), I(2023 downto 2016), I(2031 downto 2024), I(2039 downto 2032), I(2047 downto 2040), 

		M3_d
	);

	I(15   downto 0   ) <= "0000000000000000";
	I(31   downto 16  ) <= "0000000000000000";
	I(47   downto 32  ) <= "0000000000000000";
	I(63   downto 48  ) <= "0000000000000000";
	I(79   downto 64  ) <= "0000000000000000";
	I(95   downto 80  ) <= "0000000000000000";
	I(111  downto 96  ) <= "0000000000000000";
	I(127  downto 112 ) <= "0000000000000000";
	I(143  downto 128 ) <= "0000000000000000";
	I(159  downto 144 ) <= "0000000000000000";
	I(175  downto 160 ) <= "0000000000000000";
	I(191  downto 176 ) <= "0000000000000000";
	I(207  downto 192 ) <= "0000000000000000";
	I(223  downto 208 ) <= "0000000000000000";
	I(239  downto 224 ) <= "0000000000000000";
	I(255  downto 240 ) <= "0000000000000000";
	I(271  downto 256 ) <= "0000000000000000";
	I(287  downto 272 ) <= "0000000000000000";
	I(303  downto 288 ) <= "0000000000000000";
	I(319  downto 304 ) <= "0000000000000000";
	I(335  downto 320 ) <= "0000000000000000";
	I(351  downto 336 ) <= "0000000000000000";
	I(367  downto 352 ) <= "0000000000000000";
	I(383  downto 368 ) <= "0000000000000000";
	I(399  downto 384 ) <= "0000000000000000";
	I(415  downto 400 ) <= "0000000000000000";
	I(431  downto 416 ) <= "0000000000000000";
	I(447  downto 432 ) <= "0000000000000000";
	I(463  downto 448 ) <= "0000000000000000";
	I(479  downto 464 ) <= "0000000000000000";
	I(495  downto 480 ) <= "0000000000000000";
	I(511  downto 496 ) <= "0000000000000000";
	I(527  downto 512 ) <= "0000000000000000";
	I(543  downto 528 ) <= "0000000000000000";
	I(559  downto 544 ) <= "0000000000000000";
	I(575  downto 560 ) <= "0000000000000000";
	I(591  downto 576 ) <= "0000000000000000";
	I(607  downto 592 ) <= "0000000000000000";
	I(623  downto 608 ) <= "0000000000000000";
	I(639  downto 624 ) <= "0000000000000000";
	I(655  downto 640 ) <= "0000000000000000";
	I(671  downto 656 ) <= "0000000000000000";
	I(687  downto 672 ) <= "0000000000000000";
	I(703  downto 688 ) <= "0000000000000000";
	I(719  downto 704 ) <= "0000000000000000";
	I(735  downto 720 ) <= "0000000000000000";
	I(751  downto 736 ) <= "0000000000000000";
	I(767  downto 752 ) <= "0000000000000000";
	I(783  downto 768 ) <= "0000000000000000";
	I(799  downto 784 ) <= "0000000000000000";
	I(815  downto 800 ) <= "0000000000000000";
	I(831  downto 816 ) <= "0000000000000000";
	I(847  downto 832 ) <= "0000000000000000";
	I(863  downto 848 ) <= "0000000000000000";
	I(879  downto 864 ) <= "0000000000000000";
	I(895  downto 880 ) <= "0000000000000000";
	I(911  downto 896 ) <= "0000000000000000";
	I(927  downto 912 ) <= "0000000000000000";
	I(943  downto 928 ) <= "0000000000000000";
	I(959  downto 944 ) <= "0000000000000000";
	I(975  downto 960 ) <= "0000000000000000";
	I(991  downto 976 ) <= "0000000000000000";
	I(1007 downto 992 ) <= "0000000000000000";
	I(1023 downto 1008) <= "0000000000000000";
	I(1039 downto 1024) <= "0000000000000000";
	I(1055 downto 1040) <= "0000000000000000";
	I(1071 downto 1056) <= "0000000000000000";
	I(1087 downto 1072) <= "0000000000000000";
	I(1103 downto 1088) <= "0000000000000000";
	I(1119 downto 1104) <= "0000000000000000";
	I(1135 downto 1120) <= "0000000000000000";
	I(1151 downto 1136) <= "0000000000000000";
	I(1167 downto 1152) <= "0000000000000000";
	I(1183 downto 1168) <= "0000000000000000";
	I(1199 downto 1184) <= "0000000000000000";
	I(1215 downto 1200) <= "0000000000000000";
	I(1231 downto 1216) <= "0000000000000000";
	I(1247 downto 1232) <= "0000000000000000";
	I(1263 downto 1248) <= "0000000000000000";
	I(1279 downto 1264) <= "0000000000000000";
	I(1295 downto 1280) <= "0000000000000000";
	I(1311 downto 1296) <= "0000000000000000";
	I(1327 downto 1312) <= "0000000000000000";
	I(1343 downto 1328) <= "0000000000000000";
	I(1359 downto 1344) <= "0000000000000000";
	I(1375 downto 1360) <= "0000000000000000";
	I(1391 downto 1376) <= "0000000000000000";
	I(1407 downto 1392) <= "0000000000000000";
	I(1423 downto 1408) <= "0000000000000000";
	I(1439 downto 1424) <= "0000000000000000";
	I(1455 downto 1440) <= "0000000000000000";
	I(1471 downto 1456) <= "0000000000000000";
	I(1487 downto 1472) <= "0000000000000000";
	I(1503 downto 1488) <= "0000000000000000";
	I(1519 downto 1504) <= "0000000000000000";
	I(1535 downto 1520) <= "0000000000000000";
	I(1551 downto 1536) <= "0000000000000000";
	I(1567 downto 1552) <= "0000000000000000";
	I(1583 downto 1568) <= "0000000000000000";
	I(1599 downto 1584) <= "0000000000000000";
	I(1615 downto 1600) <= "0000000000000000";
	I(1631 downto 1616) <= "0000000000000000";
	I(1647 downto 1632) <= "0000000000000000";
	I(1663 downto 1648) <= "0000000000000000";
	I(1679 downto 1664) <= "0000000000000000";
	I(1695 downto 1680) <= "0000000000000000";
	I(1711 downto 1696) <= "0000000000000000";
	I(1727 downto 1712) <= "0000000000000000";
	I(1743 downto 1728) <= "0000000000000000";
	I(1759 downto 1744) <= "0000000000000000";
	I(1775 downto 1760) <= "0000000000000000";
	I(1791 downto 1776) <= "0000000000000000";
	I(1807 downto 1792) <= "0000000000000000";
	I(1823 downto 1808) <= "0000000000000000";
	I(1839 downto 1824) <= "0000000000000000";
	I(1855 downto 1840) <= "0000000000000000";
	I(1871 downto 1856) <= "0000000000000000";
	I(1887 downto 1872) <= "0000000000000000";
	I(1903 downto 1888) <= "0000000000000000";
	I(1919 downto 1904) <= "0000000000000000";
	I(1935 downto 1920) <= "0000000000000000";
	I(1951 downto 1936) <= "0000000000000000";
	I(1967 downto 1952) <= "0000000000000000";
	I(1983 downto 1968) <= "0000000000000000";
	I(1999 downto 1984) <= "0000000000000000";
	I(2015 downto 2000) <= "0000000000000000";
	I(2031 downto 2016) <= "0000000000000000";
	I(2047 downto 2032) <= "0000000000000000";

end Behavioral;

