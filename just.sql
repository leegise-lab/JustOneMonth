CREATE DATABASE justone

USE justonemonth
create table item_list(
                          up_idx BIGINT AUTO_INCREMENT PRIMARY KEY,
                          up_name VARCHAR(100) NOT null,
                          up_category1 int(100) NOT NULL,
                          up_category2 int(100) NOT NULL ,
                          up_color VARCHAR(100) NOT NULL,
                        	up_price INT (100)NOT NULL,
                          up_size VARCHAR (100) NOT NULL,
                          up_file1 VARCHAR(100) ,
                          up_file2 VARCHAR(100) ,
                          up_file3 VARCHAR(100) ,
                          up_file4 VARCHAR(100) ,
                          up_file5 VARCHAR(100) ,
                          up_file6 VARCHAR(100) ,
                          up_file7 VARCHAR(100) ,
                          up_file8 VARCHAR(100) ,
                          up_file9 VARCHAR(100) ,                          
                          up_date DATETIME DEFAULT NOW()
);
DROP TABLE item_list
DROP TABLE tb_review
/// 리뷰 테이블
SELECT * FROM item_list
SELECT * FROM tb_review
CREATE TABLE tb_review(
                          re_idx BIGINT AUTO_INCREMENT PRIMARY KEY,
                          re_userid VARCHAR (20) NOT NULL,
                          re_name VARCHAR (10) NOT NULL,
                          re_content VARCHAR (1000) NOT NULL,
                          re_image VARCHAR (50) DEFAULT NULL,
                          re_regdate DATETIME DEFAULT NOW(),
                          re_itemidx BIGINT NOT NULL,
                          FOREIGN KEY (re_itemidx)REFERENCES item_list(up_idx)
);
SELECT * FROM item_list
INSERT INTO tb_review(re_userid, re_name , re_content,re_itemidx) VALUES ('orange','오렌지','내용',3)
	SELECT re_userid,re_name,re_content,re_regdate,re_boardidx ,re_file FROM item_reply WHERE re_boardidx=3 ORDER BY re_idx DESC 
	tb_reply
INSERT INTO item_list (up_name,up_category1,up_category2,up_color,up_price,up_size,up_file1,up_file2,up_file3,up_file4,up_file5,up_file6,up_file7,up_file8,up_file9) VALUES ('프반 스퀘어넥 코듀로이 원피스',3,1,'라이트베이지 블랙 네이비',18900,'FREE','043002002129.jpg'
,'KU-201029DA21350_02.jpg','KU-201029DA21350_c.jpg','KU-201029DA21350_m.jpg','KU-201029DA21350_03.jpg','KU-201029DA21350_d_01.jpg','d2d6e8f42648ef99.png','e2e32e.PNG','washing_tip_page.jpg');


INSERT INTO item_list (up_name,up_category1,up_category2,up_color,up_price,up_size,up_file1,up_file2,up_file3,up_file4,up_file5,up_file6,up_file7,up_file8,up_file9) VALUES ('골라입는 고인치포켓 기모셔츠(카라넥 3type)', 4,1,'(라운드카라)베이지 (라운드카라)블랙 (라운드카라)네이비 (기본카라)베이지 (기본카라)블랙 (기본카라)네이비 (차이나카라)베이지 (차이나카라)블랙 (차이나카라)네이비'
,21800,'FREE(55~77)','034002002292.jpg'
,'OA0407_01.jpg','OA0407_03.jpg','OA0407_05.jpg','OA0407_07.jpg','OA0407_09.jpg','OA0407_11.jpg','china','washing_tip_page.jpg');

INSERT INTO item_list (up_name,up_category1,up_category2,up_color,up_price,up_size,up_file1,up_file2,up_file3,up_file4,up_file5,up_file6,up_file7,up_file8,up_file9) VALUES ('듀나 단추 기모 배기팬츠',2,3,
'크림 다크브라운 블랙',29800,'S(55) (66) L(77)','040003001588.jpg'
,'SE-201027DA21330_02.jpg','SE-201027DA21330_c.jpg','SE-201027DA21330_m.jpg','SE-201027DA21330_08.jpg','SE-201027DA21330_d_01.jpg','412aed33cecce8e1.png','pants.PNG','washing_tip_page.jpg');



INSERT INTO item_list (up_name,up_category1,up_category2,up_color,up_price,up_size,up_file1,up_file2,up_file3,up_file4,up_file5,up_file6,up_file7,up_file8,up_file9) VALUES ('포제리 밴딩 양털 후드집업',1,4,'라이트베이지 라이트블루 블랙 핑크',36900,'FREE(55~88)','062002000869.jpg'
,'KU-201029DA21349_02.jpg','KU-201029DA21349_c.jpg','KU-201029DA21349_m_01.jpg','KU-201029DA21349_06.jpg','KU-201029DA21349_11.jpg','56e1bf4fe138cfd0.png','zip.PNG','washing_tip_page.jpg');

