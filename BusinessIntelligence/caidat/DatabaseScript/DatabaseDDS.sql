-- Database: StockDatabase

DROP DATABASE IF EXISTS "StockDatabaseDDS";

CREATE DATABASE "StockDatabaseDDS"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
--    LC_COLLATE = 'English_United States.1252'
--    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

\connect StockDatabaseDDS;
BEGIN;
-- Table: public.ThoiGian-GiaTriCoPhieu

DROP TABLE IF EXISTS public."thoigian-giatricophieu" CASCADE;

CREATE TABLE public."thoigian-giatricophieu"
(
    "ma-ngay" bigint UNIQUE NOT NULL,
    "date" date NOT NULL UNIQUE NOT NULL,
    "ngay" bigint NOT NULL,
    "thang" bigint NOT NULL,
    "nam" bigint NOT NULL,
    "tuan" bigint NOT NULL,
    CONSTRAINT "ThoiGian-GiaTriCoPhieu_pkey" PRIMARY KEY ("ma-ngay")
);


ALTER TABLE public."thoigian-giatricophieu"
    OWNER to postgres;

COMMENT ON TABLE public."thoigian-giatricophieu"
    IS 'Bang Chieu Thoi Gian Cua Co Phieu';

-- Table: public.SanGiaoDich

DROP TABLE IF EXISTS public."sangiaodich" CASCADE;

CREATE TABLE public."sangiaodich"
(
    "ma-san" bigint UNIQUE NOT NULL,
    "ten-san" text COLLATE pg_catalog."default",
    CONSTRAINT "SanGiaoDich_pkey" PRIMARY KEY ("ma-san")
);

ALTER TABLE public."sangiaodich"
    OWNER to postgres;

COMMENT ON TABLE public."sangiaodich"
    IS 'Bang Chieu San Giao Dich';

-- Table: public.CoPhieu

DROP TABLE IF EXISTS public."cophieu" CASCADE;

CREATE TABLE public."cophieu"
(
    "ma-co-phieu" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "ten-cong-ty" text COLLATE pg_catalog."default",
    "tong-co-phieu-luu-hanh" bigint,
    "phan-loai-gia-tri" text COLLATE pg_catalog."default",
    "linh-vuc" text COLLATE pg_catalog."default",
    "ma-san" text COLLATE pg_catalog."default",
    CONSTRAINT "CoPhieu_pkey" PRIMARY KEY ("ma-co-phieu")
)

TABLESPACE pg_default;

ALTER TABLE public."cophieu"
    OWNER to postgres;

COMMENT ON TABLE public."cophieu"
    IS 'Bang Chieu Co Phieu';

-- Table: public.nganhkinhdoanh

DROP TABLE IF EXISTS public."nganhkinhdoanh" CASCADE;

CREATE TABLE public."nganhkinhdoanh"
(
    "ma-nganh" bigint UNIQUE NOT NULL,
    "ma-nganh-source" bigint,
    "ten-nganh" text COLLATE pg_catalog."default",
    CONSTRAINT "nganhkinhdoanh_pkey" PRIMARY KEY ("ma-nganh")
)

TABLESPACE pg_default;

-- Table: public.phannganh

DROP TABLE IF EXISTS public."phannganh" CASCADE;

CREATE TABLE public."phannganh"
(
    "ma-nganh" bigint,
    "ma-phan-nganh" bigint,
    "ten-phan-nganh" text COLLATE pg_catalog."default",
    CONSTRAINT "phannganh_pkey" PRIMARY KEY ("ma-nganh", "ma-phan-nganh")
)

TABLESPACE pg_default;

-- ALTER TABLE public."phapnhangiaodich"
--     ADD CONSTRAINT "FK_MaLinhVuc" FOREIGN KEY ("ma-linh-vuc")
--     REFERENCES public."roomlinhvuc" ("ma-linh-vuc")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- Table: public.GiaTriCoPhieu

DROP TABLE IF EXISTS public."giatricophieu" CASCADE;

CREATE TABLE public."giatricophieu"
(
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ma-cong-ty-phat-hanh" text COLLATE pg_catalog."default",
    "san-giao-dich" text COLLATE pg_catalog."default",
    "ngay" date,
    "ma-ngay" bigint,
    "gia-mo-cua" double precision,
    "gia-dong-cua" double precision,
    "gia-cao-nhat" double precision,
    "gia-thap-nhat" double precision,
    "so-luong-co-phieu" bigint,
    "he-so-thanh-khoan" double precision,
    "volume" double precision,
    CONSTRAINT "GiaTriCoPhieu_pkey" PRIMARY KEY ("ma-co-phieu","ma-ngay")
)

