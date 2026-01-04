--
-- PostgreSQL database dump
--

\restrict 2ZTzz37v224FDfvlV6ofTdKfwgjH53OvY8oTAxcAmdQM6H2guiNV6FoiZuVWPWI

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (cust_id, cust_name) FROM stdin;
1	Sham
2	Raju
3	Paul
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (ord_id, ord_date, cust_id) FROM stdin;
1	2024-01-01	2
2	2024-02-01	1
3	2024-03-01	3
4	2024-04-04	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (p_id, p_name, price) FROM stdin;
1	Keyboard	800.00
2	Laptop	55000.00
3	Cable	250.00
4	Mouse	500.00
\.


--
-- Data for Name: ord_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ord_items (items_id, ord_id, p_id, quantity) FROM stdin;
1	4	1	1
2	1	2	1
3	1	3	2
4	2	2	1
5	3	4	1
6	3	3	3
7	4	1	1
\.


--
-- Name: customers_cust_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_cust_id_seq', 3, true);


--
-- Name: ord_items_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ord_items_items_id_seq', 7, true);


--
-- Name: orders_ord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_ord_id_seq', 4, true);


--
-- Name: products_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_p_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 2ZTzz37v224FDfvlV6ofTdKfwgjH53OvY8oTAxcAmdQM6H2guiNV6FoiZuVWPWI