INSERT INTO item_list (up_name,up_category1,up_category2,up_color,up_price,up_size,up_file1,up_file2,up_file3,up_file4,up_file5,up_file6,up_file7,up_file8,up_file9) VALUES ('프반 스퀘어넥 코듀로이 원피스',3,1,'라이트베이지 블랙 네이비',18900,'FREE','043002002129.jpg'
,'KU-201029DA21350_02.jpg','KU-201029DA21350_c.jpg','KU-201029DA21350_m.jpg','KU-201029DA21350_03.jpg','KU-201029DA21350_d_01.jpg','d2d6e8f42648ef99.png','e2e32e.PNG','washing_tip_page.jpg');

// 회원정보
create table tb_member
(
    mem_idx      BIGINT auto_increment primary key,
    mem_userid   varchar(20) unique not null,
    mem_pass     varchar(200)       not null,
    mem_name     varchar(10)        not null,
    mem_birth    char(8)            not null,
    mem_gender   enum ('남자', '여자'),
    mem_email    varchar(100),
    mem_hp       varchar(20) not null ,
    mem_zipcode  char(5),
    mem_address1 varchar(200),
    mem_address2 varchar(200),
    mem_regdate  datetime default now()
);
DROP TABLE tb_member
SELECT * FROM tb_member
SELECT * FROM tb_cart
insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp, mem_zipcode, mem_address1, mem_address2 )
VALUES ('admin_juston', '1234', '관리자', '15001103','남자','admin@naver.com','010-9999-9999','06621','강남구 압구정동','멋진 빌라');

insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp,  mem_zipcode, mem_address1, mem_address2 )
VALUES ('id6', '비번', '이름', '생일','남자','이메일','폰번','우편번호','주소1','주소2');

insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp,  mem_zipcode, mem_address1, mem_address2 )
VALUES ('id7', '비번', '이름', '생일','남자','이메일','폰번','우편번호','주소1','주소2');

insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp,  mem_zipcode, mem_address1, mem_address2 )
VALUES ('id8', '비번', '이름', '생일','남자','이메일','폰번','우편번호','주소1','주소2');

insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp,  mem_zipcode, mem_address1, mem_address2 )
VALUES ('id9', '비번', '이름', '생일','남자','이메일','폰번','우편번호','주소1','주소2');

insert into tb_member (mem_userid, mem_pass, mem_name, mem_birth, mem_gender, mem_email, mem_hp,  mem_zipcode, mem_address1, mem_address2 )
VALUES ('dowkeg', '비번', '이름', '생일','남자','이메일','폰번','우편번호','주소1','주소2');



// 기세씨
DROP TABLE tb_order
create table tb_order
(
    delivery_num  varchar(20) NOT NULL,
    order_num     varchar(20) NOT NULL,
    order_id      varchar(20) NOT NULL,
    order_name varchar(20) NOT NULL,
    order_mail    varchar(20) NOT NULL,
    order_hp varchar (20) NOT NULL,
    order_address TEXT        NOT NULL,
    pay_type      text NOT NULL,
    pay_price     varchar(20) NOT NULL,
    product_name   text        NOT NULL,
    delivery_finish boolean  DEFAULT 0,
    pay_finish    boolean    DEFAULT 0,
    pay_date      datetime DEFAULT now()
);
DROP TABLE tb_order
// 하량씨

