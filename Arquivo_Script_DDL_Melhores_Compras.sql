-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-03-27 13:04:57 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE MC_AVALIACAO_VIDEO CASCADE CONSTRAINTS 
;

DROP TABLE MC_BAIRRO CASCADE CONSTRAINTS 
;

DROP TABLE MC_CATEGORIA_PROD CASCADE CONSTRAINTS 
;

DROP TABLE MC_CIDADE CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLASS_VIDEO CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLI_FISICA CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLI_JURIDICA CASCADE CONSTRAINTS 
;

DROP TABLE MC_CLIENTE CASCADE CONSTRAINTS 
;

DROP TABLE MC_DEPTO CASCADE CONSTRAINTS 
;

DROP TABLE MC_END_CLI CASCADE CONSTRAINTS 
;

DROP TABLE MC_END_FUNC CASCADE CONSTRAINTS 
;

DROP TABLE MC_ESTADO CASCADE CONSTRAINTS 
;

DROP TABLE MC_FUNCIONARIO CASCADE CONSTRAINTS 
;

DROP TABLE MC_LOGRADOURO CASCADE CONSTRAINTS 
;

DROP TABLE MC_PRODUTO CASCADE CONSTRAINTS 
;

DROP TABLE MC_SGV_SAC CASCADE CONSTRAINTS 
;

DROP TABLE MC_VIDEO CASCADE CONSTRAINTS 
;

DROP TABLE MC_VISUALIZACAO CASCADE CONSTRAINTS 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE MC_AVALIACAO_VIDEO 
    ( 
     CD_AVALIACAO      NUMBER (10)  NOT NULL , 
     NR_CLIENTE        NUMBER (10)  NOT NULL , 
     CD_VIDEO          NUMBER (10)  NOT NULL , 
     NT_VIDEO          NUMBER (2)  NOT NULL , 
     DS_COMPLETA_VIDEO VARCHAR2 (200) 
    ) 
;

COMMENT ON COLUMN MC_AVALIACAO_VIDEO.CD_AVALIACAO IS 'Essa coluna irá armazenar a chave primária da tabela de avaliações da Melhores Compras. A cada vez que o cliente avaliar o vídeo será acionada a Sequence  SQ_MC_AVALIACAO  que se encarregará de gerar o próximo número único da avaliação' 
;

COMMENT ON COLUMN MC_AVALIACAO_VIDEO.NR_CLIENTE IS 'Essa coluna irá receber a chave primária da tabela MC_CLIENTE. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_AVALIACAO_VIDEO.CD_VIDEO IS 'Essa coluna irá receber a chave primária da tabela MC_VIDEO' 
;

COMMENT ON COLUMN MC_AVALIACAO_VIDEO.NT_VIDEO IS 'Essa coluna irá receber a nota do vídeo. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_AVALIACAO_VIDEO.DS_COMPLETA_VIDEO IS 'Essa coluna reberá a opinião do cliente sobre o vídeo. Seu conteúdo é opicional.' 
;

ALTER TABLE MC_AVALIACAO_VIDEO 
    ADD CONSTRAINT MC_AVALIACAO_VIDEO_PK PRIMARY KEY ( CD_AVALIACAO ) ;

CREATE TABLE MC_BAIRRO 
    ( 
     MC_BAIRRO_ID   NUMBER  NOT NULL , 
     CD_BAIRRO      NUMBER (8)  NOT NULL , 
     MC_CIDADE_ID   NUMBER  NOT NULL , 
     CD_CIDADE      NUMBER  NOT NULL , 
     NM_BAIRRO      VARCHAR2 (45) , 
     NM_ZONA_BAIRRO VARCHAR2 (20) 
    ) 
;

COMMENT ON COLUMN MC_BAIRRO.MC_BAIRRO_ID IS 'Esta coluna irá receber o ID do bairro, essa coluna representa a chave primaria da tabela MC_BAIRRO. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.MC_CIDADE_ID IS 'Essa coluna irá receber a chave primária da tabela MC_CIDADE. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_BAIRRO.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade. Esse  conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_BAIRRO IS 'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_BAIRRO.NM_ZONA_BAIRRO IS 'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT MC_BAIRRO_PK PRIMARY KEY ( MC_BAIRRO_ID ) ;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT UN_MC_BAIRRO_CD_BAIRRO UNIQUE ( CD_BAIRRO ) ;

