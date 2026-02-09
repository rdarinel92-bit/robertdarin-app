SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict yi8AWDbWeQZ79r9ArVMpFb09GwB7wA6K9KWTgPKIzReuOVsTEXW6WSyjG1ugwfm

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '19a4c079-c443-4a54-a5f0-5dc925f04431', 'authenticated', 'authenticated', 'rdarinel92@gmail.com', '$2a$10$f56z0X82KgnFZ5FOYYvO5OTrMpP2Rv2bLCcKR2SiicVlwNd8oaL5O', '2026-01-15 03:26:32.422299+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-01-17 22:03:13.898637+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2026-01-15 03:26:32.386716+00', '2026-01-17 22:03:14.013954+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('19a4c079-c443-4a54-a5f0-5dc925f04431', '19a4c079-c443-4a54-a5f0-5dc925f04431', '{"sub": "19a4c079-c443-4a54-a5f0-5dc925f04431", "email": "rdarinel92@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2026-01-15 03:26:32.41191+00', '2026-01-15 03:26:32.413003+00', '2026-01-15 03:26:32.413003+00', '0b2e4dbc-c550-42d3-ae5a-73eab53f1aae');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") VALUES
	('77059ac1-c5c8-4a2e-b0f6-aaa54ece907a', '19a4c079-c443-4a54-a5f0-5dc925f04431', '2026-01-17 22:03:13.90051+00', '2026-01-17 22:03:13.90051+00', NULL, 'aal1', NULL, NULL, 'Dart/3.10 (dart:io)', '35.143.132.53', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('77059ac1-c5c8-4a2e-b0f6-aaa54ece907a', '2026-01-17 22:03:14.025256+00', '2026-01-17 22:03:14.025256+00', 'password', '57000665-4449-4b14-bb4f-3d8ae53f5408');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 233, 'rscy6s3yclpz', '19a4c079-c443-4a54-a5f0-5dc925f04431', false, '2026-01-17 22:03:13.959257+00', '2026-01-17 22:03:13.959257+00', NULL, '77059ac1-c5c8-4a2e-b0f6-aaa54ece907a');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: historial_backups; Type: TABLE DATA; Schema: backup; Owner: postgres
--