TABLESPACE pg_default;

-- CREATE OR REPLACE FUNCTION calculate_avg() RETURNS TRIGGER AS $BODY$
--   BEGIN
--   NEW.ma20 := ( SELECT AVG(gia-dong-cua)
--                         FROM public."giatricophieu"
--                         WHERE ma-co-phieu = NEW.ma-co-phieu
--                         AND ngay>= NEW.ngay - INTERVAL '20 HOUR');

--   RETURN NEW;
--   END;
--   $BODY$
--  LANGUAGE plpgsql;


-- CREATE TRIGGER calculate_avg_trigger AFTER INSERT OR UPDATE 
--     ON giatricophieu FOR EACH ROW 
--     EXECUTE PROCEDURE calculate_avg();

-- Table: public.ChiSoTheoNgay

DROP TABLE IF EXISTS public."chisotheongay" CASCADE;

CREATE TABLE public."chisotheongay" 
(
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ma-loai" bigint,
    "ngay" date,
    "ma-ngay" bigint,
    "gia-tri" double precision,
    "ma-nganh" bigint,
    "ma-phan-nganh" bigint,
    CONSTRAINT "ChiSoTheoNgay_pkey" PRIMARY KEY ("ma-co-phieu","ma-loai","ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.ChiSoQuanTrongTheoNgay

DROP TABLE IF EXISTS public."chisoquantrongtheongay" CASCADE;

CREATE TABLE public."chisoquantrongtheongay" 
(
    "id" serial NOT NULL,
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ngay" date,
    "ma-ngay" bigint,
    "eps" double precision,
    "pe" double precision,
    "von-hoa" double precision,
    CONSTRAINT "ChiSoQuanTrongTheoNgay_pkey" PRIMARY KEY ("ma-co-phieu","ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.Thoigian-chiso

DROP TABLE IF EXISTS public."thoigian-chiso" CASCADE;

CREATE TABLE public."thoigian-chiso" 
(
    "ma-ngay" bigint UNIQUE NOT NULL,
    "date" date,
    "ngay" bigint,
    "thang" bigint,
    "nam" bigint,
    "tuan" bigint,
    CONSTRAINT "thoigian-chiso_pkey" PRIMARY KEY ("ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.Loaichiso

DROP TABLE IF EXISTS public."loaichiso" CASCADE;

CREATE TABLE public."loaichiso" 
(
    "ma-chi-so" bigint UNIQUE NOT NULL,
    "ten-chi-so" text COLLATE pg_catalog."default",
    CONSTRAINT "loaichiso_pkey" PRIMARY KEY ("ma-chi-so")
)

TABLESPACE pg_default;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("ngay")
--     REFERENCES public."thoigian-giatricophieu" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_SanGiaoDich" FOREIGN KEY ("san-gia-dich")
--     REFERENCES public."sangiaodich" ("ma-san")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("ma-cong-ty-phat-hanh")
--     REFERENCES public."congtyphathanh" ("ma-cong-ty")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_CoPhieu" FOREIGN KEY ("ma-co-phieu")
--     REFERENCES public."cophieu" ("ma-co-phieu")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE public."giatricophieu"
    OWNER to postgres;

COMMENT ON TABLE public."giatricophieu"
    IS 'Bang Fact Gia tri co phieu';

-- ALTER TABLE public."baocaotaichinhcongty"
--     ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("cong-ty-phat-hanh")
--     REFERENCES public."congtyphathanh" ("ma-cong-ty")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."baocaotaichinhcongty"
--     ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("thoi-diem-bao-cao")
--     REFERENCES public."thoigian-baocaotaichinh" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_PhapNhanGiaoDich" FOREIGN KEY ("phap-nhan-giao-dich")
--     REFERENCES public."phapnhangiaodich" ("ma-to-chuc")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_ThoiGianGiaoDich" FOREIGN KEY ("thoi-gian-giao-dich")
--     REFERENCES public."thoigian-giaodichcophieudacbiet" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_MaCoPhieu" FOREIGN KEY ("ma-co-phieu")
--     REFERENCES public."cophieu" ("ma-co-phieu")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

COMMIT;