CREATE TABLE MC_CATEGORIA_PROD 
    ( 
     MC_CATEGORIA_PROD_ID NUMBER  NOT NULL , 
     CD_CATEGORIA         NUMBER  NOT NULL , 
     TP_CATEGORIA         CHAR (1)  NOT NULL , 
     DS_CATEGORIA         VARCHAR2 (500)  NOT NULL , 
     DT_INICIO            DATE , 
     DT_TERMINO           DATE , 
     ST_CATEGORIA         CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.MC_CATEGORIA_PROD_ID IS 'Essa coluna irá armazenar a chave primária da tabela de categorias da Melhores Compras. A cada vez que um nova categoria que for criada  será acionada a Sequence  SQ_MC_CATEGORIA  que se encarregará de gerar o próximo número único da categoria' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.CD_CATEGORIA IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.TP_CATEGORIA IS 'Nessa  coluna  será  armazenada o tipo de categoria que poderá  ser (V)ídeo ou (P)rodudto. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DS_CATEGORIA IS 'Essa coluna irá armazenar descrição da categoria de produtos da Melhorees Compras. Cada categoria tem uma  descrição única e serve para organizar os produtos em categorias simliares, melhorando a tomada de decisão.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DT_INICIO IS 'Essa coluna irá receber  a data de início da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  obrigatório.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.DT_TERMINO IS 'Essa coluna irá receber  a data de encerramento  da categoria. Seu formato é dd/mm/yyyy e seu conteúdo deve ser sempre  opcional. Conteúdo obrigatório significa que a categoria foi encerrada a partir da data término. Já o conteúdo opcional indica que a categoria está ativa e operante.' 
;

COMMENT ON COLUMN MC_CATEGORIA_PROD.ST_CATEGORIA IS 'Essa coluna irá armazenar o stauts da categoria da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

ALTER TABLE MC_CATEGORIA_PROD 
    ADD CONSTRAINT MC_CATEGORIA_PROD_PK PRIMARY KEY ( MC_CATEGORIA_PROD_ID ) ;

ALTER TABLE MC_CATEGORIA_PROD 
    ADD CONSTRAINT UN_MC_CAT_PROD_CD UNIQUE ( CD_CATEGORIA ) ;

CREATE TABLE MC_CIDADE 
    ( 
     MC_CIDADE_ID NUMBER  NOT NULL , 
     CD_CIDADE    NUMBER (8)  NOT NULL , 
     MC_ESTADO_ID NUMBER  NOT NULL , 
     SG_ESTADO    CHAR 
--  WARNING: CHAR size not specified 
                     NOT NULL , 
     NM_CIDADE    VARCHAR2 (60)  NOT NULL , 
     CD_IBGE      NUMBER (8) , 
     NR_DDD       NUMBER (3) 
    ) 
;

COMMENT ON COLUMN MC_CIDADE.MC_CIDADE_ID IS 'Esta coluna irá receber o ID da cidade, essa coluna representa a chave primaria da tabela MC_CIDADE. Esse conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_CIDADE.CD_CIDADE IS 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.MC_ESTADO_ID IS 'Essa coluna irá receber a chave primária da tabela MC_ESTADO. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_CIDADE.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.NM_CIDADE IS 'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_CIDADE.CD_IBGE IS 'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.' 
;

COMMENT ON COLUMN MC_CIDADE.NR_DDD IS 'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.' 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT MC_CIDADE_PK PRIMARY KEY ( MC_CIDADE_ID ) ;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT UN_MC_CIDADE_CD_CIDADE UNIQUE ( CD_CIDADE ) ;

CREATE TABLE MC_CLASS_VIDEO 
    ( 
     CD_CLASSIFICACAO NUMBER (10)  NOT NULL , 
     CS_VIDEO         VARCHAR2 (50)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLASS_VIDEO.CD_CLASSIFICACAO IS 'Essa coluna irá armazenar a chave primária da tabela de classificação dos vídeos da Melhores Compras. A cada vez que uma nova classificação for criada será acionada a Sequence  SQ_MC_CLASS_VIDEO  que se encarregará de gerar o próximo número único da classificação' 
;

COMMENT ON COLUMN MC_CLASS_VIDEO.CS_VIDEO IS 'Essa coluna irá receber a classificação dos vídeos. Seu conteúdo é obrigatório.' 
;

ALTER TABLE MC_CLASS_VIDEO 
    ADD CONSTRAINT MC_CLASS_VIDEO_PK PRIMARY KEY ( CD_CLASSIFICACAO ) ;

CREATE TABLE MC_CLI_FISICA 
    ( 
     NR_CLIENTE        NUMBER (10)  NOT NULL , 
     MC_CLIENTE_ID     NUMBER  NOT NULL , 
     DT_NASCIMENTO     DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO CHAR (1)  NOT NULL , 
     DS_GENERO         VARCHAR2 (100) , 
     NR_CPF            VARCHAR2 (14)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a partir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.MC_CLIENTE_ID IS 'Essa coluna irá receber a chave primária da tabela MC_CLIENTE. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DT_NASCIMENTO IS 'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.FL_SEXO_BIOLOGICO IS 'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. ' 
;

COMMENT ON COLUMN MC_CLI_FISICA.DS_GENERO IS 'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_FISICA.NR_CPF IS 'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. ' 
;
CREATE UNIQUE INDEX MC_CLI_FISICA__IDXv1 ON MC_CLI_FISICA 
    ( 
     MC_CLIENTE_ID ASC , 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT MC_CLI_FISICA_PK PRIMARY KEY ( NR_CLIENTE ) ;

CREATE TABLE MC_CLI_JURIDICA 
    ( 
     NR_CLIENTE    NUMBER (10)  NOT NULL , 
     MC_CLIENTE_ID NUMBER  NOT NULL , 
     DT_FUNDACAO   DATE , 
     NR_CNPJ       VARCHAR2 (20) , 
     NR_INSCR_EST  VARCHAR2 (15) 
    ) 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.MC_CLIENTE_ID IS 'Essa coluna irá receber a chave primária da tabela MC_CLIENTE. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.DT_FUNDACAO IS 'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_CNPJ IS 'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLI_JURIDICA.NR_INSCR_EST IS 'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional' 
;
CREATE UNIQUE INDEX MC_CLI_JURIDICA__IDXv1 ON MC_CLI_JURIDICA 
    ( 
     MC_CLIENTE_ID ASC , 
     NR_CLIENTE ASC 
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT MC_CLI_JURIDICA_PK PRIMARY KEY ( NR_CLIENTE ) ;

CREATE TABLE MC_CLIENTE 
    ( 
     MC_CLIENTE_ID   NUMBER  NOT NULL , 
     NR_CLIENTE      NUMBER (10)  NOT NULL , 
     NM_CLIENTE      VARCHAR2 (160)  NOT NULL , 
     QT_ESTRELAS     NUMBER (1) , 
     VL_MEDIO_COMPRA NUMBER (10,2) , 
     ST_CLIENTE      CHAR (1)  NOT NULL , 
     DS_EMAIL        VARCHAR2 (100) , 
     NR_TELEFONE     VARCHAR2 (20) , 
     NM_LOGIN        VARCHAR2 (50)  NOT NULL , 
     DS_SENHA        VARCHAR2 (50)  NOT NULL , 
     NR_CPF          VARCHAR2 (11)  NOT NULL , 
     DT_NASCIMENTO   DATE  NOT NULL , 
     SX_BIOLOGICO    VARCHAR2 (20)  NOT NULL , 
     GN_NASCIMENTO   VARCHAR2 (20) , 
     TP_CLIENTE      CHAR (1)  NOT NULL 
    ) 
;
ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT FK_ARCO_CLI_FISICA_JURIDICA_LOV CHECK ( TP_CLIENTE 
    IN ( 'F', 'J' ) )
;

COMMENT ON COLUMN MC_CLIENTE.MC_CLIENTE_ID IS 'Essa coluna irá receber o ID do cliente. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLIENTE.QT_ESTRELAS IS 'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.' 
;

COMMENT ON COLUMN MC_CLIENTE.VL_MEDIO_COMPRA IS 'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.' 
;

COMMENT ON COLUMN MC_CLIENTE.ST_CLIENTE IS 'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_EMAIL IS 'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_TELEFONE IS 'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.' 
;

COMMENT ON COLUMN MC_CLIENTE.NM_LOGIN IS 'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.' 
;

COMMENT ON COLUMN MC_CLIENTE.DS_SENHA IS 'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_CLIENTE.NR_CPF IS 'Número do CPF do cliente' 
;

COMMENT ON COLUMN MC_CLIENTE.DT_NASCIMENTO IS 'Data de nascimento do cliente' 
;

COMMENT ON COLUMN MC_CLIENTE.SX_BIOLOGICO IS 'Sexo biológico do cliente, conteúdo obrigatório' 
;

COMMENT ON COLUMN MC_CLIENTE.GN_NASCIMENTO IS 'Genero de nascimento do cliente, conteúdo opcional' 
;

COMMENT ON COLUMN MC_CLIENTE.TP_CLIENTE IS 'Tipo de cliente, Pessoa Fisica (F) Pessoa Juridica (J)' 
;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT MC_CLIENTE_PK PRIMARY KEY ( NR_CLIENTE, MC_CLIENTE_ID ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT UN_MC_CLIENTE_NOME_CLIENTE UNIQUE ( NM_CLIENTE ) ;

ALTER TABLE MC_CLIENTE 
    ADD CONSTRAINT MC_CLIENTE_PKv1 UNIQUE ( NR_CLIENTE ) ;

CREATE TABLE MC_DEPTO 
    ( 
     CD_DEPTO    NUMBER (3)  NOT NULL , 
     MC_DEPTO_ID NUMBER  NOT NULL , 
     NM_DEPTO    VARCHAR2 (100)  NOT NULL , 
     ST_DEPTO    CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_DEPTO.CD_DEPTO IS 'Esta coluna irá receber o codigo do departamento  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_DEPTO.MC_DEPTO_ID IS 'Essa coluna é a chave primária da tabela MC_DEPTO e irá receber o ID do departamento. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_DEPTO.NM_DEPTO IS 'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_DEPTO.ST_DEPTO IS 'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.' 
;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT MC_DEPTO_PK PRIMARY KEY ( MC_DEPTO_ID ) ;

ALTER TABLE MC_DEPTO 
    ADD CONSTRAINT UN_MC_DEPTO_CD_DEPTO UNIQUE ( CD_DEPTO ) ;

CREATE TABLE MC_END_CLI 
    ( 
     NR_CLIENTE         NUMBER (10)  NOT NULL , 
     MC_CLIENTE_ID      NUMBER  NOT NULL , 
     MC_LOGRADOURO_ID   NUMBER  NOT NULL , 
     NM_CLIENTE         VARCHAR2 (50)  NOT NULL , 
     QTDE_ESTRELAS      NUMBER (2) , 
     CD_LOGRADOURO_CLI  NUMBER  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE , 
     DT_TERMINO         DATE , 
     ST_CLIENTE         CHAR (1)  NOT NULL , 
     ST_END             CHAR (1)  NOT NULL , 
     NR_TELEFONE        NUMBER (20) , 
     NM_LOGIN           VARCHAR2 (50)  NOT NULL , 
     DS_SENHA           VARCHAR2 (50)  NOT NULL , 
     NR_CNPJ            VARCHAR2 (30) , 
     NR_INSCR_ESTAD     VARCHAR2 (30) 
    ) 
;

COMMENT ON COLUMN MC_END_CLI.NR_CLIENTE IS 'Essa coluna irá receber a chave primária da tabela MC_CLIENTE' 
;

COMMENT ON COLUMN MC_END_CLI.MC_LOGRADOURO_ID IS 'Essa coluna irá receber a chave primária da tabela MC_LOGRADOURO. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_END_CLI.NM_CLIENTE IS 'Nome do cliente, conteúdo obrigatório' 
;

COMMENT ON COLUMN MC_END_CLI.QTDE_ESTRELAS IS 'Essa coluna irá receber a quantidade de estrelas de um cliente. Seu conteúdo é opcional' 
;

COMMENT ON COLUMN MC_END_CLI.CD_LOGRADOURO_CLI IS 'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.NR_END IS 'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.' 
;

COMMENT ON COLUMN MC_END_CLI.DS_COMPLEMENTO_END IS 'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_INICIO IS 'Data de início do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.DT_TERMINO IS 'Data de término do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_CLI.ST_CLIENTE IS 'Status do cliente. (A)itvo ou (I)nativo.' 
;

COMMENT ON COLUMN MC_END_CLI.ST_END IS 'Status do endereço. A (ATIVO) i (INATIVO)' 
;

COMMENT ON COLUMN MC_END_CLI.NR_TELEFONE IS 'Numero de telefone do cliente' 
;

COMMENT ON COLUMN MC_END_CLI.NM_LOGIN IS 'Essa coluna irá receber o nome utilizado para login do cliente. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.DS_SENHA IS 'Essa coluna irá receber a senha  para login do cliente. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_CLI.NR_CNPJ IS 'Número do CNPJ, conteúdo opcional' 
;

COMMENT ON COLUMN MC_END_CLI.NR_INSCR_ESTAD IS 'Número de inscrição estadual, conteúdo opcional' 
;
CREATE UNIQUE INDEX MC_END_CLI__IDXv4 ON MC_END_CLI 
    ( 
     NR_CLIENTE ASC , 
     MC_CLIENTE_ID ASC 
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT MC_END_CLI_PK PRIMARY KEY ( NR_CLIENTE ) ;

CREATE TABLE MC_END_FUNC 
    ( 
     CD_FUNCIONARIO     NUMBER  NOT NULL , 
     MC_LOGRADOURO_ID   NUMBER  NOT NULL , 
     MC_FUNCIONARIO_ID  NUMBER (10)  NOT NULL , 
     CD_LOGRADOURO      NUMBER  NOT NULL , 
     NR_END             NUMBER (8)  NOT NULL , 
     DS_COMPLEMENTO_END VARCHAR2 (80) , 
     DT_INICIO          DATE  NOT NULL , 
     DT_TERMINO         DATE , 
     ST_END             CHAR (1)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_END_FUNC.CD_FUNCIONARIO IS 'Esta coluna irá receber o código do funcionário, essa coluna representa a chave primária  da tabela MC_END_FUNC. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_FUNC.MC_LOGRADOURO_ID IS 'Esta coluna irá receber o ID do logradouro, essa coluna representa a chave estrangeira da tabela MC_END_FUNC. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_END_FUNC.MC_FUNCIONARIO_ID IS 'Essa coluna irá receber a chave primária da tabela MC_FUNCIONARIO. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_END_FUNC.CD_LOGRADOURO IS 'Essa coluna irá receber o código do logradouro. Esse conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_END_FUNC.NR_END IS 'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.' 
;

COMMENT ON COLUMN MC_END_FUNC.DS_COMPLEMENTO_END IS 'Essa coluna irá receber a descrição completa do endereço do funcionário' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_INICIO IS 'Data de início do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_FUNC.DT_TERMINO IS 'Data de término do endereço associado ao cliente.' 
;

COMMENT ON COLUMN MC_END_FUNC.ST_END IS 'Essa coluna irá receber o status do endereço, A (Ativo) ou I (Inativo). Seu conteúdo é obrigatório' 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT MC_END_FUNC_PK PRIMARY KEY ( CD_FUNCIONARIO ) ;

CREATE TABLE MC_ESTADO 
    ( 
     MC_ESTADO_ID NUMBER  NOT NULL , 
     SG_ESTADO    CHAR (2)  NOT NULL , 
     NM_ESTADO    VARCHAR2 (30)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_ESTADO.MC_ESTADO_ID IS 'Esta coluna irá receber o ID do estado, essa coluna representa a chave primaria da tabela MC_ESTADO. Esse conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_ESTADO.SG_ESTADO IS 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_ESTADO.NM_ESTADO IS 'Esta coluna irá receber o nome do estado' 
;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT MC_ESTADO_PK PRIMARY KEY ( MC_ESTADO_ID ) ;

ALTER TABLE MC_ESTADO 
    ADD CONSTRAINT UN_MC_EST_SG_EST UNIQUE ( SG_ESTADO ) ;

CREATE TABLE MC_FUNCIONARIO 
    ( 
     MC_FUNCIONARIO_ID NUMBER (10)  NOT NULL , 
     MC_DEPTO_ID       NUMBER (10)  NOT NULL , 
     ID_GERENTE        NUMBER (10) , 
     CD_FUNCIONARIO    NUMBER (10)  NOT NULL , 
     CD_DEPTO          NUMBER  NOT NULL , 
     CD_GERENTE        NUMBER , 
     NM_FUNCIONARIO    VARCHAR2 (160)  NOT NULL , 
     DT_NASCIMENTO     DATE  NOT NULL , 
     FL_SEXO_BIOLOGICO CHAR (1)  NOT NULL , 
     DS_GENERO         VARCHAR2 (100) , 
     DS_CARGO          VARCHAR2 (80)  NOT NULL , 
     DS_DEPARTAMENTO   VARCHAR2 (30)  NOT NULL , 
     VL_SALARIO        NUMBER (10,2) , 
     DS_EMAIL          VARCHAR2 (80)  NOT NULL , 
     DS_TELEFONE       NUMBER (11)  NOT NULL , 
     ST_FUNC           CHAR (1)  NOT NULL , 
     DT_CADASTRAMENTO  DATE  NOT NULL , 
     DT_DESLIGAMENTO   DATE 
    ) 
;

COMMENT ON COLUMN MC_FUNCIONARIO.MC_FUNCIONARIO_ID IS 'Essa coluna irá armazenar a chave primária da tabela de funcionarios da Melhores Compras. A cada funcionario novo cadastrado  será acionada a Sequence  SQ_MC_FUNCIONARIO que se encarregará de gerar o próximo número único do funcionário.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.MC_DEPTO_ID IS 'Essa coluna é a chave estrangeira  da tabela MC_FUNCIONARIO e irá receber o ID do departamento a qual o funcionário faz parte. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.ID_GERENTE IS 'Esta coluna irá receber o ID  do gerente. Seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_FUNCIONARIO IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_DEPTO IS 'Esta coluna irá receber o codigo do departamento onde o funcionario trabalha  e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.CD_GERENTE IS 'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.NM_FUNCIONARIO IS 'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_NASCIMENTO IS 'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.FL_SEXO_BIOLOGICO IS 'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_GENERO IS 'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_CARGO IS 'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_DEPARTAMENTO IS 'Essa coluna diz respeito ao departamento que o funcionario faz parte, esse item é obrigatorio' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.VL_SALARIO IS 'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_EMAIL IS 'Esta coluna irá receber o email do funcionário e seu conteúdo é obrigatório,' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DS_TELEFONE IS 'Essa coluna diz respeito ao número de telefone do funcionario' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.ST_FUNC IS 'Essa coluna irá armazenar o stauts do funcionário da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_CADASTRAMENTO IS 'Data de cadastramento do Funcionario' 
;

COMMENT ON COLUMN MC_FUNCIONARIO.DT_DESLIGAMENTO IS 'Data de desligamento  do Funcionario. Seu conteúdo é opcional.' 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT MC_FUNCIONARIO_PK PRIMARY KEY ( MC_FUNCIONARIO_ID ) ;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT MC_FUNCIONARIO_PKv1 UNIQUE ( CD_FUNCIONARIO ) ;

CREATE TABLE MC_LOGRADOURO 
    ( 
     LOGRADOURO_ID NUMBER  NOT NULL , 
     CD_LOGRADOURO NUMBER (10)  NOT NULL , 
     MC_BAIRRO_ID  NUMBER  NOT NULL , 
     CD_BAIRRO     NUMBER  NOT NULL , 
     NM_LOGRADOURO VARCHAR2 (160)  NOT NULL , 
     NR_CEP        NUMBER (8) 
    ) 
;

COMMENT ON COLUMN MC_LOGRADOURO.LOGRADOURO_ID IS 'Esta coluna irá receber o ID do logradouro, essa coluna representa a chave primária da tabela MC_LOGRADOURO. Esse conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.CD_LOGRADOURO IS 'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.MC_BAIRRO_ID IS 'Essa coluna irá receber a chave primária da tabela MC_BAIRRO. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_LOGRADOURO.CD_BAIRRO IS 'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.NM_LOGRADOURO IS 'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_LOGRADOURO.NR_CEP IS 'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.' 
;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT MC_LOGRADOURO_PK PRIMARY KEY ( LOGRADOURO_ID ) ;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT UN_MC_LOGRA_CD_LOGRA UNIQUE ( CD_LOGRADOURO ) ;

CREATE TABLE MC_PRODUTO 
    ( 
     CD_PRODUTO           NUMBER (10)  NOT NULL , 
     MC_CATEGORIA_PROD_ID NUMBER  NOT NULL , 
     NR_CD_BARRAS_PROD    VARCHAR2 (50) , 
     DS_PRODUTO           VARCHAR2 (80)  NOT NULL , 
     CD_CATEGORIA         NUMBER  NOT NULL , 
     VL_UNITARIO          NUMBER (8,2)  NOT NULL , 
     TP_EMBALAGEM         VARCHAR2 (15) , 
     ST_PRODUTO           CHAR (1) , 
     VL_PERC_LUCRO        NUMBER (8,2) , 
     DS_COMPLETA_PROD     VARCHAR2 (4000)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_PRODUTO.CD_PRODUTO IS 'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.' 
;

COMMENT ON COLUMN MC_PRODUTO.MC_CATEGORIA_PROD_ID IS 'Essa coluna irá receber a chave primária da tabela MC_CATEGORIA_PROD' 
;

COMMENT ON COLUMN MC_PRODUTO.NR_CD_BARRAS_PROD IS 'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_PRODUTO IS 'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.' 
;

COMMENT ON COLUMN MC_PRODUTO.CD_CATEGORIA IS 'Essa coluna irá armazenar a chave primária da tabela de categoria de produtos da Melhorees Compras. Cada categoria nova cadastrada  será acionada a Sequence  SQ_MC_CATEGORIA que se encarregará de gerar o próximo número único da categoria..' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_UNITARIO IS 'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ' 
;

COMMENT ON COLUMN MC_PRODUTO.TP_EMBALAGEM IS 'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.ST_PRODUTO IS 'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).' 
;

COMMENT ON COLUMN MC_PRODUTO.VL_PERC_LUCRO IS 'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.' 
;

COMMENT ON COLUMN MC_PRODUTO.DS_COMPLETA_PROD IS 'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.' 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT CK_MC_PROD_STATUS_PROD 
    CHECK (ST_PRODUTO IN ( 'A', 'I'))
;
ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT MC_PRODUTO_PK PRIMARY KEY ( CD_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_MC_PROD_DS_PROD UNIQUE ( DS_PRODUTO ) ;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT UN_MC_PROD_CD_BAR_PROD UNIQUE ( NR_CD_BARRAS_PROD ) ;

CREATE TABLE MC_SGV_SAC 
    ( 
     NR_SAC                   NUMBER (10)  NOT NULL , 
     NM_CLIENTE               VARCHAR2 (160)  NOT NULL , 
     MC_FUNCIONARIO_ID        NUMBER (10)  NOT NULL , 
     CD_PRODUTO               NUMBER (10)  NOT NULL , 
     NR_CLIENTE               NUMBER  NOT NULL , 
     CD_FUNCIONARIO           NUMBER  NOT NULL , 
     DS_DETALHADA_SAC         VARCHAR2 (4000)  NOT NULL , 
     DT_ABERTURA_SAC          DATE  NOT NULL , 
     HR_ABERTURA_SAC          NUMBER (2)  NOT NULL , 
     DT_ATENDIMENTO           DATE , 
     HR_ATENDIMENTO_SAC       NUMBER (2) , 
     NR_TEMPO_TOTAL_SAC       NUMBER (10) , 
     DS_DETALHADA_RETORNO_SAC CLOB , 
     TP_SAC                   CHAR (1)  NOT NULL , 
     ST_SAC                   CHAR (1)  NOT NULL , 
     NR_INDICE_SATISFACAO     NUMBER (2) 
    ) 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_SAC IS 'Essa coluna irá armazenar a chave primária da tabela de SAC de vídeo  da Melhorees Compras. A cada SAC cadastrado pelo cliente será acionada a Sequence  SQ_MC_SGV_SAC que se encarregará de gerar o próximo número único do chamado SAC feito pelo Cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.MC_FUNCIONARIO_ID IS 'Essa coluna irá receber a chave primária da tabela MC_FUNCIONARIO. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_PRODUTO IS 'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_CLIENTE IS 'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. ' 
;

COMMENT ON COLUMN MC_SGV_SAC.CD_FUNCIONARIO IS 'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_SAC IS 'Essa coluna  irá  receber a descrição completa do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ABERTURA_SAC IS 'Essa coluna  irá  receber a data e horário do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ABERTURA_SAC IS 'Essa coluna  irá  receber a hora do SAC aberto pelo cliente. Seu conteudo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DT_ATENDIMENTO IS 'Essa coluna  irá  receber a data e horário do atendmiento SAC feita pelo funcionário da Melhores Compras. Seu conteudo deve ser opcional..' 
;

COMMENT ON COLUMN MC_SGV_SAC.HR_ATENDIMENTO_SAC IS 'Essa coluna  irá  receber a hora do SAC do atendimento  feito  pelo funcionario da Melhores Compras. Seu conteudo deve ser opcional.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_TEMPO_TOTAL_SAC IS 'Essa coluna  irá  receber o tempo total em horas  (HH24) computado desde a abertura até a conclusão dele. A unidade de medida é horas, ou seja, em quantas horas o chamado foi concluído desde a sua abertura.' 
;

COMMENT ON COLUMN MC_SGV_SAC.DS_DETALHADA_RETORNO_SAC IS 'Essa coluna  irá  receber a descrição detalhada do retorno feito pelo funcionário a partir da solicitação do cliente. Seu conteúdo deve ser opcional e preenchido pelo funcionário.' 
;

COMMENT ON COLUMN MC_SGV_SAC.TP_SAC IS 'Essa coluna  irá  receber o TIPO  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (S)ugestão; (D)úvida ou  (E)logio.' 
;

COMMENT ON COLUMN MC_SGV_SAC.ST_SAC IS 'Essa coluna  irá  receber o STATUS  do chamado SAC aberto pelo cliente.  Seu conteúdo deve ser  obrigatório e os possíveis valores são: (E)m Atendimento; (C)ancelado; (F)echado ou (X)Fechado com Insatisfação do cliente.' 
;

COMMENT ON COLUMN MC_SGV_SAC.NR_INDICE_SATISFACAO IS 'Essa coluna  irá  receber o índice de satisfação, , computado como um valor simples de 1 a 10, onde 1 refere-se ao cliente menos satisfeito e 10 o cliente mais satisfeito. Esse índice de satisfação é opcional e informado pelo cliente ao final do atendimento.' 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT CK_MC_SGV_ST_SAC 
    CHECK (ST_SAC IN ( 'A', 'E', 'C', 'F', 'X'))
;


ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT CK_MC_SGV_TP_SAC 
    CHECK (TP_SAC IN ( 'D', 'S', 'E'))
;
ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT MC_SGV_SAC_PK PRIMARY KEY ( NR_SAC ) ;

CREATE TABLE MC_VIDEO 
    ( 
     CD_VIDEO         NUMBER (10)  NOT NULL , 
     CD_PRODUTO       NUMBER (10)  NOT NULL , 
     CD_CLASSIFICACAO NUMBER (10)  NOT NULL , 
     ST_VIDEO         VARCHAR2 (1)  NOT NULL , 
     DT_CADASTRO      DATE  NOT NULL , 
     VIDEO            BLOB  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_VIDEO.CD_VIDEO IS 'Essa coluna irá armazenar a chave primária da tabela de vídeos da Melhores Compras. A cada vez que um novo vídeo for criado  será acionada a Sequence  SQ_MC_VIDEO  que se encarregará de gerar o próximo número único do vídeo' 
;

COMMENT ON COLUMN MC_VIDEO.CD_PRODUTO IS 'Essa coluna irá receber a chave primária da tabela MC_PRODUTO.' 
;

COMMENT ON COLUMN MC_VIDEO.CD_CLASSIFICACAO IS 'Essa coluna irá receber a chave primária da tabela MC_CLASS_VIDEO' 
;

COMMENT ON COLUMN MC_VIDEO.ST_VIDEO IS 'Essa coluna irá receber o status do vídeo. Somente é permitido A (Ativo) ou I (Inativo), seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_VIDEO.DT_CADASTRO IS 'Data em que o vídeo foi cadastrado. Seu conteúdo é obrigatório' 
;

COMMENT ON COLUMN MC_VIDEO.VIDEO IS 'Essa coluna irá receber o vídeo. Seu conteúdo é obrigatório' 
;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT CK_VIDEO_STATUS 
    CHECK (ST_VIDEO IN ( 'A', 'I'))
;
ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT MC_VIDEO_PROD_PK PRIMARY KEY ( CD_VIDEO ) ;

CREATE TABLE MC_VISUALIZACAO 
    ( 
     CD_VISUALIZACAO NUMBER  NOT NULL , 
     NM_CLIENTE      VARCHAR2 (160)  NOT NULL , 
     CD_VIDEO        NUMBER (10)  NOT NULL , 
     DT_VISUALIZACAO DATE  NOT NULL , 
     USUARIO         VARCHAR2 (50)  NOT NULL 
    ) 
;

COMMENT ON COLUMN MC_VISUALIZACAO.CD_VISUALIZACAO IS 'Essa coluna irá armazenar a chave primária da tabela de visualizações  da Melhorees Compras. A cada vez que o cliente assitir ao vídeo será acionada a Sequence  SQ_MC_VISUALIZACAO  que se encarregará de gerar o próximo número único da visualização' 
;

COMMENT ON COLUMN MC_VISUALIZACAO.NM_CLIENTE IS 'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório.' 
;

COMMENT ON COLUMN MC_VISUALIZACAO.CD_VIDEO IS 'Essa coluna irá armazenar o código de identificação do vídeo.' 
;

COMMENT ON COLUMN MC_VISUALIZACAO.DT_VISUALIZACAO IS 'Data e hora que o vídeo foi visualizado' 
;

COMMENT ON COLUMN MC_VISUALIZACAO.USUARIO IS 'Usuario que visualizou o vídeo' 
;

ALTER TABLE MC_VISUALIZACAO 
    ADD CONSTRAINT MC_VISUALIZACAO_PK PRIMARY KEY ( CD_VISUALIZACAO ) ;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT associar FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT atender FOREIGN KEY 
    ( 
     MC_FUNCIONARIO_ID
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     MC_FUNCIONARIO_ID
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT criar FOREIGN KEY 
    ( 
     NM_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NM_CLIENTE
    ) 
;

ALTER TABLE MC_VIDEO 
    ADD CONSTRAINT é FOREIGN KEY 
    ( 
     CD_CLASSIFICACAO
    ) 
    REFERENCES MC_CLASS_VIDEO 
    ( 
     CD_CLASSIFICACAO
    ) 
;

ALTER TABLE MC_AVALIACAO_VIDEO 
    ADD CONSTRAINT faz FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE
    ) 
;

ALTER TABLE MC_BAIRRO 
    ADD CONSTRAINT FK_MC_BAIRRO_CIDADE FOREIGN KEY 
    ( 
     MC_CIDADE_ID
    ) 
    REFERENCES MC_CIDADE 
    ( 
     MC_CIDADE_ID
    ) 
;

ALTER TABLE MC_CIDADE 
    ADD CONSTRAINT FK_MC_CIDADE_ESTADO FOREIGN KEY 
    ( 
     MC_ESTADO_ID
    ) 
    REFERENCES MC_ESTADO 
    ( 
     MC_ESTADO_ID
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT FK_MC_CLIENTE_END FOREIGN KEY 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
;

ALTER TABLE MC_CLI_FISICA 
    ADD CONSTRAINT FK_MC_CLIENTE_FISICA FOREIGN KEY 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
;

ALTER TABLE MC_CLI_JURIDICA 
    ADD CONSTRAINT FK_MC_CLIENTE_JURIDICA FOREIGN KEY 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NR_CLIENTE,
     MC_CLIENTE_ID
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_DEPTO_FUNC FOREIGN KEY 
    ( 
     MC_DEPTO_ID
    ) 
    REFERENCES MC_DEPTO 
    ( 
     MC_DEPTO_ID
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT FK_MC_END_FUNC FOREIGN KEY 
    ( 
     MC_FUNCIONARIO_ID
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     MC_FUNCIONARIO_ID
    ) 
;

ALTER TABLE MC_END_FUNC 
    ADD CONSTRAINT FK_MC_END_FUNC_LOGRADOURO FOREIGN KEY 
    ( 
     MC_LOGRADOURO_ID
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     LOGRADOURO_ID
    ) 
;

ALTER TABLE MC_FUNCIONARIO 
    ADD CONSTRAINT FK_MC_FUNC_SUPERIOR FOREIGN KEY 
    ( 
     ID_GERENTE
    ) 
    REFERENCES MC_FUNCIONARIO 
    ( 
     MC_FUNCIONARIO_ID
    ) 
;

ALTER TABLE MC_LOGRADOURO 
    ADD CONSTRAINT FK_MC_LOGRADOURO_BAIRRO FOREIGN KEY 
    ( 
     MC_BAIRRO_ID
    ) 
    REFERENCES MC_BAIRRO 
    ( 
     MC_BAIRRO_ID
    ) 
;

ALTER TABLE MC_END_CLI 
    ADD CONSTRAINT FK_MC_LOGRADOURO_END FOREIGN KEY 
    ( 
     MC_LOGRADOURO_ID
    ) 
    REFERENCES MC_LOGRADOURO 
    ( 
     LOGRADOURO_ID
    ) 
;

ALTER TABLE MC_PRODUTO 
    ADD CONSTRAINT FK_MC_SUB_CATEGORIA_PROD FOREIGN KEY 
    ( 
     MC_CATEGORIA_PROD_ID
    ) 
    REFERENCES MC_CATEGORIA_PROD 
    ( 
     MC_CATEGORIA_PROD_ID
    ) 
;

ALTER TABLE MC_VISUALIZACAO 
    ADD CONSTRAINT pertence FOREIGN KEY 
    ( 
     NM_CLIENTE
    ) 
    REFERENCES MC_CLIENTE 
    ( 
     NM_CLIENTE
    ) 
;

ALTER TABLE MC_VISUALIZACAO 
    ADD CONSTRAINT recebe FOREIGN KEY 
    ( 
     CD_VIDEO
    ) 
    REFERENCES MC_VIDEO 
    ( 
     CD_VIDEO
    ) 
;

ALTER TABLE MC_SGV_SAC 
    ADD CONSTRAINT receber FOREIGN KEY 
    ( 
     CD_PRODUTO
    ) 
    REFERENCES MC_PRODUTO 
    ( 
     CD_PRODUTO
    ) 
;

ALTER TABLE MC_AVALIACAO_VIDEO 
    ADD CONSTRAINT recebev2 FOREIGN KEY 
    ( 
     CD_VIDEO
    ) 
    REFERENCES MC_VIDEO 
    ( 
     CD_VIDEO
    ) 
;

CREATE OR REPLACE TRIGGER ARC_FK_ARCO_CLI__MC_CLI_FISICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE, MC_CLIENTE_ID 
ON MC_CLI_FISICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE
    AND A.MC_CLIENTE_ID = :new.MC_CLIENTE_ID; 
    IF (d IS NULL OR d <> 'F') THEN 
        raise_application_error(-20223,'FK FK_MC_CLIENTE_FISICA in Table MC_CLI_FISICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''F'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FK_ARCO_CL_MC_CLI_JURIDICA 
BEFORE INSERT OR UPDATE OF NR_CLIENTE, MC_CLIENTE_ID 
ON MC_CLI_JURIDICA 
FOR EACH ROW 
DECLARE 
    d CHAR (1); 
BEGIN 
    SELECT A.TP_CLIENTE INTO d 
    FROM MC_CLIENTE A 
    WHERE A.NR_CLIENTE = :new.NR_CLIENTE
    AND A.MC_CLIENTE_ID = :new.MC_CLIENTE_ID; 
    IF (d IS NULL OR d <> 'J') THEN 
        raise_application_error(-20223,'FK FK_MC_CLIENTE_JURIDICA in Table MC_CLI_JURIDICA violates Arc constraint on Table MC_CLIENTE - discriminator column TP_CLIENTE doesn''t have value ''J'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE SEQUENCE SQ_MC_AVALIACAO 
START WITH 1 
    MAXVALUE 9999999999 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CD_AVALIACAO 
BEFORE INSERT ON MC_AVALIACAO_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_AVALIACAO IS NULL) 
BEGIN 
    :NEW.CD_AVALIACAO := SQ_MC_AVALIACAO.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_BAIRRO_MC_BAIRRO_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_BAIRRO_MC_BAIRRO_ID_TRG 
BEFORE INSERT ON MC_BAIRRO 
FOR EACH ROW 
WHEN (NEW.MC_BAIRRO_ID IS NULL) 
BEGIN 
    :NEW.MC_BAIRRO_ID := MC_BAIRRO_MC_BAIRRO_ID_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_CATEGORIA 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CATEGORIA_ID 
BEFORE INSERT ON MC_CATEGORIA_PROD 
FOR EACH ROW 
WHEN (NEW.MC_CATEGORIA_PROD_ID IS NULL) 
BEGIN 
    :NEW.MC_CATEGORIA_PROD_ID := SQ_MC_CATEGORIA.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_CIDADE_MC_CIDADE_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_CIDADE_MC_CIDADE_ID_TRG 
BEFORE INSERT ON MC_CIDADE 
FOR EACH ROW 
WHEN (NEW.MC_CIDADE_ID IS NULL) 
BEGIN 
    :NEW.MC_CIDADE_ID := MC_CIDADE_MC_CIDADE_ID_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_CLASS_VIDEO 
START WITH 1 
    MAXVALUE 9999999999 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CD_CLASS_VIDEO 
BEFORE INSERT ON MC_CLASS_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_CLASSIFICACAO IS NULL) 
BEGIN 
    :NEW.CD_CLASSIFICACAO := SQ_MC_CLASS_VIDEO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_CLIENTE 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CLIENTE_ID 
BEFORE INSERT ON MC_CLIENTE 
FOR EACH ROW 
WHEN (NEW.MC_CLIENTE_ID IS NULL) 
BEGIN 
    :NEW.MC_CLIENTE_ID := SQ_MC_CLIENTE.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_DEPTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_DEPTO_ID 
BEFORE INSERT ON MC_DEPTO 
FOR EACH ROW 
WHEN (NEW.MC_DEPTO_ID IS NULL) 
BEGIN 
    :NEW.MC_DEPTO_ID := SQ_MC_DEPTO.NEXTVAL; 
END;
/

CREATE SEQUENCE MC_ESTADO_MC_ESTADO_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER MC_ESTADO_MC_ESTADO_ID_TRG 
BEFORE INSERT ON MC_ESTADO 
FOR EACH ROW 
WHEN (NEW.MC_ESTADO_ID IS NULL) 
BEGIN 
    :NEW.MC_ESTADO_ID := MC_ESTADO_MC_ESTADO_ID_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_FUNCIONARIO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_FUNCIONARIO_ID 
BEFORE INSERT ON MC_FUNCIONARIO 
FOR EACH ROW 
WHEN (NEW.MC_FUNCIONARIO_ID IS NULL) 
BEGIN 
    :NEW.MC_FUNCIONARIO_ID := SQ_MC_FUNCIONARIO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_LOGRADOURO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_LOGRADOURO_ID 
BEFORE INSERT ON MC_LOGRADOURO 
FOR EACH ROW 
WHEN (NEW.LOGRADOURO_ID IS NULL) 
BEGIN 
    :NEW.LOGRADOURO_ID := SQ_MC_LOGRADOURO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_PRODUTO 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CD_PRODUTO 
BEFORE INSERT ON MC_PRODUTO 
FOR EACH ROW 
WHEN (NEW.CD_PRODUTO IS NULL) 
BEGIN 
    :NEW.CD_PRODUTO := SQ_MC_PRODUTO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_VIDEO 
START WITH 1 
    MAXVALUE 9999999999 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CD_VIDEO 
BEFORE INSERT ON MC_VIDEO 
FOR EACH ROW 
WHEN (NEW.CD_VIDEO IS NULL) 
BEGIN 
    :NEW.CD_VIDEO := SQ_MC_VIDEO.NEXTVAL; 
END;
/

CREATE SEQUENCE SQ_MC_VISUALIZACAO 
START WITH 1 
    MAXVALUE 9999999999 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TRG_CD_VISUALIZACAO 
BEFORE INSERT ON MC_VISUALIZACAO 
FOR EACH ROW 
WHEN (NEW.CD_VISUALIZACAO IS NULL) 
BEGIN 
    :NEW.CD_VISUALIZACAO := SQ_MC_VISUALIZACAO.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             3
-- ALTER TABLE                             55
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          15
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         13
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1
