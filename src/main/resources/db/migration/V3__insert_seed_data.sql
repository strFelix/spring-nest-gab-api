-- USERS
INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Carlos Operador',
    'carlos.operador@aguiabranca.com.br',
    '$2a$10$7QJ8zV3kL9mN2pX6wY1uOeR4sT5vU0iA3bC8dE6fG9hI2jK4lM7n',
    'OPERATOR'
);

INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Ana Gestora',
    'ana.gestora@aguiabranca.com.br',
    '$2a$10$7QJ8zV3kL9mN2pX6wY1uOeR4sT5vU0iA3bC8dE6fG9hI2jK4lM7n',
    'MANAGER'
);

INSERT INTO TB_USER (NAME, EMAIL, PASSWORD, ROLE) VALUES (
    'Roberto Lider',
    'roberto.lider@aguiabranca.com.br',
    '$2a$10$7QJ8zV3kL9mN2pX6wY1uOeR4sT5vU0iA3bC8dE6fG9hI2jK4lM7n',
    'LEADER'
);

-- STRATEGIC GUIDELINES (criadas pelo leader, ID 3)
INSERT INTO TB_STRATEGIC_GUIDELINE (TITLE, CONTENT, CREATED_BY) VALUES (
    'Redução de Custos Operacionais 2025',
    'Priorizar iniciativas que gerem redução de pelo menos 10% nos custos operacionais das divisões de Logística e Passageiros. Foco em automação de processos manuais e otimização de rotas.',
    3
);

INSERT INTO TB_STRATEGIC_GUIDELINE (TITLE, CONTENT, CREATED_BY) VALUES (
    'Digitalização da Experiência do Cliente',
    'Mapear e digitalizar os principais pontos de contato com o cliente nas três divisões. Iniciativas devem contemplar acessibilidade e simplicidade de uso para todos os perfis de usuário.',
    3
);

INSERT INTO TB_STRATEGIC_GUIDELINE (TITLE, CONTENT, CREATED_BY) VALUES (
    'Sustentabilidade e ESG',
    'Apoiar projetos que contribuam com as metas ESG do Grupo, especialmente redução de emissões na frota e gestão eficiente de resíduos nas operações industriais.',
    3
);

-- IDEAS (submetidas pelo operador, ID 1)
INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, SUBMITTED_BY) VALUES (
    'Checklist digital para vistoria de frota',
    'Substituir o checklist em papel usado pelos motoristas por um formulário digital no celular. Reduziria erros de preenchimento e centralizaria os dados de manutenção preventiva.',
    'PENDING',
    1
);

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT) VALUES (
    'Roteirização inteligente para entregas urbanas',
    'Implementar um algoritmo de roteirização que considere trânsito em tempo real para as entregas urbanas da divisão de Logística. Estimativa de redução de 15% no tempo médio de entrega.',
    'PRIORITIZED',
    1,
    1,
    2,
    SYSTIMESTAMP
);

INSERT INTO TB_IDEA (TITLE, DESCRIPTION, STATUS, PRIORITY, SUBMITTED_BY, REVIEWED_BY, REVIEWED_AT) VALUES (
    'App de autoatendimento para passageiros',
    'Desenvolver um canal de autoatendimento para compra de passagens e consulta de horários diretamente pelo celular, reduzindo filas nas bilheterias.',
    'APPROVED',
    2,
    1,
    2,
    SYSTIMESTAMP
);

-- PROJECT (criado pelo gestor, ID 2 — originado da ideia aprovada, ID 3)
INSERT INTO TB_PROJECT (
    TITLE, DESCRIPTION, STATUS, STAGE,
    INVESTMENT, EXPECTED_RETURN, ACTUAL_RETURN, PRODUCTIVITY_GAIN,
    START_DATE, END_DATE,
    CREATED_BY, IDEA_ID
) VALUES (
    'App Autoatendimento Passageiros',
    'Desenvolvimento e implantação do canal mobile de autoatendimento para compra de passagens e consulta de horários. Fase inicial contempla as 10 principais rotas interestaduais.',
    'IN_PROGRESS',
    'EXECUTION',
    250000.00,
    900000.00,
    NULL,
    NULL,
    DATE '2025-03-01',
    DATE '2025-09-30',
    2,
    3
);

COMMIT;