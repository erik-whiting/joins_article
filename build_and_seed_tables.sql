CREATE TABLE IF NOT EXISTS public.countries
(
  id SERIAL PRIMARY KEY,
  country_name CHARACTER VARYING(40)
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.countries OWNER TO postgres;

INSERT INTO countries VALUES
(1, 'United States'),
(2, 'Mexico'),
(3, 'Canada'),
(4, 'Greenland'),
(5, 'Iceland');

CREATE TABLE IF NOT EXISTS public.addresses
(
  id SERIAL PRIMARY KEY,
  street_address CHARACTER VARYING(200),
  city CHARACTER VARYING(100),
  state_or_province CHARACTER VARYING (100),
  country_id BIGINT NOT NULL,
  CONSTRAINT fk_address_country FOREIGN KEY (country_id) REFERENCES countries(id)
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.addresses OWNER TO postgres;

INSERT INTO addresses VALUES
(1, '123 Main St', 'Houston', 'TX', 1),
(2, '1010 2nd St', 'Omaha', 'NE', 1),
(3, '220 C 30', 'Izamal', 'Yuc', 2),
(4, '3030 Burgos', 'Xalapa', 'Ver', 2),
(5, '558 Maple Ave', 'Toronto', 'ON', 3),
(6, '99 Jackson Rd', 'Flin Flon', 'MB', 3),
(7, '821 Carol', 'Nuuk', 'SQ', 4);


CREATE TABLE IF NOT EXISTS public.departments
(
  id SERIAL PRIMARY KEY,
  name CHARACTER VARYING(90)
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.departments OWNER TO postgres;

INSERT INTO departments VALUES
(1, 'Operations'),
(2, 'IT'),
(3, 'Legal'),
(4, 'HR'),
(5, 'Finance');


CREATE TABLE IF NOT EXISTS public.employees
(
  id SERIAL PRIMARY KEY,
  first_name CHARACTER VARYING(200),
  last_name CHARACTER VARYING(200),
  department_id BIGINT NOT NULL,
  address_id BIGINT,
  CONSTRAINT fk_employees_dept FOREIGN KEY (department_id) REFERENCES departments(id),
  CONSTRAINT fk_employees_address FOREIGN KEY (address_id) REFERENCES addresses(id)
)
WITH (
  OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employees OWNER TO postgres;

INSERT INTO employees VALUES
(1, 'Bob', 'Robertson',3 , 1),
(2, 'Jordan', 'Mays', 4, 3),
(3, 'Nicole', 'Nicholson', 3, 4),
(4, 'Erik', 'Whiting', 2, 2),
(5, 'Lina', 'Mazin', 1, 2),
(6, 'Sandra', 'Sto', 1, NULL);
