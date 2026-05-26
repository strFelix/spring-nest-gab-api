-- ADDITIONAL USERS
INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Fernanda Operadora',
    'fernanda.operadora@aguiabranca.com.br',
    '$2a$10$isqe25sTQA/9XHKFHFCHp.ZaspiB40n2SYLXXcrzKx4AzdCXgFkDW',
    'OPERATOR'
);

INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Marcos Operador',
    'marcos.operador@aguiabranca.com.br',
    '$2a$10$isqe25sTQA/9XHKFHFCHp.ZaspiB40n2SYLXXcrzKx4AzdCXgFkDW',
    'OPERATOR'
);

INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Patricia Gestora',
    'patricia.gestora@aguiabranca.com.br',
    '$2a$10$isqe25sTQA/9XHKFHFCHp.ZaspiB40n2SYLXXcrzKx4AzdCXgFkDW',
    'MANAGER'
);

-- ADDITIONAL STRATEGIC GUIDELINES
INSERT INTO TB_STRATEGIC_GUIDELINE (TITLE, CONTENT, CREATED_BY)
SELECT 'Excelência Operacional na Frota',
       'Implementar indicadores de desempenho (KPIs) para monitoramento contínuo da frota. Foco em redução de tempo ocioso, manutenção preditiva e aumento da vida útil dos veículos.',
       ID FROM TB_USER WHERE EMAIL = 'roberto.lider@aguiabranca.com.br';

INSERT INTO TB_STRATEGIC_GUIDELINE (TITLE, CONTENT, CREATED_BY)
SELECT 'Cultura de Inovação Distribuída',
       'Estimular a participação ativa de colaboradores de todos os níveis na geração de ideias. Meta de ao menos 2 ideias por colaborador por semestre, com reconhecimento das contribuições aprovadas.',
       ID FROM TB_USER WHERE EMAIL = 'roberto.lider@aguiabranca.com.br';

-- ADDITIONAL IDEAS — OPERATOR Carlos (reviewed by Ana Gestora)
INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Sistema de rastreamento GPS em tempo real',
       'Implementar rastreamento GPS em tempo real para todos os veículos da frota, permitindo monitoramento centralizado, redução de desvios de rota e estimativa de chegada mais precisa.',
       'APPROVED', 1,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'carlos.operador@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Aplicativo de comunicação interna para motoristas',
       'Criar um canal de comunicação direta entre motoristas e o centro de operações via app, eliminando o uso de rádio e reduzindo falhas de comunicação em situações de emergência.',
       'APPROVED', 2,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'carlos.operador@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, SUBMITTED_BY)
SELECT 'QR Code para embarque sem papel',
       'Substituir a impressão de bilhetes físicos por QR Code no celular do passageiro, reduzindo custos de impressão e agilizando o processo de embarque nas plataformas.',
       'PENDING',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'carlos.operador@aguiabranca.com.br')
FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, SUBMITTED_BY)
SELECT 'Câmeras de monitoramento nas plataformas',
       'Instalar câmeras com reconhecimento de lotação nas plataformas de embarque para otimizar a alocação de ônibus em horários de pico e melhorar a segurança dos passageiros.',
       'PENDING',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'carlos.operador@aguiabranca.com.br')
FROM DUAL;

-- ADDITIONAL IDEAS — OPERATOR Fernanda
INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Treinamento digital gamificado para novos colaboradores',
       'Desenvolver um módulo de onboarding gamificado acessível pelo celular, com trilhas de aprendizado por área. Reduziria o tempo de integração de 30 para 15 dias e aumentaria o engajamento.',
       'APPROVED', 1,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'fernanda.operadora@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Dashboard de produtividade por rota',
       'Criar painel de visualização de indicadores de produtividade por rota em tempo real, acessível para gestores e líderes. Facilitaria decisões rápidas sobre realocação de recursos.',
       'PRIORITIZED', 2,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'fernanda.operadora@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, SUBMITTED_BY)
SELECT 'Programa de carona solidária entre colaboradores',
       'Criar uma plataforma interna para que colaboradores que residem em regiões próximas possam compartilhar trajetos até o trabalho, reduzindo custos de transporte e emissões de carbono.',
       'PENDING',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'fernanda.operadora@aguiabranca.com.br')
FROM DUAL;

