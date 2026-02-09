CREATE TABLE IF NOT EXISTS tarjetas_chat (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tarjeta_id UUID REFERENCES tarjetas_servicio(id) ON DELETE CASCADE,
    negocio_id UUID,
    visitante_id TEXT NOT NULL,
    visitante_nombre TEXT,
    mensaje TEXT NOT NULL,
    es_respuesta BOOLEAN DEFAULT FALSE,
    leido BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE tarjetas_chat ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS tarjetas_chat_anon_insert ON tarjetas_chat;
CREATE POLICY tarjetas_chat_anon_insert ON tarjetas_chat FOR INSERT TO anon WITH CHECK (es_respuesta = FALSE);
DROP POLICY IF EXISTS tarjetas_chat_anon_select ON tarjetas_chat;
CREATE POLICY tarjetas_chat_anon_select ON tarjetas_chat FOR SELECT TO anon USING (TRUE);
DROP POLICY IF EXISTS tarjetas_chat_authenticated ON tarjetas_chat;
CREATE POLICY tarjetas_chat_authenticated ON tarjetas_chat FOR ALL TO authenticated USING (TRUE);
