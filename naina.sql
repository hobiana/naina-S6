/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  28/02/2017 14:07:58                      */
/*==============================================================*/


drop index ASSOCIATION_5_FK;

drop index ABSENCE_PK;

drop table ABSENCE;

drop index ADMIN_PK;

drop table ADMIN;

drop index EMPLOYE_PK;

drop table EMPLOYE;

drop index ASSOCIATION_11_FK;

drop index HEURE_SUPP_PK;

drop table HEURE_SUPP;

drop index ASSOCIATION_3_FK;

drop index HORAIRE_PK;

drop table HORAIRE;

drop index JOURFERIE_PK;

drop table JOURFERIE;

drop index ASSOCIATION_4_FK;

drop index POINTAGE_PK;

drop table POINTAGE;

drop index ASSOCIATION_6_FK;

drop index RETARD_PK;

drop table RETARD;

/*==============================================================*/
/* Table : ABSENCE                                              */
/*==============================================================*/
create table ABSENCE (
   IDABSENCE            SERIAL               not null,
   IDEMPLOYE            INT4                 not null,
   DATEABSENCE          DATE                 null,
   constraint PK_ABSENCE primary key (IDABSENCE)
);

/*==============================================================*/
/* Index : ABSENCE_PK                                           */
/*==============================================================*/
create unique index ABSENCE_PK on ABSENCE (
IDABSENCE
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_5_FK on ABSENCE (
IDEMPLOYE
);

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN (
   IDADMIN              SERIAL               not null,
   LOGIN                VARCHAR(150)         null,
   MDP                  VARCHAR(150)         null,
   constraint PK_ADMIN primary key (IDADMIN)
);

/*==============================================================*/
/* Index : ADMIN_PK                                             */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
IDADMIN
);

/*==============================================================*/
/* Table : EMPLOYE                                              */
/*==============================================================*/
create table EMPLOYE (
   IDEMPLOYE            SERIAL               not null,
   NOM                  VARCHAR(50)          null,
   CIN                  VARCHAR(50)          null,
   MATRICULE            VARCHAR(50)          null,
   SALAIREBASE          NUMERIC(10,2)        null,
   DATEEMBAUCHE         DATE                 null,
   constraint PK_EMPLOYE primary key (IDEMPLOYE)
);

/*==============================================================*/
/* Index : EMPLOYE_PK                                           */
/*==============================================================*/
create unique index EMPLOYE_PK on EMPLOYE (
IDEMPLOYE
);

/*==============================================================*/
/* Table : HEURE_SUPP                                           */
/*==============================================================*/
create table HEURE_SUPP (
   IDHEURESUPP          SERIAL               not null,
   IDPOINTAGE           INT4                 not null,
   DUREE                TIME                 null,
   GAIN                 NUMERIC(7,2)         null,
   constraint PK_HEURE_SUPP primary key (IDHEURESUPP)
);

/*==============================================================*/
/* Index : HEURE_SUPP_PK                                        */
/*==============================================================*/
create unique index HEURE_SUPP_PK on HEURE_SUPP (
IDHEURESUPP
);

/*==============================================================*/
/* Index : ASSOCIATION_11_FK                                    */
/*==============================================================*/
create  index ASSOCIATION_11_FK on HEURE_SUPP (
IDPOINTAGE
);

/*==============================================================*/
/* Table : HORAIRE                                              */
/*==============================================================*/
create table HORAIRE (
   IDHORAIRE            SERIAL               not null,
   IDEMPLOYE            INT4                 not null,
   HEUREENTREE          TIME                 null,
   HEURESORTIE          TIME                 null,
   constraint PK_HORAIRE primary key (IDHORAIRE)
);

/*==============================================================*/
/* Index : HORAIRE_PK                                           */
/*==============================================================*/
create unique index HORAIRE_PK on HORAIRE (
IDHORAIRE
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK on HORAIRE (
IDEMPLOYE
);

/*==============================================================*/
/* Table : JOURFERIE                                            */
/*==============================================================*/
create table JOURFERIE (
   IDJOURFERIE          SERIAL               not null,
   DATEJOURFERIE        DATE                 null,
   NOMJOURFERIE         VARCHAR(50)          null,
   constraint PK_JOURFERIE primary key (IDJOURFERIE)
);

/*==============================================================*/
/* Index : JOURFERIE_PK                                         */
/*==============================================================*/
create unique index JOURFERIE_PK on JOURFERIE (
IDJOURFERIE
);

/*==============================================================*/
/* Table : POINTAGE                                             */
/*==============================================================*/
create table POINTAGE (
   IDPOINTAGE           SERIAL               not null,
   IDEMPLOYE            INT4                 not null,
   DATEPOINTAGE         DATE                 null,
   HEUREPOINTAGE        TIME                 null,
   TYPE                 VARCHAR(25)          null,
   constraint PK_POINTAGE primary key (IDPOINTAGE)
);

/*==============================================================*/
/* Index : POINTAGE_PK                                          */
/*==============================================================*/
create unique index POINTAGE_PK on POINTAGE (
IDPOINTAGE
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_4_FK on POINTAGE (
IDEMPLOYE
);

/*==============================================================*/
/* Table : RETARD                                               */
/*==============================================================*/
create table RETARD (
   IDRETARD             SERIAL               not null,
   IDEMPLOYE            INT4                 not null,
   DUREE                TIME                 null,
   RETENU               NUMERIC(7,2)         null,
   constraint PK_RETARD primary key (IDRETARD)
);

/*==============================================================*/
/* Index : RETARD_PK                                            */
/*==============================================================*/
create unique index RETARD_PK on RETARD (
IDRETARD
);

/*==============================================================*/
/* Index : ASSOCIATION_6_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_6_FK on RETARD (
IDEMPLOYE
);

alter table ABSENCE
   add constraint FK_ABSENCE_ASSOCIATI_EMPLOYE foreign key (IDEMPLOYE)
      references EMPLOYE (IDEMPLOYE)
      on delete restrict on update restrict;

alter table HEURE_SUPP
   add constraint FK_HEURE_SU_ASSOCIATI_POINTAGE foreign key (IDPOINTAGE)
      references POINTAGE (IDPOINTAGE)
      on delete restrict on update restrict;

alter table HORAIRE
   add constraint FK_HORAIRE_ASSOCIATI_EMPLOYE foreign key (IDEMPLOYE)
      references EMPLOYE (IDEMPLOYE)
      on delete restrict on update restrict;

alter table POINTAGE
   add constraint FK_POINTAGE_ASSOCIATI_EMPLOYE foreign key (IDEMPLOYE)
      references EMPLOYE (IDEMPLOYE)
      on delete restrict on update restrict;

alter table RETARD
   add constraint FK_RETARD_ASSOCIATI_EMPLOYE foreign key (IDEMPLOYE)
      references EMPLOYE (IDEMPLOYE)
      on delete restrict on update restrict;