-- ADDITIONAL IDEAS — OPERATOR Marcos
INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Manutenção preditiva baseada em telemetria',
       'Usar dados de telemetria dos veículos para prever falhas mecânicas antes que ocorram. Estimativa de redução de 40% nas paradas não programadas e economia de R$ 800 mil/ano.',
       'APPROVED', 1,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'marcos.operador@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Otimização de carregamento de bagagens',
       'Implementar sistema de pesagem e distribuição inteligente de bagagens nos compartimentos, reduzindo o consumo de combustível por desequilíbrio de carga em até 8%.',
       'PRIORITIZED', 3,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'marcos.operador@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, SUBMITTED_BY)
SELECT 'Totens de autoatendimento nas rodoviárias',
       'Instalar totens touch screen nas principais rodoviárias para compra de passagens, consulta de horários e impressão de bilhetes, reduzindo filas nos guichês em até 60%.',
       'PENDING',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'marcos.operador@aguiabranca.com.br')
FROM DUAL;

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT)
SELECT 'Redução do consumo de combustível com eco-driving',
       'Programa de treinamento e monitoramento de comportamento ao volante com foco em técnicas de eco-driving. Estimativa de redução de 12% no consumo médio da frota.',
       'REJECTED', NULL,
       (SELECT ID FROM TB_USER WHERE EMAIL = 'marcos.operador@aguiabranca.com.br'),
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       SYSTIMESTAMP FROM DUAL;

-- ADDITIONAL PROJECTS
INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'Rastreamento GPS Frota',
       'Implementação do sistema de rastreamento GPS em tempo real para toda a frota da divisão de Logística. Fase 1 contempla 120 veículos nas rotas urbanas de SP e RJ.',
       'IN_PROGRESS', 'EXECUTION',
       180000.00, 650000.00, NULL, NULL,
       DATE '2025-04-01', DATE '2025-10-31',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       (SELECT ID FROM TB_IDEA WHERE TITLE = 'Sistema de rastreamento GPS em tempo real')
FROM DUAL;

INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'Manutenção Preditiva por Telemetria',
       'Integração de sensores de telemetria nos veículos e desenvolvimento de dashboard de alertas preditivos. Parceria com fornecedor especializado em IoT automotivo.',
       'IN_PROGRESS', 'PLANNING',
       320000.00, 1200000.00, NULL, NULL,
       DATE '2025-05-01', DATE '2026-02-28',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       (SELECT ID FROM TB_IDEA WHERE TITLE = 'Manutenção preditiva baseada em telemetria')
FROM DUAL;

INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'Treinamento Digital Gamificado',
       'Desenvolvimento da plataforma mobile de onboarding gamificado para novos colaboradores com módulos por área funcional, quizzes e sistema de pontuação.',
       'COMPLETED', 'COMPLETED',
       95000.00, 280000.00, 310000.00, 28.50,
       DATE '2025-01-15', DATE '2025-04-30',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       (SELECT ID FROM TB_IDEA WHERE TITLE = 'Treinamento digital gamificado para novos colaboradores')
FROM DUAL;

INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'App Comunicação Interna Motoristas',
       'Desenvolvimento do aplicativo mobile de comunicação entre motoristas e centro de operações. Substituição do sistema de rádio por canal digital com histórico e alertas.',
       'COMPLETED', 'COMPLETED',
       140000.00, 420000.00, 395000.00, 35.00,
       DATE '2024-11-01', DATE '2025-03-31',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       (SELECT ID FROM TB_IDEA WHERE TITLE = 'Aplicativo de comunicação interna para motoristas')
FROM DUAL;

INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'QR Code Embarque Digital',
       'Implementação do sistema de embarque por QR Code em substituição aos bilhetes físicos. Integração com app de autoatendimento e sistemas das rodoviárias parceiras.',
       'PLANNING', 'VALIDATION',
       75000.00, 320000.00, NULL, NULL,
       DATE '2025-06-01', DATE '2025-11-30',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'patricia.gestora@aguiabranca.com.br'),
       NULL
FROM DUAL;

INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE, CREATED_BY, IDEA_ID
)
SELECT 'Dashboard Produtividade por Rota',
       'Desenvolvimento do painel de KPIs por rota com atualização em tempo real. Integração com sistemas de telemetria, GPS e bilhetagem.',
       'IN_PROGRESS', 'EXECUTION',
       110000.00, 380000.00, 85000.00, 18.00,
       DATE '2025-03-15', DATE '2025-08-31',
       (SELECT ID FROM TB_USER WHERE EMAIL = 'ana.gestora@aguiabranca.com.br'),
       (SELECT ID FROM TB_IDEA WHERE TITLE = 'Dashboard de produtividade por rota')
FROM DUAL;

COMMIT;