--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: negocios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."negocios" ("id", "nombre", "tipo", "propietario_id", "rfc", "razon_social", "direccion_fiscal", "telefono", "email", "logo_url", "color_primario", "color_secundario", "activo", "configuracion", "created_at", "updated_at") VALUES
	('116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Robert Darin Fintech', 'fintech', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#FF9800', '#1E1E2C', true, '{}', '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('a0000000-0000-0000-0000-000000000001', 'Robert Darin Fintech', 'fintech', NULL, 'XAXX010101000', 'Robert Darin Servicios Financieros SA de CV', NULL, '5551234567', 'contacto@robertdarin.com', NULL, '#FF9800', '#1E1E2C', true, '{"moneda": "MXN", "mora_default": 5, "interes_default": 10}', '2026-01-15 02:36:08.7384', '2026-01-15 02:36:08.7384');


--
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."sucursales" ("id", "negocio_id", "nombre", "codigo", "direccion", "telefono", "email", "latitud", "longitud", "horario", "meta_mensual", "activa", "created_at", "updated_at") VALUES
	('3e2e1e70-6699-4b9b-bd39-7b55913e7676', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Sucursal Principal', 'SUC-001', 'Oficina Central', '5512345678', NULL, NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('d8913b9a-82fc-42ea-ab33-6ad4addc85ad', NULL, 'Sucursal Principal', NULL, 'Dirección Principal', '555-0001', 'principal@robertdarin.com', NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:07.717687', '2026-01-15 02:36:07.717687'),
	('7f4af0c2-156a-4c28-806b-5ddf450f9415', NULL, 'Sucursal Norte', NULL, 'Av. Norte #100', '555-0002', 'norte@robertdarin.com', NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:07.717687', '2026-01-15 02:36:07.717687'),
	('a8e06225-0074-4606-86e0-a59076372817', NULL, 'Sucursal Sur', NULL, 'Av. Sur #200', '555-0003', 'sur@robertdarin.com', NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:07.717687', '2026-01-15 02:36:07.717687'),
	('b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Sucursal Matriz', NULL, 'Av. Principal 123, Centro', '5551234567', NULL, NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:08.7384', '2026-01-15 02:36:08.7384'),
	('b0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 'Sucursal Norte', NULL, 'Blvd. Norte 456, Col. Industrial', '5559876543', NULL, NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:08.7384', '2026-01-15 02:36:08.7384'),
	('b0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 'Sucursal Sur', NULL, 'Calle Sur 789, Zona Comercial', '5555551234', NULL, NULL, NULL, NULL, 0.00, true, '2026-01-15 02:36:08.7384', '2026-01-15 02:36:08.7384');


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: expedientes_legales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_mora; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: acuses_recibo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aires_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aires_tecnicos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aires_ordenes_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aires_garantias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: alertas_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: amortizaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."colaborador_tipos" ("id", "codigo", "nombre", "descripcion", "nivel_acceso", "puede_ver_finanzas", "puede_ver_clientes", "puede_ver_prestamos", "puede_operar", "puede_aprobar", "puede_emitir_facturas", "puede_ver_reportes", "activo", "created_at") VALUES
	('00978965-2999-444a-aae4-5c31cd2cd43e', 'co_superadmin', 'Co-Superadmin', 'Acceso total como segundo superadmin', 10, true, true, true, true, true, true, true, true, '2026-01-15 02:36:04.888854+00'),
	('750f57dd-fa8a-447f-9164-b100d651e7b3', 'socio_operativo', 'Socio Operativo', 'Socio con capacidad de operar el negocio', 8, true, true, true, true, true, false, true, true, '2026-01-15 02:36:04.888854+00'),
	('a1a08279-827e-4d97-b472-3d3126621ad8', 'socio_inversionista', 'Socio Inversionista', 'Socio que solo invierte capital', 5, true, false, false, false, false, false, true, true, '2026-01-15 02:36:04.888854+00'),
	('0b776fa1-bce7-4ef5-8e60-625bae1e91d9', 'contador', 'Contador', 'Acceso a finanzas y reportes', 6, true, false, true, false, false, true, true, true, '2026-01-15 02:36:04.888854+00'),
	('d075f000-0e7b-4dff-80a7-be83ecb0ad73', 'asesor', 'Asesor', 'Consultor con acceso limitado', 3, false, false, false, false, false, false, true, true, '2026-01-15 02:36:04.888854+00'),
	('2018b15a-0938-4746-a3ec-94cf6b30908d', 'facturador', 'Facturador', 'Solo puede emitir facturas', 2, false, false, false, false, false, true, false, true, '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: colaboradores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aportaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auditoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."roles" ("id", "nombre", "descripcion", "created_at") VALUES
	('73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'superadmin', 'Control total del sistema', '2026-01-15 02:36:04.888854'),
	('6b05b279-3c50-48a7-b3f6-f84960b825b9', 'admin', 'Gerente de sucursal', '2026-01-15 02:36:04.888854'),
	('f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', 'operador', 'Cajero/Operador', '2026-01-15 02:36:04.888854'),
	('0dc65d43-cfe2-41d3-b1f2-96fd082ac5df', 'cliente', 'Usuario cliente', '2026-01-15 02:36:04.888854'),
	('44756384-4235-4138-a7a8-d6ceff2aebcb', 'contador', 'Contador/Contabilidad con acceso a finanzas, reportes y nómina', '2026-01-15 02:36:04.888854'),
	('8ccd3a9c-d625-482a-8058-8ebbe9ec5c42', 'recursos_humanos', 'Recursos Humanos con acceso a empleados, nómina y expedientes', '2026-01-15 02:36:04.888854'),
	('03e27642-93c5-4e61-bd0d-73d35f240d26', 'aval', 'Aval/Garante con acceso a ver préstamos que garantiza', '2026-01-15 02:36:04.888854');


--
-- Data for Name: auditoria_acceso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auditoria_legal; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tandas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: avales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: aval_checkins; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cache_estadisticas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: calendario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cat_forma_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cat_forma_pago" ("clave", "descripcion", "activo") VALUES
	('01', 'Efectivo', true),
	('02', 'Cheque nominativo', true),
	('03', 'Transferencia electrónica de fondos', true),
	('04', 'Tarjeta de crédito', true),
	('05', 'Monedero electrónico', true),
	('06', 'Dinero electrónico', true),
	('08', 'Vales de despensa', true),
	('12', 'Dación en pago', true),
	('13', 'Pago por subrogación', true),
	('14', 'Pago por consignación', true),
	('15', 'Condonación', true),
	('17', 'Compensación', true),
	('23', 'Novación', true),
	('24', 'Confusión', true),
	('25', 'Remisión de deuda', true),
	('26', 'Prescripción o caducidad', true),
	('27', 'A satisfacción del acreedor', true),
	('28', 'Tarjeta de débito', true),
	('29', 'Tarjeta de servicios', true),
	('30', 'Aplicación de anticipos', true),
	('31', 'Intermediario pagos', true),
	('99', 'Por definir', true);


--
-- Data for Name: cat_regimen_fiscal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cat_regimen_fiscal" ("clave", "descripcion", "fisica", "moral", "activo") VALUES
	('601', 'General de Ley Personas Morales', false, true, true),
	('603', 'Personas Morales con Fines no Lucrativos', false, true, true),
	('605', 'Sueldos y Salarios e Ingresos Asimilados a Salarios', true, false, true),
	('606', 'Arrendamiento', true, false, true),
	('607', 'Régimen de Enajenación o Adquisición de Bienes', true, false, true),
	('608', 'Demás ingresos', true, false, true),
	('610', 'Residentes en el Extranjero sin Establecimiento Permanente en México', true, true, true),
	('611', 'Ingresos por Dividendos (socios y accionistas)', true, false, true),
	('612', 'Personas Físicas con Actividades Empresariales y Profesionales', true, false, true),
	('614', 'Ingresos por intereses', true, false, true),
	('615', 'Régimen de los ingresos por obtención de premios', true, false, true),
	('616', 'Sin obligaciones fiscales', true, false, true),
	('620', 'Sociedades Cooperativas de Producción que optan por diferir sus ingresos', false, true, true),
	('621', 'Incorporación Fiscal', true, false, true),
	('622', 'Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras', true, true, true),
	('623', 'Opcional para Grupos de Sociedades', false, true, true),
	('624', 'Coordinados', false, true, true),
	('625', 'Régimen de las Actividades Empresariales con ingresos a través de Plataformas Tecnológicas', true, false, true),
	('626', 'Régimen Simplificado de Confianza', true, true, true);


--
-- Data for Name: cat_uso_cfdi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cat_uso_cfdi" ("clave", "descripcion", "fisica", "moral", "activo") VALUES
	('G01', 'Adquisición de mercancías', true, true, true),
	('G02', 'Devoluciones, descuentos o bonificaciones', true, true, true),
	('G03', 'Gastos en general', true, true, true),
	('I01', 'Construcciones', true, true, true),
	('I02', 'Mobiliario y equipo de oficina por inversiones', true, true, true),
	('I03', 'Equipo de transporte', true, true, true),
	('I04', 'Equipo de cómputo y accesorios', true, true, true),
	('I05', 'Dados, troqueles, moldes, matrices y herramental', true, true, true),
	('I06', 'Comunicaciones telefónicas', true, true, true),
	('I07', 'Comunicaciones satelitales', true, true, true),
	('I08', 'Otra maquinaria y equipo', true, true, true),
	('D01', 'Honorarios médicos, dentales y gastos hospitalarios', true, false, true),
	('D02', 'Gastos médicos por incapacidad o discapacidad', true, false, true),
	('D03', 'Gastos funerales', true, false, true),
	('D04', 'Donativos', true, false, true),
	('D05', 'Intereses reales efectivamente pagados por créditos hipotecarios', true, false, true),
	('D06', 'Aportaciones voluntarias al SAR', true, false, true),
	('D07', 'Primas por seguros de gastos médicos', true, false, true),
	('D08', 'Gastos de transportación escolar obligatoria', true, false, true),
	('D09', 'Depósitos en cuentas para el ahorro, primas de pensiones', true, false, true),
	('D10', 'Pagos por servicios educativos (colegiaturas)', true, false, true),
	('S01', 'Sin efectos fiscales', true, true, true),
	('CP01', 'Pagos', true, true, true),
	('CN01', 'Nómina', true, false, true);


--
-- Data for Name: chat_aval_cobrador; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: chat_conversaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: chat_mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: chat_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: clientes_bloqueados_mora; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: clientes_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_cliente_contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_cliente_documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_cliente_notas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_cotizaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_equipos_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_tecnicos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_ordenes_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: climas_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: compensacion_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_compensaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_inversiones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_invitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_permisos_modulo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colaborador_rendimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: comisiones_empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: comprobantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: comprobantes_prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."configuracion" ("id", "clave", "valor", "descripcion", "tipo", "updated_at") VALUES
	('737b34dd-234c-4e7d-9b6b-6ea0eea32fff', 'tasa_interes_default', '5', 'Tasa de interés mensual por defecto (%)', 'number', '2026-01-15 02:36:04.888854'),
	('63e1b066-6cd6-444c-9907-c8c60cad283e', 'plazo_maximo_meses', '24', 'Plazo máximo de préstamos en meses', 'number', '2026-01-15 02:36:04.888854'),
	('20030807-fecf-4866-addc-8637ecd2081a', 'monto_minimo_prestamo', '1000', 'Monto mínimo de préstamo', 'number', '2026-01-15 02:36:04.888854'),
	('2891b6ae-f6e9-4835-b709-36a47207645e', 'monto_maximo_prestamo', '500000', 'Monto máximo de préstamo', 'number', '2026-01-15 02:36:04.888854'),
	('af341929-7487-4f3f-8ec7-f51ceff41835', 'dias_gracia_pago', '3', 'Días de gracia antes de marcar como vencido', 'number', '2026-01-15 02:36:04.888854'),
	('bdbe6b98-f42b-4554-90e7-bee2c860f52e', 'requiere_aval', 'true', 'Requiere aval para préstamos', 'boolean', '2026-01-15 02:36:04.888854'),
	('227317bc-cbdc-449a-8d9e-6c1ed950c285', 'nombre_empresa', 'Robert Darin Fintech', 'Nombre de la empresa', 'string', '2026-01-15 02:36:04.888854'),
	('e1e6eaa9-e784-41aa-9d0e-c34e20eaffbf', 'moneda', 'MXN', 'Moneda del sistema', 'string', '2026-01-15 02:36:04.888854');


--
-- Data for Name: configuracion_apis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."configuracion_apis" ("id", "negocio_id", "servicio", "activo", "modo_test", "publishable_key", "secret_key", "webhook_secret", "api_key", "configuracion", "ultima_verificacion", "estado_conexion", "created_at", "updated_at") VALUES
	('211e2f42-096e-41dc-bd85-a8a19da36147', NULL, 'firebase_fcm', false, true, NULL, NULL, NULL, 'TU_FCM_SERVER_KEY_AQUI', '{"sender_id": "TU_SENDER_ID", "project_id": "robert-darin-fintech"}', NULL, 'no_verificado', '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854');


--
-- Data for Name: configuracion_global; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."configuracion_global" ("id", "nombre_app", "version", "modo_mantenimiento", "max_avales_prestamo", "max_avales_tanda", "monto_min_prestamo", "monto_max_prestamo", "interes_default", "email_soporte", "telefono_soporte", "whatsapp", "color_acento", "color_botones", "color_alertas", "fondos_inteligentes", "fondos_por_rol", "created_at", "updated_at") VALUES
	('86330fd5-4fd9-4d6c-81a0-577f9c03fc00', 'Robert Darin Fintech', '6.1.0', false, 3, 2, 1000.00, 500000.00, 10.00, 'soporte@robertdarin.com', '+52 555 123 4567', '+52 555 123 4567', '#00BCD4', '#4CAF50', '#FF5722', false, false, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: configuracion_moras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."configuracion_moras" ("id", "negocio_id", "prestamos_mora_diaria", "prestamos_mora_maxima", "prestamos_dias_gracia", "prestamos_aplicar_automatico", "tandas_mora_diaria", "tandas_mora_maxima", "tandas_dias_gracia", "tandas_aplicar_automatico", "notificar_dias_antes", "notificar_recordatorio_diario", "notificar_al_aval", "nivel_1_dias", "nivel_2_dias", "nivel_3_dias", "nivel_4_dias", "bloquear_cliente_dias", "enviar_a_legal_dias", "created_at", "updated_at") VALUES
	('00a507f0-17dd-4d6d-ad1b-d2f04ce09c87', 'a0000000-0000-0000-0000-000000000001', 1.00, 30.00, 3, true, 2.00, 50.00, 1, true, 3, true, true, 1, 7, 15, 30, 60, 90, '2026-01-15 02:36:08.7384', '2026-01-15 02:36:08.7384');


--
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: documentos_aval; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: documentos_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: empleados_negocios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: entregas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: expediente_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: facturacion_emisores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: factura_complementos_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_niveles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."nice_niveles" ("id", "negocio_id", "codigo", "nombre", "comision_ventas", "comision_porcentaje", "comision_equipo", "comision_equipo_porcentaje", "descuento_porcentaje", "ventas_minimas_mes", "meta_ventas_mensual", "bono_reclutamiento", "beneficios", "color", "icono", "orden", "activo", "created_at", "equipo_minimo", "puntos_minimos", "comision_equipo_n1", "comision_equipo_n2", "comision_equipo_n3", "bono_liderazgo", "insignia_url") VALUES
	('2068ce4f-e3cb-4bb6-88b0-70279cc0c9a3', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'bronce', '🥉 Bronce', 20.00, 20.00, 0.00, 5.00, 25.00, 0.00, 0.00, 0.00, '[]', '#CD7F32', 'star', 1, true, '2026-01-15 02:36:04.888854+00', 0, 0, 0.00, 0.00, 0.00, 0.00, NULL),
	('8cd4cb29-9874-4f95-aff7-83ab3666ab47', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'plata', '🥈 Plata', 25.00, 20.00, 3.00, 5.00, 30.00, 5000.00, 0.00, 100.00, '[]', '#C0C0C0', 'star', 2, true, '2026-01-15 02:36:04.888854+00', 0, 0, 0.00, 0.00, 0.00, 0.00, NULL),
	('dd8a9fe0-11de-4b4c-9d65-6a80e93b4c13', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'oro', '🥇 Oro', 30.00, 20.00, 5.00, 5.00, 35.00, 15000.00, 0.00, 200.00, '[]', '#FFD700', 'star', 3, true, '2026-01-15 02:36:04.888854+00', 0, 0, 0.00, 0.00, 0.00, 0.00, NULL),
	('cf73606e-e5cf-4fb2-a1f3-db99e4130c70', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'platino', '💎 Platino', 35.00, 20.00, 7.00, 5.00, 40.00, 30000.00, 0.00, 500.00, '[]', '#E5E4E2', 'star', 4, true, '2026-01-15 02:36:04.888854+00', 0, 0, 0.00, 0.00, 0.00, 0.00, NULL),
	('7587d44a-66ba-40cb-b980-3207e0e2cbf4', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'diamante', '👑 Diamante', 40.00, 20.00, 10.00, 5.00, 45.00, 50000.00, 0.00, 1000.00, '[]', '#B9F2FF', 'star', 5, true, '2026-01-15 02:36:04.888854+00', 0, 0, 0.00, 0.00, 0.00, 0.00, NULL);


--
-- Data for Name: nice_vendedoras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_repartidores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: facturacion_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: factura_conceptos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: factura_documentos_relacionados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: factura_impuestos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: facturacion_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: facturacion_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: firmas_avales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: firmas_digitales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: fondos_pantalla; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: intentos_cobro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventario_movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: links_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: log_fraude; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mensajes_aval_cobrador; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: metodos_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."metodos_pago" ("id", "tipo", "nombre", "banco", "numero_cuenta", "clabe", "tarjeta", "titular", "qr_url", "enlace_pago", "instrucciones", "activo", "principal", "orden", "created_at", "updated_at") VALUES
	('ed4a87b4-5617-4fe5-873d-9237bdacd275', 'efectivo', 'Efectivo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pago en efectivo al momento de la cobranza', true, true, 0, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: mis_propiedades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: modulos_activos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."modulos_activos" ("id", "negocio_id", "modulo_id", "tipo", "activo", "configuracion", "orden", "created_at", "updated_at") VALUES
	('b1be541b-35e5-4929-a03e-5e47716f98e4', NULL, 'fintech', 'gavetero', true, '{}', 0, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('120574b2-4567-46fa-8a0b-fc2438fe7a76', NULL, 'prestamos', 'submodulo', true, '{}', 0, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('9fb0ac86-477d-4ff9-9b2f-9078a33a028d', NULL, 'cobranza', 'submodulo', true, '{}', 0, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('e3944b7f-5dd3-4dc1-9dba-038481d91126', NULL, 'clientes', 'submodulo', true, '{}', 0, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854'),
	('bb5a9273-29a0-41c6-8e3f-20742a028316', NULL, 'avales', 'submodulo', true, '{}', 0, '2026-01-15 02:36:04.888854', '2026-01-15 02:36:04.888854');


--
-- Data for Name: moras_prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tanda_participantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: moras_tandas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_catalogos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."nice_catalogos" ("id", "negocio_id", "codigo", "nombre", "descripcion", "imagen_portada_url", "imagen_portada", "pdf_url", "fecha_inicio", "fecha_fin", "vigencia_inicio", "vigencia_fin", "version", "activo", "orden", "created_at", "updated_at") VALUES
	('96dee873-57ac-438b-9e38-88a2ab717c49', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'CAT-2026-01', 'Catálogo Primavera 2026', 'Colección Primavera con las últimas tendencias', NULL, NULL, NULL, '2026-01-01', '2026-06-30', NULL, NULL, '1.0', true, 1, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: nice_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."nice_categorias" ("id", "negocio_id", "nombre", "descripcion", "icono", "color", "imagen_url", "orden", "activa", "activo", "created_at") VALUES
	('cee99876-fda0-427a-8b03-b267d1ca34b5', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Anillos', 'Anillos de todos los estilos', 'ring', '#E91E63', NULL, 1, true, true, '2026-01-15 02:36:04.888854+00'),
	('e6757026-827b-4dff-bc6e-778abe292ace', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Collares', 'Collares y cadenas', 'necklace', '#9C27B0', NULL, 2, true, true, '2026-01-15 02:36:04.888854+00'),
	('e74d9766-999d-4e40-ada8-f3620b918aa4', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Aretes', 'Aretes y pendientes', 'earrings', '#673AB7', NULL, 3, true, true, '2026-01-15 02:36:04.888854+00'),
	('d03107b7-98d9-400c-a3ec-0cf48b3e2cb1', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Pulseras', 'Pulseras y brazaletes', 'bracelet', '#3F51B5', NULL, 4, true, true, '2026-01-15 02:36:04.888854+00'),
	('e6e3ef4f-1f14-4dd7-87da-0cd40acd8f73', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Relojes', 'Relojes de moda', 'watch', '#2196F3', NULL, 5, true, true, '2026-01-15 02:36:04.888854+00'),
	('9966823b-31ae-4380-b9e6-0d9fcd1abac3', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Accesorios', 'Broches, pins y más', 'accessories', '#00BCD4', NULL, 6, true, true, '2026-01-15 02:36:04.888854+00'),
	('c123f8c0-6ab8-4544-9bd9-72b6b61abde7', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', 'Sets', 'Conjuntos completos', 'set', '#FF9800', NULL, 7, true, true, '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: nice_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."nice_productos" ("id", "negocio_id", "catalogo_id", "categoria_id", "sku", "codigo_pagina", "nombre", "descripcion", "material", "precio_catalogo", "precio_vendedora", "costo", "stock", "stock_minimo", "imagen_url", "imagenes_adicionales", "destacado", "nuevo", "activo", "created_at", "updated_at", "imagen_principal_url", "es_nuevo", "es_destacado", "es_oferta", "precio_oferta", "disponible", "veces_vendido", "peso_gramos", "pagina_catalogo", "talla") VALUES
	('19561994-bdac-4db3-9dfc-1639a2a194e5', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'cee99876-fda0-427a-8b03-b267d1ca34b5', 'NICE-0001', 'P001', 'Anillo Solitario Clásico', 'Anillo con circón brillante central, diseño atemporal', 'Plata 925', 850.00, 595.00, 382.50, 25, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('78d36d4f-16c3-42ec-b493-ed34ddb3f12d', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'cee99876-fda0-427a-8b03-b267d1ca34b5', 'NICE-0002', 'P002', 'Anillo Infinity Love', 'Símbolo del amor infinito con piedras', 'Oro 10k', 2200.00, 1540.00, 990.00, 15, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('a587e6d3-8e1b-4b52-899f-d55483365c8e', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'cee99876-fda0-427a-8b03-b267d1ca34b5', 'NICE-0003', 'P003', 'Anillo Triple Band', 'Tres bandas entrelazadas elegantes', 'Plata 925', 650.00, 455.00, 292.50, 30, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('3570f678-a8d7-441c-ba7c-3017a0d698d3', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'cee99876-fda0-427a-8b03-b267d1ca34b5', 'NICE-0004', 'P004', 'Anillo Vintage Rose', 'Diseño floral estilo vintage', 'Oro rosa 14k', 3500.00, 2450.00, 1575.00, 10, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('f71e2d65-4984-49b5-96b6-daf073386727', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6757026-827b-4dff-bc6e-778abe292ace', 'NICE-0005', 'P005', 'Collar Corazón Brillante', 'Dije corazón con cadena de 45cm', 'Plata 925', 980.00, 686.00, 441.00, 20, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('b0862aad-84db-4dec-b186-415200d4bca9', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6757026-827b-4dff-bc6e-778abe292ace', 'NICE-0006', 'P006', 'Collar Perlas Elegance', 'Collar de perlas cultivadas 6mm', 'Perlas/Plata', 1500.00, 1050.00, 675.00, 12, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('320daf7e-f552-45a1-afda-bcb811d952f7', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6757026-827b-4dff-bc6e-778abe292ace', 'NICE-0007', 'P007', 'Collar Inicial Personalizado', 'Letra a elegir con cadena fina', 'Oro 10k', 1200.00, 840.00, 540.00, 40, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('f8f96195-3eaf-4d83-aafb-76e58a88688a', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6757026-827b-4dff-bc6e-778abe292ace', 'NICE-0008', 'P008', 'Collar Cruz Diamantada', 'Cruz con acabado diamantado', 'Plata 925', 750.00, 525.00, 337.50, 25, 5, NULL, '[]', false, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('38e7a0cd-6561-463b-84f7-86114f45456e', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e74d9766-999d-4e40-ada8-f3620b918aa4', 'NICE-0009', 'P009', 'Aretes Huggies Diamond', 'Aretes abrazadera con circones', 'Plata 925', 680.00, 476.00, 306.00, 35, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('0b102af4-1089-40ef-ae86-d71cc35c6567', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e74d9766-999d-4e40-ada8-f3620b918aa4', 'NICE-0010', 'P010', 'Aretes Gota Cristal', 'Aretes largos con cristal Swarovski', 'Plata/Cristal', 950.00, 665.00, 427.50, 20, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('f484cdca-5947-4d43-94df-12e0dd76df39', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e74d9766-999d-4e40-ada8-f3620b918aa4', 'NICE-0011', 'P011', 'Aretes Perla Clásica', 'Perla de 8mm con poste de oro', 'Perla/Oro 10k', 1100.00, 770.00, 495.00, 18, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('a18c3013-ea10-4b6d-a1bf-c43616025c26', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e74d9766-999d-4e40-ada8-f3620b918aa4', 'NICE-0012', 'P012', 'Aretes Argolla Grande', 'Argollas 3cm acabado brillante', 'Oro 14k', 2800.00, 1960.00, 1260.00, 8, 5, NULL, '[]', false, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('6b89c4cb-0ed9-40f0-854c-988f4b123bf7', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'd03107b7-98d9-400c-a3ec-0cf48b3e2cb1', 'NICE-0013', 'P013', 'Pulsera Tennis Classic', 'Pulsera tennis con 30 circones', 'Plata 925', 1400.00, 980.00, 630.00, 15, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('bb9b99a0-8ce8-4399-82ec-ce355dd999b7', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'd03107b7-98d9-400c-a3ec-0cf48b3e2cb1', 'NICE-0014', 'P014', 'Pulsera Charm Love', 'Pulsera con 5 dijes incluidos', 'Plata 925', 890.00, 623.00, 400.50, 22, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('5c4f57a1-a3f0-4213-83ad-5b1dc68401b4', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'd03107b7-98d9-400c-a3ec-0cf48b3e2cb1', 'NICE-0015', 'P015', 'Pulsera Rígida Elegante', 'Brazalete rígido pulido', 'Oro 10k', 3200.00, 2240.00, 1440.00, 6, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('4cb6737d-15ed-4e20-8a8c-b3010f39ad07', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'd03107b7-98d9-400c-a3ec-0cf48b3e2cb1', 'NICE-0016', 'P016', 'Pulsera Riviera Colores', 'Piedras multicolor en línea', 'Plata 925', 1050.00, 735.00, 472.50, 18, 5, NULL, '[]', false, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('c3488324-57d4-4069-a6e1-568a3a75b7e7', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6e3ef4f-1f14-4dd7-87da-0cd40acd8f73', 'NICE-0017', 'P017', 'Reloj Glamour Rose', 'Reloj dama con cristales', 'Acero/Oro rosa', 1800.00, 1260.00, 810.00, 10, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('62dd8745-e3bb-46a0-b9ba-afa147eaeca2', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'e6e3ef4f-1f14-4dd7-87da-0cd40acd8f73', 'NICE-0018', 'P018', 'Reloj Classic Silver', 'Diseño minimalista elegante', 'Acero inoxidable', 1200.00, 840.00, 540.00, 15, 5, NULL, '[]', false, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('db8d40ce-0adc-4903-966e-d04835e2976e', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'c123f8c0-6ab8-4544-9bd9-72b6b61abde7', 'NICE-0019', 'P019', 'Set Novia Completo', 'Collar + Aretes + Pulsera + Tiara', 'Plata 925/Cristal', 4500.00, 3150.00, 2025.00, 5, 5, NULL, '[]', true, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('ccbca790-f727-4088-a9d1-a083db3cc35f', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'c123f8c0-6ab8-4544-9bd9-72b6b61abde7', 'NICE-0020', 'P020', 'Set XV Años Princess', 'Conjunto completo para quinceañera', 'Oro 10k/Circones', 6500.00, 4550.00, 2925.00, 4, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('ac611bad-bf21-414a-b2bf-f6882785c588', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, 'c123f8c0-6ab8-4544-9bd9-72b6b61abde7', 'NICE-0021', 'P021', 'Set Fiesta Elegante', 'Collar y aretes a juego', 'Plata 925', 1800.00, 1260.00, 810.00, 12, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('94350c01-eae2-4077-b00a-08a8efdc730e', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, '9966823b-31ae-4380-b9e6-0d9fcd1abac3', 'NICE-0022', 'P022', 'Broche Mariposa Cristal', 'Broche decorativo con cristales', 'Fantasía fina', 280.00, 196.00, 126.00, 50, 5, NULL, '[]', false, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('0db87797-6c4d-47b8-b36b-024f699154a3', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, '9966823b-31ae-4380-b9e6-0d9fcd1abac3', 'NICE-0023', 'P023', 'Pin Inicial Dorado', 'Pin con letra personalizable', 'Fantasía dorada', 150.00, 105.00, 67.50, 80, 5, NULL, '[]', false, true, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL),
	('73f21a8f-b0f9-41fe-aa2c-361b15b103df', '116b7b66-5eda-4a40-af1c-f52dfdb6b954', NULL, '9966823b-31ae-4380-b9e6-0d9fcd1abac3', 'NICE-0024', 'P024', 'Diadema Brillante', 'Diadema para ocasiones especiales', 'Metal/Cristales', 450.00, 315.00, 202.50, 20, 5, NULL, '[]', true, false, true, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00', NULL, false, false, false, NULL, true, 0, NULL, NULL, NULL);


--
-- Data for Name: nice_inventario_movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_inventario_vendedora; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nice_pedido_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_masivas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_documento_aval; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_mora_aval; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_mora_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: notificaciones_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pagos_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pagos_propiedades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."permisos" ("id", "clave_permiso", "descripcion", "created_at") VALUES
	('9660e2fb-cc4d-4540-9a10-38c1ca0541bf', 'usuarios.ver', 'Ver usuarios', '2026-01-15 02:36:04.888854'),
	('28cba83e-52d3-4dcc-8df8-63650180c4f0', 'usuarios.crear', 'Crear usuarios', '2026-01-15 02:36:04.888854'),
	('842e04db-816a-4244-bee1-58f5d4d7c0e6', 'usuarios.editar', 'Editar usuarios', '2026-01-15 02:36:04.888854'),
	('54accd9e-f6a8-45fc-8d73-f962ba7130cd', 'usuarios.eliminar', 'Eliminar usuarios', '2026-01-15 02:36:04.888854'),
	('a8e8cc23-ceb9-4588-ad8b-3118dbdb33f6', 'clientes.ver', 'Ver clientes', '2026-01-15 02:36:04.888854'),
	('b858f0ff-f6c6-4a2a-b162-7d1f842e9d66', 'clientes.crear', 'Crear clientes', '2026-01-15 02:36:04.888854'),
	('e3256b20-7c7a-4b86-99a2-07bcb0c83ff1', 'clientes.editar', 'Editar clientes', '2026-01-15 02:36:04.888854'),
	('4f08ab14-fb9c-45ba-bf18-8057f90adf37', 'clientes.eliminar', 'Eliminar clientes', '2026-01-15 02:36:04.888854'),
	('06d9bfe7-0aae-4d2e-97da-795561920fae', 'prestamos.ver', 'Ver préstamos', '2026-01-15 02:36:04.888854'),
	('a8e7f8f8-168c-436f-ba02-d149ce715fc0', 'prestamos.crear', 'Crear préstamos', '2026-01-15 02:36:04.888854'),
	('61a309a3-d569-41d5-bef6-3ca17c75adf1', 'prestamos.aprobar', 'Aprobar préstamos', '2026-01-15 02:36:04.888854'),
	('16980dde-fa6e-42fa-b6fb-c01db746b851', 'prestamos.eliminar', 'Eliminar préstamos', '2026-01-15 02:36:04.888854'),
	('64a8a24a-615d-4930-b424-765c4ec03a71', 'pagos.ver', 'Ver pagos', '2026-01-15 02:36:04.888854'),
	('fc4fd97e-22c9-460f-805e-f5cadb2880be', 'pagos.registrar', 'Registrar pagos', '2026-01-15 02:36:04.888854'),
	('86a76d42-1d96-477b-8ed4-fa52d8540052', 'pagos.eliminar', 'Eliminar pagos', '2026-01-15 02:36:04.888854'),
	('27b24d61-1bff-4847-9204-e0f1cdabbca4', 'tandas.ver', 'Ver tandas', '2026-01-15 02:36:04.888854'),
	('0c1423f8-1084-4728-a764-08f2b17bd674', 'tandas.crear', 'Crear tandas', '2026-01-15 02:36:04.888854'),
	('4081a712-98f1-42e6-9588-6bced5492c61', 'tandas.administrar', 'Administrar tandas', '2026-01-15 02:36:04.888854'),
	('45d851fd-f628-4079-8eb1-302b071caf55', 'reportes.ver', 'Ver reportes', '2026-01-15 02:36:04.888854'),
	('eccc1c27-2c53-4afe-86ef-11c6ed8f7114', 'reportes.exportar', 'Exportar reportes', '2026-01-15 02:36:04.888854'),
	('1041dec7-f99e-418e-8ccf-7ed88c35ffa0', 'configuracion.ver', 'Ver configuración', '2026-01-15 02:36:04.888854'),
	('7d823ceb-2645-4cc4-b10a-551fb59e0587', 'configuracion.editar', 'Editar configuración', '2026-01-15 02:36:04.888854'),
	('9d149556-7c20-4937-87fb-f2ab1d007f70', 'auditoria.ver', 'Ver auditoría', '2026-01-15 02:36:04.888854'),
	('745f1866-0cdc-4739-b237-3852f2670a26', 'ver_dashboard', 'Ver panel principal', '2026-01-15 02:36:04.888854'),
	('df487b0d-6e9e-43b1-99f7-d44f86f265bd', 'gestionar_clientes', 'Crear, editar y ver clientes', '2026-01-15 02:36:04.888854'),
	('10c17801-b6ad-4125-93b4-dc2ffecc6fb5', 'gestionar_prestamos', 'Crear, editar y ver préstamos', '2026-01-15 02:36:04.888854'),
	('c514ba80-c650-4199-b57b-b3b5125931af', 'gestionar_tandas', 'Crear, editar y ver tandas', '2026-01-15 02:36:04.888854'),
	('340a9611-ddb6-4be1-8186-b30027606708', 'gestionar_avales', 'Crear, editar y ver avales', '2026-01-15 02:36:04.888854'),
	('745ac85e-97f7-4ae0-9511-9a47bca596bd', 'gestionar_pagos', 'Registrar y ver pagos', '2026-01-15 02:36:04.888854'),
	('affedf13-9aaf-4dc7-96cb-45fab85b007d', 'gestionar_empleados', 'Crear, editar y ver empleados', '2026-01-15 02:36:04.888854'),
	('756b9cab-095d-41f1-b547-9afa1fc56c42', 'ver_reportes', 'Acceso a reportes y estadísticas', '2026-01-15 02:36:04.888854'),
	('d7f16294-9964-4521-8a7f-3c79c5522ec0', 'ver_auditoria', 'Ver registros de auditoría', '2026-01-15 02:36:04.888854'),
	('b6c3efb2-ddf6-4eac-a196-f8f932de05b4', 'gestionar_usuarios', 'Crear, editar usuarios y asignar roles', '2026-01-15 02:36:04.888854'),
	('486f6ec5-bda3-4f43-81cf-4662ae1d2d6f', 'gestionar_roles', 'Crear y modificar roles y permisos', '2026-01-15 02:36:04.888854'),
	('2bfa93f6-b493-430a-8ae9-98ebb90f4bee', 'gestionar_sucursales', 'Crear, editar y ver sucursales', '2026-01-15 02:36:04.888854'),
	('ce5e9705-6bd4-4cad-945a-453b1b5cd5c5', 'configuracion_global', 'Modificar configuración del sistema', '2026-01-15 02:36:04.888854'),
	('f64eab8f-acb5-4207-8d2f-0db64f755e3e', 'acceso_control_center', 'Acceso al centro de control total', '2026-01-15 02:36:04.888854');


--
-- Data for Name: preferencias_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: prestamos_avales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: promesas_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_cliente_contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_cliente_documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_cliente_notas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_rutas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_cortes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_entregas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_garrafones_historial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_inventario_garrafones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_precios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: purificadora_produccion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: qr_cobros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: qr_cobros_config; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: qr_cobros_escaneos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: qr_cobros_estadisticas_diarias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: qr_cobros_reportes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: recordatorios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: referencias_aval; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: registros_cobro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: roles_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."roles_permisos" ("id", "rol_id", "permiso_id", "created_at") VALUES
	('6907abc9-c945-42a4-932c-aa8ec4e658d0', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '9660e2fb-cc4d-4540-9a10-38c1ca0541bf', '2026-01-15 02:36:04.888854'),
	('e2182713-c47c-4e4d-8a59-19c4f0144727', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '28cba83e-52d3-4dcc-8df8-63650180c4f0', '2026-01-15 02:36:04.888854'),
	('645aafbd-9986-4a4f-93a8-dacbdfec41e6', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '842e04db-816a-4244-bee1-58f5d4d7c0e6', '2026-01-15 02:36:04.888854'),
	('902df0d3-99da-46c8-8072-168f4633ad31', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '54accd9e-f6a8-45fc-8d73-f962ba7130cd', '2026-01-15 02:36:04.888854'),
	('4268a253-ffb0-49c7-ab4b-974bf4f3d924', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'a8e8cc23-ceb9-4588-ad8b-3118dbdb33f6', '2026-01-15 02:36:04.888854'),
	('15b3f777-02ab-4971-8cda-867c3a9436ad', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'b858f0ff-f6c6-4a2a-b162-7d1f842e9d66', '2026-01-15 02:36:04.888854'),
	('3511c8ce-8110-4182-8797-acfd1c522683', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'e3256b20-7c7a-4b86-99a2-07bcb0c83ff1', '2026-01-15 02:36:04.888854'),
	('2683456c-58f2-4616-9693-4ad1aa4665f6', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '4f08ab14-fb9c-45ba-bf18-8057f90adf37', '2026-01-15 02:36:04.888854'),
	('e422bfb7-7623-4f80-8d82-de5b53e53a4d', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '06d9bfe7-0aae-4d2e-97da-795561920fae', '2026-01-15 02:36:04.888854'),
	('dbfabe9c-bb95-4e86-b210-4b0d068fc040', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'a8e7f8f8-168c-436f-ba02-d149ce715fc0', '2026-01-15 02:36:04.888854'),
	('dd4adb70-1e29-4ecf-87be-3e2094609f33', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '61a309a3-d569-41d5-bef6-3ca17c75adf1', '2026-01-15 02:36:04.888854'),
	('0ea036f7-cad0-408c-8bae-cb118218b8bd', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '16980dde-fa6e-42fa-b6fb-c01db746b851', '2026-01-15 02:36:04.888854'),
	('b112ed5f-354d-4db6-82a0-1f24e6f8c2d2', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '64a8a24a-615d-4930-b424-765c4ec03a71', '2026-01-15 02:36:04.888854'),
	('b1b035c1-3486-43b2-9b02-841df59f72ba', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'fc4fd97e-22c9-460f-805e-f5cadb2880be', '2026-01-15 02:36:04.888854'),
	('a0d96676-ffbb-40ec-a1bb-ac0f15c78ec2', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '86a76d42-1d96-477b-8ed4-fa52d8540052', '2026-01-15 02:36:04.888854'),
	('d1fd6e07-8aeb-4222-89bf-5a01924124b3', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '27b24d61-1bff-4847-9204-e0f1cdabbca4', '2026-01-15 02:36:04.888854'),
	('ff147f54-10cb-42a3-a8eb-63de464ee1f5', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '0c1423f8-1084-4728-a764-08f2b17bd674', '2026-01-15 02:36:04.888854'),
	('4496a13a-cd2a-4a1a-bc5b-d3bd9c628a6f', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '4081a712-98f1-42e6-9588-6bced5492c61', '2026-01-15 02:36:04.888854'),
	('ec77b338-b0f9-4259-98e4-32d980951d60', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '45d851fd-f628-4079-8eb1-302b071caf55', '2026-01-15 02:36:04.888854'),
	('e7b325d7-8bf3-40d0-90c6-1f53608b2ca4', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'eccc1c27-2c53-4afe-86ef-11c6ed8f7114', '2026-01-15 02:36:04.888854'),
	('101cf599-d4f7-469a-aa70-4168321725d1', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '1041dec7-f99e-418e-8ccf-7ed88c35ffa0', '2026-01-15 02:36:04.888854'),
	('c7433f3b-ffd2-4936-abc4-2f3425e9ed51', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '7d823ceb-2645-4cc4-b10a-551fb59e0587', '2026-01-15 02:36:04.888854'),
	('9d7c9a3a-aa52-4b5b-9f87-6d485ccb49e4', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '9d149556-7c20-4937-87fb-f2ab1d007f70', '2026-01-15 02:36:04.888854'),
	('3aeb118b-1579-420e-a638-63d9d3dcc7fb', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('0a729151-a3f6-4b2c-aa90-4a8ded839748', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'df487b0d-6e9e-43b1-99f7-d44f86f265bd', '2026-01-15 02:36:04.888854'),
	('54a9116a-cb01-4d3c-adab-e7cdc7e9d6b9', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '10c17801-b6ad-4125-93b4-dc2ffecc6fb5', '2026-01-15 02:36:04.888854'),
	('1eb89881-c3db-4ecb-ab88-d988ae8f221a', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'c514ba80-c650-4199-b57b-b3b5125931af', '2026-01-15 02:36:04.888854'),
	('9b9f9ca2-7b47-4944-ac15-2082f8ef184b', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '340a9611-ddb6-4be1-8186-b30027606708', '2026-01-15 02:36:04.888854'),
	('2a09a028-5945-4b52-a169-747d544ecc60', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '745ac85e-97f7-4ae0-9511-9a47bca596bd', '2026-01-15 02:36:04.888854'),
	('d80e40ec-3c2c-4707-9b92-cd9375f42194', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'affedf13-9aaf-4dc7-96cb-45fab85b007d', '2026-01-15 02:36:04.888854'),
	('39184056-fe9c-4354-b066-22f1f94f82a2', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '756b9cab-095d-41f1-b547-9afa1fc56c42', '2026-01-15 02:36:04.888854'),
	('5d68be74-a9a9-4bdc-b350-cdece283312b', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'd7f16294-9964-4521-8a7f-3c79c5522ec0', '2026-01-15 02:36:04.888854'),
	('f2d68ab1-83ee-4c28-acc2-2ac42cd36f3d', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'b6c3efb2-ddf6-4eac-a196-f8f932de05b4', '2026-01-15 02:36:04.888854'),
	('5489e93f-1122-4ca2-a8c3-da88e70172dd', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '486f6ec5-bda3-4f43-81cf-4662ae1d2d6f', '2026-01-15 02:36:04.888854'),
	('dfb903ca-0280-4348-848a-83064a0dfbad', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', '2bfa93f6-b493-430a-8ae9-98ebb90f4bee', '2026-01-15 02:36:04.888854'),
	('044cb3eb-a659-4751-99ad-ad8c0d13cf88', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'ce5e9705-6bd4-4cad-945a-453b1b5cd5c5', '2026-01-15 02:36:04.888854'),
	('5adcd607-6575-4214-9c77-1534166b144c', '73b2f74e-443a-4b4d-95e1-6af6b2bee850', 'f64eab8f-acb5-4207-8d2f-0db64f755e3e', '2026-01-15 02:36:04.888854'),
	('fc339c7e-42ce-40db-9191-4d633e2ed221', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '9660e2fb-cc4d-4540-9a10-38c1ca0541bf', '2026-01-15 02:36:04.888854'),
	('b76139c0-6077-4ca0-8d21-1cb24ede2d05', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '28cba83e-52d3-4dcc-8df8-63650180c4f0', '2026-01-15 02:36:04.888854'),
	('8f8a84c0-afef-4bd4-96a7-d8317fed9387', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '842e04db-816a-4244-bee1-58f5d4d7c0e6', '2026-01-15 02:36:04.888854'),
	('bc960d8d-c4da-4e6d-9080-0437cca976f1', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '54accd9e-f6a8-45fc-8d73-f962ba7130cd', '2026-01-15 02:36:04.888854'),
	('8a87cb6d-b25c-4393-9652-0b78689ca1ab', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'a8e8cc23-ceb9-4588-ad8b-3118dbdb33f6', '2026-01-15 02:36:04.888854'),
	('454ff1fa-d9c8-44ed-9470-f0e66aebf1f3', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'b858f0ff-f6c6-4a2a-b162-7d1f842e9d66', '2026-01-15 02:36:04.888854'),
	('55295b3e-a195-4408-aafe-c8c0e22c6aab', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'e3256b20-7c7a-4b86-99a2-07bcb0c83ff1', '2026-01-15 02:36:04.888854'),
	('30d20304-5f2c-4ec8-bf40-b91441fc8f8d', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '4f08ab14-fb9c-45ba-bf18-8057f90adf37', '2026-01-15 02:36:04.888854'),
	('45f1f998-16e0-4ba2-a01f-db0e47c04ab9', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '06d9bfe7-0aae-4d2e-97da-795561920fae', '2026-01-15 02:36:04.888854'),
	('ce218f7c-7d30-4c55-ac47-c0bb820867be', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'a8e7f8f8-168c-436f-ba02-d149ce715fc0', '2026-01-15 02:36:04.888854'),
	('c81adfa2-b5c2-4777-845b-7b723f90e1a6', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '61a309a3-d569-41d5-bef6-3ca17c75adf1', '2026-01-15 02:36:04.888854'),
	('f54ec27f-987e-4f06-b7f2-c26690182029', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '16980dde-fa6e-42fa-b6fb-c01db746b851', '2026-01-15 02:36:04.888854'),
	('37dc7262-303f-4c07-9582-b5291b484e02', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '64a8a24a-615d-4930-b424-765c4ec03a71', '2026-01-15 02:36:04.888854'),
	('8bc73e3d-6918-423e-a7c3-cfadbc562233', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'fc4fd97e-22c9-460f-805e-f5cadb2880be', '2026-01-15 02:36:04.888854'),
	('6641804a-8534-41a2-a0ab-5acb3139bec0', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '86a76d42-1d96-477b-8ed4-fa52d8540052', '2026-01-15 02:36:04.888854'),
	('c5989729-0bee-46db-ae8c-8a0db6c2bdd4', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '27b24d61-1bff-4847-9204-e0f1cdabbca4', '2026-01-15 02:36:04.888854'),
	('89a907c2-a466-4efb-9c59-fe4b5ba03207', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '0c1423f8-1084-4728-a764-08f2b17bd674', '2026-01-15 02:36:04.888854'),
	('3078bc9f-cee2-4b44-84e2-e284b0b28e0b', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '4081a712-98f1-42e6-9588-6bced5492c61', '2026-01-15 02:36:04.888854'),
	('cb3bbf9b-ce0b-40e2-84ce-d62c16ea80ff', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '45d851fd-f628-4079-8eb1-302b071caf55', '2026-01-15 02:36:04.888854'),
	('ff956777-9cbf-4cc4-9112-3caade115826', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'eccc1c27-2c53-4afe-86ef-11c6ed8f7114', '2026-01-15 02:36:04.888854'),
	('d169d3b7-20df-401e-b7a4-34248e18af34', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '1041dec7-f99e-418e-8ccf-7ed88c35ffa0', '2026-01-15 02:36:04.888854'),
	('836cee3c-5c39-4481-bf55-9f1f64f5cabc', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '7d823ceb-2645-4cc4-b10a-551fb59e0587', '2026-01-15 02:36:04.888854'),
	('83705852-891f-48f1-a671-7e8b47d861c5', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '9d149556-7c20-4937-87fb-f2ab1d007f70', '2026-01-15 02:36:04.888854'),
	('67e3aca7-eb01-4c17-9498-82dfd480e6f0', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('ecb9c82c-f4d5-467b-9ad8-a6115beb2edd', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'df487b0d-6e9e-43b1-99f7-d44f86f265bd', '2026-01-15 02:36:04.888854'),
	('82dccf24-200e-451d-bb14-8d8dd561ac11', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '10c17801-b6ad-4125-93b4-dc2ffecc6fb5', '2026-01-15 02:36:04.888854'),
	('d2b41fd6-fd18-467f-8d1e-284a06205450', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'c514ba80-c650-4199-b57b-b3b5125931af', '2026-01-15 02:36:04.888854'),
	('42decfa9-7192-4b98-8f42-ffa423622277', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '340a9611-ddb6-4be1-8186-b30027606708', '2026-01-15 02:36:04.888854'),
	('465850c2-6b36-4c0f-8002-c88c5983bc4c', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '745ac85e-97f7-4ae0-9511-9a47bca596bd', '2026-01-15 02:36:04.888854'),
	('1675d733-2e58-43a6-bea0-9fd9fe1a0ec6', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'affedf13-9aaf-4dc7-96cb-45fab85b007d', '2026-01-15 02:36:04.888854'),
	('482c8822-efcb-4d5e-b287-b1ddb9ad6b4c', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '756b9cab-095d-41f1-b547-9afa1fc56c42', '2026-01-15 02:36:04.888854'),
	('2ec24148-1a92-467b-a464-6ac939dc1dd9', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'd7f16294-9964-4521-8a7f-3c79c5522ec0', '2026-01-15 02:36:04.888854'),
	('a85a86dc-e408-4b27-8dc6-39fb26eebba7', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'b6c3efb2-ddf6-4eac-a196-f8f932de05b4', '2026-01-15 02:36:04.888854'),
	('d43068da-7fd6-48bd-be5a-03de1975ef1b', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '2bfa93f6-b493-430a-8ae9-98ebb90f4bee', '2026-01-15 02:36:04.888854'),
	('8067b720-4505-4004-b8f9-ca699abac101', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('a0abf8d7-4492-4c59-8052-5c6f6e08b098', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', 'df487b0d-6e9e-43b1-99f7-d44f86f265bd', '2026-01-15 02:36:04.888854'),
	('e3fd66a6-87db-42e8-ace9-70d1c71c5665', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', '10c17801-b6ad-4125-93b4-dc2ffecc6fb5', '2026-01-15 02:36:04.888854'),
	('979c5c9d-90ca-49ce-aa24-9704cb0c4d33', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', 'c514ba80-c650-4199-b57b-b3b5125931af', '2026-01-15 02:36:04.888854'),
	('b996d4ee-2077-42ec-b872-0479a2a8ee4a', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', '340a9611-ddb6-4be1-8186-b30027606708', '2026-01-15 02:36:04.888854'),
	('2bd213a5-3dfb-4f80-9097-b2f1f8701bab', 'f01cc0f3-4cc8-405a-8c87-6f8a92b1edec', '745ac85e-97f7-4ae0-9511-9a47bca596bd', '2026-01-15 02:36:04.888854'),
	('271aaec4-f62a-4ef0-b66d-79934ba8b748', '0dc65d43-cfe2-41d3-b1f2-96fd082ac5df', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('bd4c32a0-1c17-4e45-a365-19c9ba13af85', '44756384-4235-4138-a7a8-d6ceff2aebcb', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('b4abd3f2-9906-4181-b205-58ce82c9fbf4', '44756384-4235-4138-a7a8-d6ceff2aebcb', '10c17801-b6ad-4125-93b4-dc2ffecc6fb5', '2026-01-15 02:36:04.888854'),
	('97297ebd-14b3-4bb4-b558-c771a65a932b', '44756384-4235-4138-a7a8-d6ceff2aebcb', 'c514ba80-c650-4199-b57b-b3b5125931af', '2026-01-15 02:36:04.888854'),
	('b1ffaa1b-eb6f-4306-98bd-0007023920ab', '44756384-4235-4138-a7a8-d6ceff2aebcb', '745ac85e-97f7-4ae0-9511-9a47bca596bd', '2026-01-15 02:36:04.888854'),
	('8770ae93-bcd0-4987-9706-1ccced1c8632', '44756384-4235-4138-a7a8-d6ceff2aebcb', '756b9cab-095d-41f1-b547-9afa1fc56c42', '2026-01-15 02:36:04.888854'),
	('355cad97-0a92-4e17-bda4-edd6e3d9bfa8', '44756384-4235-4138-a7a8-d6ceff2aebcb', 'd7f16294-9964-4521-8a7f-3c79c5522ec0', '2026-01-15 02:36:04.888854'),
	('d0fb05ed-3461-4955-b1e0-46f61d7c623d', '8ccd3a9c-d625-482a-8058-8ebbe9ec5c42', '745f1866-0cdc-4739-b237-3852f2670a26', '2026-01-15 02:36:04.888854'),
	('a17ba3f8-fd3d-4c70-b1f7-77347bbb1141', '8ccd3a9c-d625-482a-8058-8ebbe9ec5c42', 'affedf13-9aaf-4dc7-96cb-45fab85b007d', '2026-01-15 02:36:04.888854'),
	('1e8c531e-177e-45db-9448-89180e78d278', '8ccd3a9c-d625-482a-8058-8ebbe9ec5c42', '756b9cab-095d-41f1-b547-9afa1fc56c42', '2026-01-15 02:36:04.888854'),
	('e001cc26-23ad-490d-aede-12120abee27a', '8ccd3a9c-d625-482a-8058-8ebbe9ec5c42', 'b6c3efb2-ddf6-4eac-a196-f8f932de05b4', '2026-01-15 02:36:04.888854'),
	('ab77b904-7a19-40df-b9da-9956c04dd301', '6b05b279-3c50-48a7-b3f6-f84960b825b9', '486f6ec5-bda3-4f43-81cf-4662ae1d2d6f', '2026-01-15 02:36:07.717687'),
	('b5f573bc-9b2f-42eb-a6de-9ca905eb5972', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'ce5e9705-6bd4-4cad-945a-453b1b5cd5c5', '2026-01-15 02:36:08.7384'),
	('c082df84-728a-4dce-89ae-0762f26b171e', '6b05b279-3c50-48a7-b3f6-f84960b825b9', 'f64eab8f-acb5-4207-8d2f-0db64f755e3e', '2026-01-15 02:36:08.7384');


--
-- Data for Name: seguimiento_judicial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: stripe_config; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: stripe_transactions_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tanda_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tandas_avales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_virtuales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_alertas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_digitales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_recargas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_titulares; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tarjetas_transacciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: temas_app; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."temas_app" ("id", "nombre", "descripcion", "color_primario", "color_secundario", "color_acento", "color_texto", "activo", "creado_por", "created_at", "updated_at") VALUES
	('7366744b-5f06-419c-a3b8-455e8a38ce67', 'Neón Oscuro', 'Tema oscuro con acentos neón', '#1E1E2C', '#2D2D44', '#00BCD4', '#FFFFFF', true, NULL, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00'),
	('13eb2ea6-0f79-459a-8cc0-eb25bccc1445', 'Verde Dinero', 'Tema inspirado en finanzas', '#0D2818', '#1E3D2F', '#4CAF50', '#FFFFFF', false, NULL, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00'),
	('3c6b31ef-ffdb-4e1d-8cde-277d3a0a6b06', 'Dorado Premium', 'Tema elegante dorado', '#1A1A2E', '#16213E', '#FFD700', '#FFFFFF', false, NULL, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00'),
	('fc7f0bf8-4890-4ed0-bacd-b96fe76127c3', 'Azul Corporativo', 'Tema profesional azul', '#0A1929', '#132F4C', '#0288D1', '#FFFFFF', false, NULL, '2026-01-15 02:36:04.888854+00', '2026-01-15 02:36:04.888854+00');


--
-- Data for Name: transacciones_tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuarios_negocios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuarios_sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: validaciones_aval; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: variantes_arquilado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."variantes_arquilado" ("id", "nombre", "descripcion", "capital_al_final", "permite_renovacion", "intereses_acumulados", "permite_abonos_capital", "interes_minimo", "interes_maximo", "frecuencias_permitidas", "monto_minimo", "monto_maximo", "plazo_minimo_periodos", "plazo_maximo_periodos", "activo", "created_at") VALUES
	('58b0d255-53af-41ea-b5d2-ec3cf539737b', 'clasico', 'Arquilado Clásico: Paga solo interés cada periodo. Al final devuelve capital + último interés. El más común.', true, false, false, false, 1.00, 20.00, '{Semanal,Quincenal,Mensual}', 1000.00, 1000000.00, 4, 52, true, '2026-01-15 02:36:04.888854'),
	('489116b0-46f9-45d0-b3a7-b84ebee8bb28', 'renovable', 'Arquilado Renovable: Al terminar el plazo, puede renovar automáticamente por otro periodo sin pagar capital.', true, true, false, false, 1.00, 20.00, '{Semanal,Quincenal,Mensual}', 1000.00, 1000000.00, 4, 52, true, '2026-01-15 02:36:04.888854'),
	('64d89ecf-9df7-4f92-ba88-fe159433f061', 'acumulado', 'Arquilado Acumulado: Si no paga interés de un periodo, se suma al siguiente. Riesgoso para el cliente.', true, false, true, false, 1.00, 20.00, '{Semanal,Quincenal,Mensual}', 1000.00, 1000000.00, 4, 52, true, '2026-01-15 02:36:04.888854'),
	('ecc35667-ac53-43e4-8dc3-67cbdcb2774e', 'mixto', 'Arquilado Mixto: Puede hacer abonos a capital cuando quiera. El interés se calcula sobre el saldo.', true, false, false, true, 1.00, 20.00, '{Semanal,Quincenal,Mensual}', 1000.00, 1000000.00, 4, 52, true, '2026-01-15 02:36:04.888854');


--
-- Data for Name: ventas_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_cliente_contactos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_cliente_creditos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_cliente_documentos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_cliente_notas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_cotizaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_pedidos_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ventas_pedidos_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: verificaciones_identidad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") VALUES
	('fondos', 'fondos', NULL, '2026-01-11 03:26:30.586216+00', '2026-01-11 03:26:30.586216+00', true, false, 5242880, '{image/jpeg,image/png,image/webp,image/gif}', NULL, 'STANDARD'),
	('comprobantes', 'comprobantes', NULL, '2026-01-11 03:26:30.586216+00', '2026-01-11 03:26:30.586216+00', false, false, 10485760, '{image/jpeg,image/png,application/pdf}', NULL, 'STANDARD'),
	('documentos', 'documentos', NULL, '2026-01-11 03:26:30.586216+00', '2026-01-11 03:26:30.586216+00', false, false, 10485760, '{image/jpeg,image/png,application/pdf}', NULL, 'STANDARD'),
	('avatares', 'avatares', NULL, '2026-01-11 03:26:30.586216+00', '2026-01-11 03:26:30.586216+00', true, false, 2097152, '{image/jpeg,image/png,image/webp}', NULL, 'STANDARD'),
	('logos', 'logos', NULL, '2026-01-11 03:26:30.586216+00', '2026-01-11 03:26:30.586216+00', true, false, 2097152, '{image/jpeg,image/png,image/svg+xml,image/webp}', NULL, 'STANDARD');


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 233, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict yi8AWDbWeQZ79r9ArVMpFb09GwB7wA6K9KWTgPKIzReuOVsTEXW6WSyjG1ugwfm

RESET ALL;
