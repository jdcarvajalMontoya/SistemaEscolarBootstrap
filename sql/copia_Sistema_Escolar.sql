--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-11 12:38:19

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
-- TOC entry 5255 (class 0 OID 16411)
-- Dependencies: 224
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5257 (class 0 OID 16419)
-- Dependencies: 226
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5253 (class 0 OID 16405)
-- Dependencies: 222
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id
, name, content_type_id, codename) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add area', 6, 'add_area');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change area', 6, 'change_area');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete area', 6, 'delete_area');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view area', 6, 'view_area');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add aula', 7, 'add_aula');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change aula', 7, 'change_aula');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete aula', 7, 'delete_aula');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view aula', 7, 'view_aula');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add Departamento', 8, 'add_departamento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change Departamento', 8, 'change_departamento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete Departamento', 8, 'delete_departamento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view Departamento', 8, 'view_departamento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add grado', 9, 'add_grado');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change grado', 9, 'change_grado');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete grado', 9, 'delete_grado');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view grado', 9, 'view_grado');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add nivel educativo', 10, 'add_niveleducativo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change nivel educativo', 10, 'change_niveleducativo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete nivel educativo', 10, 'delete_niveleducativo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view nivel educativo', 10, 'view_niveleducativo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add Rol', 11, 'add_rol');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change Rol', 11, 'change_rol');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete Rol', 11, 'delete_rol');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view Rol', 11, 'view_rol');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add Tipo de Documento', 12, 'add_tipodocumento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change Tipo de Documento', 12, 'change_tipodocumento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete Tipo de Documento', 12, 'delete_tipodocumento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view Tipo de Documento', 12, 'view_tipodocumento');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add Usuario', 13, 'add_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change Usuario', 13, 'change_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete Usuario', 13, 'delete_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view Usuario', 13, 'view_usuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add asignacion docente', 14, 'add_asignaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change asignacion docente', 14, 'change_asignaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete asignacion docente', 14, 'delete_asignaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view asignacion docente', 14, 'view_asignaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add actividad', 15, 'add_actividad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change actividad', 15, 'change_actividad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete actividad', 15, 'delete_actividad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view actividad', 15, 'view_actividad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add asignatura', 16, 'add_asignatura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change asignatura', 16, 'change_asignatura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete asignatura', 16, 'delete_asignatura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view asignatura', 16, 'view_asignatura');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can add calificacion', 17, 'add_calificacion');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can change calificacion', 17, 'change_calificacion');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can delete calificacion', 17, 'delete_calificacion');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view calificacion', 17, 'view_calificacion');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can add Ciudad', 18, 'add_ciudad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can change Ciudad', 18, 'change_ciudad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can delete Ciudad', 18, 'delete_ciudad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view Ciudad', 18, 'view_ciudad');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add grupo', 19, 'add_grupo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change grupo', 19, 'change_grupo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete grupo', 19, 'delete_grupo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can view grupo', 19, 'view_grupo');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (77, 'Can add Perfil de Usuario', 20, 'add_perfildeusuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (78, 'Can change Perfil de Usuario', 20, 'change_perfildeusuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (79, 'Can delete Perfil de Usuario', 20, 'delete_perfildeusuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (80, 'Can view Perfil de Usuario', 20, 'view_perfildeusuario');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (81, 'Can add relacion acudiente estudiante', 21, 'add_relacionacudienteestudiante');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (82, 'Can change relacion acudiente estudiante', 21, 'change_relacionacudienteestudiante');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (83, 'Can delete relacion acudiente estudiante', 21, 'delete_relacionacudienteestudiante');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (84, 'Can view relacion acudiente estudiante', 21, 'view_relacionacudienteestudiante');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (85, 'Can add pais', 22, 'add_pais');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (86, 'Can change pais', 22, 'change_pais');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (87, 'Can delete pais', 22, 'delete_pais');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (88, 'Can view pais', 22, 'view_pais');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (89, 'Can add estado civil', 23, 'add_estadocivil');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (90, 'Can change estado civil', 23, 'change_estadocivil');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (91, 'Can delete estado civil', 23, 'delete_estadocivil');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (92, 'Can view estado civil', 23, 'view_estadocivil');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (93, 'Can add estrato', 24, 'add_estrato');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (94, 'Can change estrato', 24, 'change_estrato');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (95, 'Can delete estrato', 24, 'delete_estrato');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (96, 'Can view estrato', 24, 'view_estrato');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (97, 'Can add genero', 25, 'add_genero');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (98, 'Can change genero', 25, 'change_genero');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (99, 'Can delete genero', 25, 'delete_genero');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (100, 'Can view genero', 25, 'view_genero');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (101, 'Can add hoja de vida docente', 26, 'add_hojadevidadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (102, 'Can change hoja de vida docente', 26, 'change_hojadevidadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (103, 'Can delete hoja de vida docente', 26, 'delete_hojadevidadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (104, 'Can view hoja de vida docente', 26, 'view_hojadevidadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (105, 'Can add experiencia docente', 27, 'add_experienciadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (106, 'Can change experiencia docente', 27, 'change_experienciadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (107, 'Can delete experiencia docente', 27, 'delete_experienciadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (108, 'Can view experiencia docente', 27, 'view_experienciadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (109, 'Can add educacion docente', 28, 'add_educaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (110, 'Can change educacion docente', 28, 'change_educaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (111, 'Can delete educacion docente', 28, 'delete_educaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (112, 'Can view educacion docente', 28, 'view_educaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (113, 'Can add capacitacion docente', 29, 'add_capacitaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (114, 'Can change capacitacion docente', 29, 'change_capacitaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (115, 'Can delete capacitacion docente', 29, 'delete_capacitaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (116, 'Can view capacitacion docente', 29, 'view_capacitaciondocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (117, 'Can add idioma docente', 30, 'add_idiomadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (118, 'Can change idioma docente', 30, 'change_idiomadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (119, 'Can delete idioma docente', 30, 'delete_idiomadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (120, 'Can view idioma docente', 30, 'view_idiomadocente');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (121, 'Can add logro', 31, 'add_logro');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (122, 'Can change logro', 31, 'change_logro');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (123, 'Can delete logro', 31, 'delete_logro');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (124, 'Can view logro', 31, 'view_logro');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (125, 'Can add tema', 32, 'add_tema');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (126, 'Can change tema', 32, 'change_tema');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (127, 'Can delete tema', 32, 'delete_tema');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (128, 'Can view tema', 32, 'view_tema');


--
-- TOC entry 5281 (class 0 OID 16524)
-- Dependencies: 250
-- Data for Name: core_actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5259 (class 0 OID 16451)
-- Dependencies: 228
-- Data for Name: core_area; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (1, 'Matemáticas', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (2, 'Humanidades, Lengua Castellana e Idiomas Extranjeros', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (3, 'Ciencias Naturales y Educación Ambiental', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (4, 'Ciencias Sociales, Historia, Geografía, Constitución Política y Democracia', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (5, 'Tecnología e Informática', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (6, 'Educación Artística', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (7, 'Educación Física, Recreación y Deportes', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (8, 'Lengua Extranjera', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (9, 'Educación Ética y en Valores Humanos', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (10, 'Proyecto de Educación Sexual', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (11, 'Proyecto Ambiental Escolar (PRAE)', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (12, 'Proyecto Democracia y Convivencia', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (13, 'Proyecto Emprendimiento', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (14, 'Educación Religiosa', false);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (15, 'Educación Artística y Cultural', true);
INSERT INTO public.core_area (id, nombre, obligatoria) VALUES (16, 'Ciencias Económicas, Políticas y la Filosofía', true);


--
-- TOC entry 5279 (class 0 OID 16518)
-- Dependencies: 248
-- Data for Name: core_asignaciondocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5283 (class 0 OID 16532)
-- Dependencies: 252
-- Data for Name: core_asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (1, 'Ciencias Naturales', 3, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (2, 'Aritmética', 1, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (3, 'Geometría', 1, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (4, 'Sociales', 4, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (5, 'Geografía', 4, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (6, 'Historia', 4, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (7, 'Lengua Castellana', 2, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (8, 'Inglés', 2, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (9, 'Religión', 14, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (10, 'Ética y Valores', 9, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (11, 'Educación Física', 7, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (12, 'Música', 15, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (13, 'Artes Plásticas', 15, 1);
INSERT INTO public.core_asignatura (id, nombre, area_id, grado_id) VALUES (14, 'Informática', 5, 1);


--
-- TOC entry 5261 (class 0 OID 16457)
-- Dependencies: 230
-- Data for Name: core_aula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (1, 'Salón Primero A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (2, 'Salón Segundo A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (3, 'Salón Tercero A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (4, 'Salón Cuarto A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (5, 'Salón Quinto A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (6, 'Salón Sexto A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (7, 'Salón Séptimo A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (8, 'Salón Octavo A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (9, 'Salón Noveno A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (10, 'Salón Décimo A', 20, 'Disponible');
INSERT INTO public.core_aula (id, nombre, capacidad, estado) VALUES (11, 'Salón Undécnimo A', 20, 'Disponible');


--
-- TOC entry 5285 (class 0 OID 16543)
-- Dependencies: 254
-- Data for Name: core_calificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5311 (class 0 OID 16855)
-- Dependencies: 280
-- Data for Name: core_capacitaciondocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5287 (class 0 OID 16549)
-- Dependencies: 256
-- Data for Name: core_ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (1, 'Barbosa', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (2, 'Bello', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (3, 'Caldas', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (4, 'Copacabana', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (5, 'Envigado', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (6, 'Girardota', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (7, 'Itagüí', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (8, 'La Estrella', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (9, 'Medellín', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (10, 'Sabaneta', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (11, 'Abejorral', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (12, 'Abriaquí', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (13, 'Alejandría', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (14, 'Amagá', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (15, 'Amalfi', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (16, 'Andes', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (18, 'Angostura', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (19, 'Anorí', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (20, 'Santa Fe de Antioquia', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (21, 'Armenia', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (22, 'Arboletes', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (23, 'Argelia', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (24, 'Belmira', 1);
INSERT INTO public.core_ciudad (id, nombre, departamento_id) VALUES (17, 'Angelópolis', 1);


--
-- TOC entry 5263 (class 0 OID 16464)
-- Dependencies: 232
-- Data for Name: core_departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (1, 'Antioquia', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (2, 'Amazonas', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (3, 'Arauca', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (4, 'Atlántico', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (5, 'Bogotá, D.C.', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (6, 'Bolívar', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (7, 'Boyacá', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (8, 'Caldas', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (9, 'Caquetá', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (10, 'Casanare', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (11, 'Cauca', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (12, 'Cesar', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (13, 'Chocó', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (14, 'Córdoba', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (15, 'Cundinamarca', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (16, 'Guainía', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (17, 'Guaviare', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (18, 'Huila', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (19, 'La Guajira', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (20, 'Magdalena', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (21, 'Meta', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (22, 'Nariño', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (23, 'Norte de Santander', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (24, 'Putumayo', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (25, 'Quindío', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (26, 'Risaralda', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (27, 'San Andrés, Providencia y Santa Catalina', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (28, 'Santander', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (29, 'Sucre', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (30, 'Tolima', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (31, 'Valle del CAuca', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (32, 'Vaupés', 1);
INSERT INTO public.core_departamento (id, nombre, pais_id) VALUES (33, 'Vichada', 1);


--
-- TOC entry 5309 (class 0 OID 16849)
-- Dependencies: 278
-- Data for Name: core_educaciondocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5299 (class 0 OID 16813)
-- Dependencies: 268
-- Data for Name: core_estadocivil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_estadocivil (id, nombre) VALUES (1, 'Indiferente');
INSERT INTO public.core_estadocivil (id, nombre) VALUES (2, 'Soltero');
INSERT INTO public.core_estadocivil (id, nombre) VALUES (3, 'Casado');
INSERT INTO public.core_estadocivil (id, nombre) VALUES (4, 'Unión Libre');
INSERT INTO public.core_estadocivil (id, nombre) VALUES (5, 'Divorciado o Separado');
INSERT INTO public.core_estadocivil (id, nombre) VALUES (6, 'Viudo');


--
-- TOC entry 5301 (class 0 OID 16819)
-- Dependencies: 270
-- Data for Name: core_estrato; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_estrato (id, nombre) VALUES (1, 'Uno');
INSERT INTO public.core_estrato (id, nombre) VALUES (2, 'Dos');
INSERT INTO public.core_estrato (id, nombre) VALUES (3, 'Tres');
INSERT INTO public.core_estrato (id, nombre) VALUES (4, 'Cuatro');
INSERT INTO public.core_estrato (id, nombre) VALUES (5, 'Cinco');
INSERT INTO public.core_estrato (id, nombre) VALUES (6, 'Seis');
INSERT INTO public.core_estrato (id, nombre) VALUES (7, 'No Estratificado');


--
-- TOC entry 5307 (class 0 OID 16841)
-- Dependencies: 276
-- Data for Name: core_experienciadocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5303 (class 0 OID 16825)
-- Dependencies: 272
-- Data for Name: core_genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_genero (id, nombre) VALUES (1, 'Masculino');
INSERT INTO public.core_genero (id, nombre) VALUES (2, 'Femenino');


--
-- TOC entry 5265 (class 0 OID 16470)
-- Dependencies: 234
-- Data for Name: core_grado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (1, 'Primero', 1);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (2, 'Segundo', 2);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (3, 'Tercero', 3);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (4, 'Cuarto', 4);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (5, 'Quinto', 5);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (6, 'Sexto', 6);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (7, 'Séptimo', 7);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (8, 'Octavo', 8);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (9, 'Noveno', 9);
INSERT INTO public.core_grado (id, nombre, nivel_id) VALUES (10, 'Décimo', 10);


--
-- TOC entry 5289 (class 0 OID 16555)
-- Dependencies: 258
-- Data for Name: core_grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (2, 'Primero A', 1, 1);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (3, 'Segundo A', 2, 2);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (4, 'Tercero A', 3, 3);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (5, 'Cuarto A', 4, 4);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (6, 'Quinto A', 5, 5);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (7, 'Sexto A', 6, 6);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (8, 'Séptimo A', 7, 7);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (9, 'Octavo A', 8, 8);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (10, 'Noveno A', 9, 9);
INSERT INTO public.core_grupo (id, nombre, aula_id, grado_id) VALUES (11, 'Décimo A', 10, 10);


--
-- TOC entry 5305 (class 0 OID 16831)
-- Dependencies: 274
-- Data for Name: core_hojadevidadocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5313 (class 0 OID 16861)
-- Dependencies: 282
-- Data for Name: core_idiomadocente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5267 (class 0 OID 16476)
-- Dependencies: 236
-- Data for Name: core_niveleducativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_niveleducativo (id, nombre) VALUES (1, 'Primero');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (2, 'Segundo');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (3, 'Tercero');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (4, 'Cuarto');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (5, 'Quinto');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (6, 'Sexto');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (7, 'Séptimo');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (8, 'Octavo');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (9, 'Noveno');
INSERT INTO public.core_niveleducativo (id, nombre) VALUES (10, 'Décimo');


--
-- TOC entry 5297 (class 0 OID 16780)
-- Dependencies: 266
-- Data for Name: core_pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (1, 'Colombia', 'COL');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (2, 'Argentina', 'ARG');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (3, 'Bahamas', 'BAH');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (4, 'Barbados', 'BRB');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (5, 'Belice', 'BLZ');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (6, 'Boliviua', 'BOL');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (7, 'Brasil', 'BRA');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (8, 'Canadá', 'CAN');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (9, 'Chile', 'CHL');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (10, 'Costa Rica', 'CRC');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (11, 'Cuba', 'CUB');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (12, 'Dominica', 'DMA');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (13, 'Ecuador', 'ECU');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (14, 'El Salvador', 'SLV');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (15, 'Estados Unidos', 'USA');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (16, 'Granada', 'GRD');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (17, 'Guatemala', 'GTM');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (18, 'Guyana', 'GUY');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (19, 'Haití', 'HTI');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (20, 'Honduras', 'HND');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (21, 'Jamaica', 'JAM');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (22, 'México', 'MEX');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (23, 'Nicaragua', 'NIC');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (24, 'Panamá', 'PAN');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (25, 'Paraguay', 'PRY');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (26, 'Perú', 'PER');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (27, 'República Dominicana', 'DOM');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (28, 'San Cristobal y Nieves', 'KNA');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (29, 'San Vicente y las Granadinas', 'VCT');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (30, 'Santa Lucía', 'LCA');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (31, 'Surinam', 'SUR');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (32, 'Trinidad y Tobago', 'TTO');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (33, 'Uruguay', 'URY');
INSERT INTO public.core_pais (id, nombre, codigo_iso) VALUES (34, 'Venezuela', 'VEN');


--
-- TOC entry 5291 (class 0 OID 16589)
-- Dependencies: 260
-- Data for Name: core_perfildeusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_perfildeusuario (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion_linea1, direccion_linea2, ciudad_id, usuario_id, especialidad, grupo_id, foto) VALUES (1, 'Juan', 'David', 'Carvajal', 'Montoya', 'Carrera 53 No, 25-32', 'Torre 1 - Apartamento 1403', 2, 4, NULL, NULL, '');
INSERT INTO public.core_perfildeusuario (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion_linea1, direccion_linea2, ciudad_id, usuario_id, especialidad, grupo_id, foto) VALUES (9, 'Natalia', NULL, 'Carvajal', 'Montoya', 'Carrera 72 No. C5 - 36', NULL, 9, 6, NULL, NULL, '');
INSERT INTO public.core_perfildeusuario (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion_linea1, direccion_linea2, ciudad_id, usuario_id, especialidad, grupo_id, foto) VALUES (10, 'Alvaro', NULL, 'Correa', NULL, 'Crrera 56 No. 37-42', NULL, 8, 5, 'Agronomía', NULL, '');
INSERT INTO public.core_perfildeusuario (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion_linea1, direccion_linea2, ciudad_id, usuario_id, especialidad, grupo_id, foto) VALUES (11, 'Diana', 'María', 'Guerra', 'López', 'Calle 40 No. 60-80', NULL, 9, 7, NULL, NULL, '');
INSERT INTO public.core_perfildeusuario (id, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, direccion_linea1, direccion_linea2, ciudad_id, usuario_id, especialidad, grupo_id, foto) VALUES (12, 'John', 'Edison', 'Garro', 'Agudelo', 'Calle 25 No. 32-42', 'Apartamento 1025', 4, 8, 'Física', NULL, '');


--
-- TOC entry 5295 (class 0 OID 16759)
-- Dependencies: 264
-- Data for Name: core_relacionacudienteestudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5269 (class 0 OID 16484)
-- Dependencies: 238
-- Data for Name: core_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_rol (id, nombre) VALUES (1, 'Coordinador Académico');
INSERT INTO public.core_rol (id, nombre) VALUES (3, 'Estudiante');
INSERT INTO public.core_rol (id, nombre) VALUES (4, 'Padre de Familia o Acudiente');
INSERT INTO public.core_rol (id, nombre) VALUES (2, 'Docente');


--
-- TOC entry 5271 (class 0 OID 16492)
-- Dependencies: 240
-- Data for Name: core_tipodocumento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_tipodocumento (id, nombre) VALUES (1, 'Registro Civil de Nacimiento');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (2, 'Tarjeta de Identidad');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (3, 'Cédula de Ciudadanía');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (4, 'Cédula de Extranjería');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (5, 'Pasaporte');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (6, 'Contraseña de Trámite');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (7, 'Permiso Especial de Permanencia - PEP');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (8, 'Permiso de Protección Temporal - PPT');
INSERT INTO public.core_tipodocumento (id, nombre) VALUES (9, 'Documento de Padres o Responsables Legales');


--
-- TOC entry 5273 (class 0 OID 16498)
-- Dependencies: 242
-- Data for Name: core_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (2, 'pbkdf2_sha256$1000000$1qqCYRjb4DjUmCu3k4r0Ow$KvvlxAz4MIBrqZ05qdl4taZQpVpmelwxUj8EbVoIEiM=', '2025-07-08 17:30:54.353928-05', true, 'jdcarvajal04@gmail.com', '2025-07-07 23:54:10.800559-05', true, true, NULL, '70561140', 3, 6, NULL);
INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (6, 'pbkdf2_sha256$1000000$YcXxNY7BXB9tiHQw8hhqlq$TBuGA1KvYilqQoxyptJZhuQlUbstZISGLi8A6pf0+D4=', '2025-07-09 16:11:32.203215-05', false, 'coordinador_academico@gmail.com', '2025-07-09 11:10:07.428557-05', true, false, 1, '456123789', 3, 1, NULL);
INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (5, 'pbkdf2_sha256$1000000$Y9bLYrJsLTwIrm0lV5XMrv$8tFVcs8PmSlJGnZ9NVzPWSaR6qxUtqzPYIL93Xj/CQk=', '2025-07-09 17:30:55.764282-05', false, 'docente@gmail.com', '2025-07-08 21:13:16.725187-05', true, false, 2, '987654321', 3, 7, 4);
INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (7, 'pbkdf2_sha256$1000000$Sj4LQu1AunEJo2a0GOBJ2i$jeiKbawPU+LyhqZD2xS4v3lv90PrZnN2RwQwiPxBDRY=', '2025-07-09 19:51:36.610259-05', false, 'coordinador_auxiliar@gmail.com', '2025-07-09 19:38:10.707871-05', true, false, 1, '654321789', 3, 4, NULL);
INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (8, 'pbkdf2_sha256$1000000$EWtTa3shnS7BkBhi1aeSFy$eOTrEjG2uZdGixRPjECqeDVFzLbr66fFlLVyuyVprG0=', '2025-07-09 19:52:23.705654-05', false, 'docente_fisica@gmail.com', '2025-07-09 19:50:39.47127-05', true, false, 2, '1020404710', 3, 2, 7);
INSERT INTO public.core_usuario (id, password, last_login, is_superuser, correo, fecha_creacion, is_active, is_staff, rol_id, numero_documento, tipo_documento_id, municipio_identificacion_id, activado_por_id) VALUES (4, 'pbkdf2_sha256$1000000$SutVDph9wkllUzXLLM980a$GI6Uot2MogJCJtxmLqstquigEWHnJVGjmnqOIOOlnxo=', '2025-07-08 21:16:32.667452-05', false, 'jdcarvajal04ai@gmail.com', '2025-07-08 17:34:39.602078-05', true, false, 1, '123456789', 3, 2, NULL);


--
-- TOC entry 5275 (class 0 OID 16506)
-- Dependencies: 244
-- Data for Name: core_usuario_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5277 (class 0 OID 16512)
-- Dependencies: 246
-- Data for Name: core_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5293 (class 0 OID 16731)
-- Dependencies: 262
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5251 (class 0 OID 16397)
-- Dependencies: 220
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'core', 'area');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'core', 'aula');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'core', 'departamento');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'core', 'grado');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'core', 'niveleducativo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'core', 'rol');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'core', 'tipodocumento');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'core', 'usuario');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'core', 'asignaciondocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'core', 'actividad');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'core', 'asignatura');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'core', 'calificacion');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (18, 'core', 'ciudad');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (19, 'core', 'grupo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (20, 'core', 'perfildeusuario');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (21, 'core', 'relacionacudienteestudiante');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (22, 'core', 'pais');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (23, 'core', 'estadocivil');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (24, 'core', 'estrato');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (25, 'core', 'genero');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (26, 'core', 'hojadevidadocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (27, 'core', 'experienciadocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (28, 'core', 'educaciondocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (29, 'core', 'capacitaciondocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (30, 'core', 'idiomadocente');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (31, 'core', 'logro');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (32, 'core', 'tema');


--
-- TOC entry 5249 (class 0 OID 16389)
-- Dependencies: 218
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2025-07-07 20:54:26.720271-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-07-07 20:54:26.724332-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2025-07-07 20:54:26.748664-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-07-07 20:54:26.752023-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-07-07 20:54:26.754482-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-07-07 20:54:26.757285-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-07-07 20:54:26.762797-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-07-07 20:54:26.763673-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-07-07 20:54:26.766087-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-07-07 20:54:26.768442-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-07-07 20:54:26.770845-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-07-07 20:54:26.775375-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-07-07 20:54:26.778498-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-07-07 20:54:26.781152-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'core', '0001_initial', '2025-07-07 20:54:26.959445-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2025-07-07 20:54:26.979199-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2025-07-07 20:54:26.985081-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-07 20:54:26.990782-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'core', '0002_eliminar_tablas_huerfanas', '2025-07-07 20:54:26.992826-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'core', '0003_perfildeusuario_especialidad_perfildeusuario_grupo_and_more', '2025-07-07 20:54:27.05192-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'core', '0004_perfildeusuario_foto', '2025-07-07 20:54:27.060455-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'core', '0005_pais_usuario_numero_documento_usuario_tipo_documento_and_more', '2025-07-07 20:54:27.105114-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'core', '0006_alter_departamento_pais', '2025-07-07 20:54:27.124041-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'core', '0007_remove_perfildeusuario_numero_documento_and_more', '2025-07-07 20:54:27.144206-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'core', '0008_estadocivil_estrato_genero_hojadevidadocente_and_more', '2025-07-07 20:54:27.239648-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'core', '0009_alter_hojadevidadocente_departamento_residencia_and_more', '2025-07-07 20:54:27.374575-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'core', '0010_perfildeusuario_municipio_identificacion', '2025-07-07 20:54:27.399618-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'core', '0011_usuario_activado_por', '2025-07-07 20:54:27.414751-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'core', '0012_alter_usuario_rol', '2025-07-07 20:54:27.432522-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'core', '0013_remove_perfildeusuario_municipio_identificacion_and_more', '2025-07-07 20:54:27.479927-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'core', '0014_usuario_activado_por', '2025-07-07 20:54:27.50214-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'core', '0015_remove_tema_asignatura_delete_logro_delete_tema', '2025-07-07 20:54:27.555876-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'sessions', '0001_initial', '2025-07-07 20:54:27.567636-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'core', '0016_alter_tipodocumento_nombre', '2025-07-07 23:40:50.505947-05');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'core', '0015_alter_tipodocumento_nombre', '2025-07-08 17:21:43.867687-05');


--
-- TOC entry 5314 (class 0 OID 17017)
-- Dependencies: 283
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ey4jc737tswlv2jicrzka5uxoia3x7yq', '.eJxVjEEOwiAQRe_C2hAEYcCl-56BDMwgVUOT0q6Md7dNutDte-__t4i4LjWunec4krgKLU6_LGF-ctsFPbDdJ5mntsxjknsiD9vlMBG_bkf7d1Cx122dyLOihCb7UKwNDoELG501I52ROTCqDYCyAA5yccWjURdv2KICKz5fHc040Q:1uZ0NO:J3W6zIqXINc0BPoDyiSPa8NY3wL1VLiJzkKxk3txcAg', '2025-07-08 00:16:18.620786-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('diujke9v8zchw03bop23tvdcsdugcw3k', 'e30:1uZGpy:itb8eFOyrVN0Hu6ecN4GGtkUS3FTpRCsXeHlrdxRM_A', '2025-07-08 17:50:54.351475-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('9k9oreko1r96jzoo4jr6dek393dfoa5h', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZGuH:5fm46h9HYBeyRvjGfcODfxeeUbyuzIAXZChcFl1OADA', '2025-07-08 17:55:21.957812-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('fi440sa6iq70hkefouck03ki19zn1xmg', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZHDj:JAhKBB5wylSyTJQSxhm_3x3aP0U7hTA6qTGbgUp9aEM', '2025-07-08 18:15:27.671369-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('24wfjnh3wqgq02cn5stl0zcfdytug504', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZHaq:sL7368K-N4yh1XGSascjepbA9eFOcahgfvGQ0eq9FZw', '2025-07-08 18:39:20.859772-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('z4z8m1l332scwlnk3a86n8yzgrv5ko66', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZHvR:p_OYVHWN5ZB5nzzciKB51suRzfV3cldcBJCtjI5X27E', '2025-07-08 19:00:37.913585-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ztba8p4gpc43tde9uvokmuzmmk7i67dt', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZIH1:ZVHkIpe9LjS3D2mxQkW2J6ucs8u8xHlGUW9OcadJv8Y', '2025-07-08 19:22:55.90892-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('erudm19575caxnqijwl7svechg07ws3z', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZIbJ:mpMXykFD87t4hKFnbbLipP5q-_hrG942gZHm0hBSHH8', '2025-07-08 19:43:53.658774-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('wyk7zl2o3hqrvcoep7kfypb4nypo01sl', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZIv1:Dda97Nv-1Y2agB8oAu2t3kOe6w8nMrXZsjVPSHr4ASM', '2025-07-08 20:04:15.675169-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('8dyp0lb7s6khz4rfkrest65s7g9uxg0g', '.eJxVjDsOwjAQBe_iGllr4i8lPWew1us1DiBHipMKcXcSKQW0M_PeW0RclxrXznMcs7gILU6_LCE9ue0iP7DdJ0lTW-YxyT2Rh-3yNmV-XY_276Bir9salXW6pICWVPAMqMNGXEH21ijSxg9nV8BkgKC8pcG5xGABDWdNuojPF82_N1A:1uZJFQ:t9etLFzmtRq2M4DpX96_1xECmoiR6FGK5BksPtTHc88', '2025-07-08 20:25:20.453387-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('13tltuipbu8y56g4xnzuf045u2pacfu6', '.eJxVjEEOwiAQRe_C2pApFQSX7nsGMswMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6ursur0uyWkp9Qd8APrfdI01WUek94VfdCmh4nldTvcv4OCrWy1dyAGjUCWPhifgbLlzl6QncsSejSWIGQS9AQdppCdB2IXgpxxE9XnC_m5OJ4:1uZWOL:rE43MWziJUsqXGsgC7znA6jdaBRHS5A8qDnTPVo6l78', '2025-07-09 10:27:25.84674-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('v4pno15qmwknw6gyw57v7ro8xezdok3a', '.eJxVjEEOwiAQRe_C2pApFQSX7nsGMswMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6ursur0uyWkp9Qd8APrfdI01WUek94VfdCmh4nldTvcv4OCrWy1dyAGjUCWPhifgbLlzl6QncsSejSWIGQS9AQdppCdB2IXgpxxE9XnC_m5OJ4:1uZWj7:CkDHyuA9NZSUkf1fCbtlybFWBrYVstDEV_cnenZbXJY', '2025-07-09 10:48:53.656979-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('bqpote3aqq0qfz8v7afonbg3mgrq9bj5', '.eJxVjEEOwiAQRe_C2hCUMgwu3fcMZBioVA0kpV0Z79426aJu_3vvf4WnZc5-aWnyYxR3AeJy3gLxO5UdxBeVZ5VcyzyNQe6KPGiTfY3p8zjcv4NMLW-1Q9IEKrFRqPFGOEDgQbMBDgydCe4KThkDHSq0bB1FBqct2M21lMRvBdnhN2c:1uZXO1:19p6DpG-XhOG0P7SGUEswqwwaq1dXIL2wtqSPLnBAh4', '2025-07-09 11:31:09.861954-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('jil1sl5tnxv00acuuxzu80gtmnyjk99h', '.eJxVjEEOwiAQRe_C2hCUMgwu3fcMZBioVA0kpV0Z79426aJu_3vvf4WnZc5-aWnyYxR3AeJy3gLxO5UdxBeVZ5VcyzyNQe6KPGiTfY3p8zjcv4NMLW-1Q9IEKrFRqPFGOEDgQbMBDgydCe4KThkDHSq0bB1FBqct2M21lMRvBdnhN2c:1uZXp0:D21CG1Brx0yUS6ZAFXdla11S4kYF-au7IoDwQhZANZc', '2025-07-09 11:59:02.724621-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('gmhn19dvh9bip4vkhhgwce1xpfl7j7xg', '.eJxVjEEOwiAQRe_C2hCUMgwu3fcMZBioVA0kpV0Z79426aJu_3vvf4WnZc5-aWnyYxR3AeJy3gLxO5UdxBeVZ5VcyzyNQe6KPGiTfY3p8zjcv4NMLW-1Q9IEKrFRqPFGOEDgQbMBDgydCe4KThkDHSq0bB1FBqct2M21lMRvBdnhN2c:1uZYCN:BU0aUPr5aZMl1o4Dm9WWFo63t4gI4f6XKim7LQw7l2k', '2025-07-09 12:23:11.014765-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('wui057ztkwyrrdhn4z7i3aq7yzndrdqb', '.eJxVjEEOwiAQRe_C2hCUMgwu3fcMZBioVA0kpV0Z79426aJu_3vvf4WnZc5-aWnyYxR3AeJy3gLxO5UdxBeVZ5VcyzyNQe6KPGiTfY3p8zjcv4NMLW-1Q9IEKrFRqPFGOEDgQbMBDgydCe4KThkDHSq0bB1FBqct2M21lMRvBdnhN2c:1uZakW:yBr3OXbsLJ0W_GhzrQ14s0sNvZNBuFPjmyq9h5jUYko', '2025-07-09 15:06:36.927622-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('p2w618s34zn814yle8rwuh7yf9dslxri', '.eJxVjEEOwiAQRe_C2hCUMgwu3fcMZBioVA0kpV0Z79426aJu_3vvf4WnZc5-aWnyYxR3AeJy3gLxO5UdxBeVZ5VcyzyNQe6KPGiTfY3p8zjcv4NMLW-1Q9IEKrFRqPFGOEDgQbMBDgydCe4KThkDHSq0bB1FBqct2M21lMRvBdnhN2c:1uZb44:xW36O0yfA7pKYy8ch4FfbBFoqRMNxutfRCVWlBgUPNo', '2025-07-09 15:26:48.841802-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ayk3n6q9uko4evinwhijgqgesmceik3v', '.eJxVjEEOwiAQRe_C2pApFQSX7nsGMswMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6ursur0uyWkp9Qd8APrfdI01WUek94VfdCmh4nldTvcv4OCrWy1dyAGjUCWPhifgbLlzl6QncsSejSWIGQS9AQdppCdB2IXgpxxE9XnC_m5OJ4:1uZbRB:wrquyeNku7l-WOorIyxpcS4MQ0bhW32Bdk9iuG3A7fg', '2025-07-09 15:50:41.964407-05');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('ju3kbomotk6oby10eha22db8vh00ved9', '.eJxVjEEOwiAQRe_C2pApFQSX7nsGMswMUjU0Ke3KeHfbpAvd_vfef6uI61Li2mSOI6ursur0uyWkp9Qd8APrfdI01WUek94VfdCmh4nldTvcv4OCrWy1dyAGjUCWPhifgbLlzl6QncsSejSWIGQS9AQdppCdB2IXgpxxE9XnC_m5OJ4:1uZdJX:3qDdG5j3XsIrP764bf4UVCVBHpx9R4jHKVCwRbDL8Tc', '2025-07-09 17:50:55.79284-05');


--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 223
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 225
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 221
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 128, true);


--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 249
-- Name: core_actividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_actividad_id_seq', 1, false);


--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 227
-- Name: core_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_area_id_seq', 1, false);


--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 247
-- Name: core_asignaciondocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_asignaciondocente_id_seq', 1, false);


--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 251
-- Name: core_asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_asignatura_id_seq', 1, false);


--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 229
-- Name: core_aula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_aula_id_seq', 1, false);


--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 253
-- Name: core_calificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_calificacion_id_seq', 1, false);


--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 279
-- Name: core_capacitaciondocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_capacitaciondocente_id_seq', 1, false);


--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 255
-- Name: core_ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_ciudad_id_seq', 1, false);


--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 231
-- Name: core_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_departamento_id_seq', 1, false);


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 277
-- Name: core_educaciondocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_educaciondocente_id_seq', 1, false);


--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 267
-- Name: core_estadocivil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_estadocivil_id_seq', 1, false);


--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 269
-- Name: core_estrato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_estrato_id_seq', 1, false);


--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 275
-- Name: core_experienciadocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_experienciadocente_id_seq', 1, false);


--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 271
-- Name: core_genero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_genero_id_seq', 1, false);


--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 233
-- Name: core_grado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_grado_id_seq', 1, false);


--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 257
-- Name: core_grupo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_grupo_id_seq', 12, true);


--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 273
-- Name: core_hojadevidadocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_hojadevidadocente_id_seq', 1, false);


--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 281
-- Name: core_idiomadocente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_idiomadocente_id_seq', 1, false);


--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 235
-- Name: core_niveleducativo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_niveleducativo_id_seq', 2, true);


--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 265
-- Name: core_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_pais_id_seq', 1, false);


--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 259
-- Name: core_perfildeusuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_perfildeusuario_id_seq', 12, true);


--
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 263
-- Name: core_relacionacudienteestudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_relacionacudienteestudiante_id_seq', 1, false);


--
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 237
-- Name: core_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_rol_id_seq', 1, false);


--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 239
-- Name: core_tipodocumento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_tipodocumento_id_seq', 1, false);


--
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 243
-- Name: core_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_usuario_groups_id_seq', 1, false);


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 241
-- Name: core_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_usuario_id_seq', 8, true);


--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 245
-- Name: core_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_usuario_user_permissions_id_seq', 1, false);


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 261
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 32, true);


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 217
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


-- Completed on 2025-07-11 12:38:20

--
-- PostgreSQL database dump complete
--

