use vk; -- ������������� �� vk

show tables; -- ����� ���� ������ �� vk

select * from family_statuses; -- ����� ���������� �������

CREATE TABLE sex ( 
  id INT UNSIGNED NOT NULL PRIMARY KEY,
  name VARCHAR(10)
); -- �������� ����� ������� 
INSERT INTO `sex` (`id`, `name`) VALUES (1, '�������'); -- ���������� � ������ ����� ���������� � ��� ������� �� ����� ������� 
INSERT INTO `sex` (`id`, `name`) VALUES (2, '�������'); 


ALTER TABLE profiles ADD COLUMN family_status_id INT UNSIGNED AFTER hometown; -- ���������� ������� family_status_id � ������� profiles ����� ������� hometown 

UPDATE profiles SET family_status_id = FLOOR(1 + (RAND() * 2)); -- �������� �������� �������� family_status_id �� 1 �� 2 floor ��������� �������� �� �����

ALTER TABLE profiles DROP COLUMN user_id; -- �������� ������� user_id �� ������� profiles
ALTER TABLE profiles ADD COLUMN user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST; -- ���������� ������� user_id � ������� profiles