DROP TABLE tb_order
create table tb_reply (
    reply_no int auto_increment primary key,
    article_no int not null default 0,
    re_content text not null,
    re_regdate datetime default now(),
    FOREIGN KEY(article_no) REFERENCES tb_board(idx)
);
SELECT * FROM tb_reply
DROP TABLE tb_reply
DROP TABLE tb_board 
insert into tb_board ( user_id, category, title, contents ) values ( 'admin' ,'[공지]', '배/송/공/지', '
평균 배송기간은 주문결제 후 약 1-5일 소요되고 있으며<br/>
<br/>
상품에 따라 주문폭주 및 거래처 제작 사정으로 인해 평균 배송기간보다<br/>
2~4일 더 지연될 수도 있습니다.<br/><br/>

시간적 여유를 가지고 넉넉히 주문 넣어주시면 최대한 준비되는대로<br/>
발송해드리겠습니다 :D<br/><br/><br/>


*죄송하게도 거래처 사정으로 품절이 발생할 수 있습니다.<br/>
품절시 문자 및 유선안내 진행되오니 양해부탁드립니다.<br/><br/>

품절상품에 대한 취소 및 변경가능합니다.');

insert into tb_board ( user_id, category, title, contents ) values ('admin' ,'[공지]', '상품문의는 상품명과 같이 기재부탁드립니다 :)', '
상품문의시 상품명을 빼고 질문만 해주시면 어떤 상품인지 알수가 없습니다. ㅜㅜ<br/><br/>

상품명을 같이 기재하여 문의해주시면 성심성의껏 답변드리겠습니다!^^');

insert into tb_board ( user_id, category, title, contents ) values ('admin' ,'[공지]', '입금안내', '
<br/>1. 입금자명이 상이한 경우<br/>
2. 입금금액이 다른 경우<br/>
3. 다수 주문서 작성 후 한 번에 입금하신 경우<br/>
4. 선택한 은행이 아닌 다른은행으로 입금하신 경우<br/><br/>

등등의 기타 사유로 인해 입금매칭이 되지 않을 수 있습니다.<br/>
입금하신 후 미입금안내 문자를 받으셨다면 게시판으로 문의부탁드립니다.');

insert into tb_board ( user_id, category, title, contents ) values ('admin' ,'[공지]', '배송전 취소 및 변경안내', '

배송전 취소 및 변경안내<br/><br/>

1. [상품준비] 단계에서 직접 취소&변경가능합니다.<br/>
[마이페이지 -> 주문내역조회-> 주문상세조회]에서 취소&변경 신청하기<br/><br/>

2. [배송준비] 단계인 경우 게시판이나 고객센터로 취소 및 변경 가능여부 확인바랍니다.<br/>
전산상 배송준비 단계더라도, 연동시간이 소요되어 고객님께 이미 발송되었을 경우에는<br/>
취소 변경어렵습니다<br/><br/>

3. [배송중,배송완료]인 경우에는 취소,변경불가');

insert into tb_board ( user_id, category, title, contents ) values ('admin' ,'[공지]', '교환 및 반품', '▶ 교환 및 반품안내<br/><br/>

상품수령후 7일내 구매내역 상세에서 교환 반품 버튼을 눌러 신청부탁드립니다.<br/>
지정된 택배사 반품을 누르시면 CJ대한통운으로 접수됩니다<br/>
타택배이용고객님은 개별반품을 눌러주시구요 타택배 반품주소로 보내주시면되세요 :-)<br/><br/>

반품주소: 서울 광진구 자양동 131 CJ대한통운 광진지점 자양우리대리점 저스트원 앞<br/>
타택배 이용시 : 서울 성동구 성수동2가 314-37 아연디지털타워 6층 저스트원 앞<br/><br/>

▶ 배송비 ( 입금 or 셀프결제 )<br/><br/>

- 단순 사이즈, 색상교환 : 5,000원<br/>
- 일부반품 2500원 / 전체반품 5000원 (결제하신 초기배송비는 환불해드립니다.)<br/>
단, 무료배송, 무료배송쿠폰 사용후 반품시 배송비 발생됩니다.<br/>
타택배착불이용시 추가운임료 부담해주셔하오니 참고바랍니다<br/><br/>

배송비 입금계좌 : 우리은행 1005-302-421987 (주)제이오진<br/><br/>

▶ 교환 / 반품 불가항목<br/><br/>

-상품 수령 후 7일이 경과된 경우<br/>
-세일상품 및 이벤트 상품 등 미리 공지된 경우<br/>
-상품 착용 및 세탁, 수선, 택제거, 화장품 얼룩, 향수 등으로 상품가치가 손상된 경우<br/>
-단춧구멍을 표기한 초크자국은 세탁시 지워지므로 교환반품 불가합니다.<br/>
-단춧구멍이 막혀있는 경우 칼이나 가위로 가운데를 터서 사용해주세요.<br/>
-단순실밥은 컷팅후 착용부탁드립니다.<br/>
');

// 진영씨

CREATE TABLE tb_board
(
    idx        INT(11)     NOT NULL AUTO_INCREMENT,
    user_id    VARCHAR(50) NULL DEFAULT NULL,
    category   VARCHAR(50) NOT NULL,
    email      VARCHAR(50) NULL DEFAULT NULL,
    title      VARCHAR(50) NULL DEFAULT NULL,
    contents   TEXT        NULL DEFAULT NULL,
    count      INT(11)     NULL DEFAULT NULL,
    created_at DATETIME    NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    answer_yn  INT(1)      NULL DEFAULT NULL,
    file_path  VARCHAR(50) NULL DEFAULT NULL,
    file_name  VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (`idx`) USING BTREE
);

DROP TABLE tb_board

alter table tb_board modify column answer_yn enum('Y', 'N');
alter table tb_board add hp varchar(20);
DROP TABLE tb_cart
create table tb_cart
(
    cart_idx           bigint auto_increment
        primary key,
    cart_amount        int              not null,
    cart_deliveryprice int default 2500 not null,
    cart_productprice  int              not null,
    cart_productname   varchar(100)     not null,
    cart_productimg    VARCHAR(50)             ,
    cart_ordernum      text             null,
    cart_color         varchar(20)      not null,
    cart_size          varchar(20)      not null,
    cart_userid        VARCHAR(100)      not null,
    constraint tb_cart_ibfk_1
        foreign key (cart_userid) references tb_member (mem_userid)
            on delete cascade
);
SELECT * FROM item_list
SELECT * FROM tb_member
DROP TABLE tb_member
SELECT * FROM tb_cart
delte 
SELECT * FROM tb_board;

DROP TABLE tb_cart

INSERT INTO tb_cart (cart_userid, cart_amount, cart_productprice, cart_productname, cart_color, cart_size)
VALUES ('id5', 1, , '듀나 단추 기모 배기팬츠', '크림', #{cart_size})

SELECT * FROM tb_reply;
