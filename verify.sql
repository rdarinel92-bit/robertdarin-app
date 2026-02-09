-- Verificar estado actual
SELECT 'USUARIOS_ROLES:' as tabla, COUNT(*) as registros FROM usuarios_roles;
SELECT 'TU USUARIO:' as info, u.email, r.nombre as rol 
FROM usuarios u
LEFT JOIN usuarios_roles ur ON u.id = ur.usuario_id
LEFT JOIN roles r ON ur.rol_id = r.id
WHERE u.email = 'rdarinel92@gmail.com';
