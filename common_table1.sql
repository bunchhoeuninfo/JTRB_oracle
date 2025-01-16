--test account 1345467
select * from payments.CA010MB  where LEGACY_AC IN ('MT103')  ;
select * from payments.ps029mb where swift_code='CITIUS33XXX';
select * from payments.ps028mb;
---dddddddddddddddddddddddddddddddddddddddddddddddddddd
select * from payments.account_master where legacy_ac='2377419';
select * from payments.ps029mb where swift_code='COBADEFFXXX';
select * from IMH.mh_audit_log  order by REQ_OUT_DTM desc;
select * from arx.tb_arm_user_master;
select * from DATA_SYNC.dtsync_status_hist where tod_date='20241221' and REFRESH_TYPE='SS';
select * from cashcore.ps080tb where cr_acc like 'DE%';
select * from payments.mc012bb where org_related_ref='S0643590D06A01';
select * from idccore.tran2025;
select * from idccore.tranbat2025;

select * from data_sync.TMP_CBX_STM;
select * from idccore.tran2024 where TRAN_VALUE_DATE>='01-JAN-25';
select * from DATA_SYNC.tmp_cbx_stm;
SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';


--payment advice
select count(1) from payments.payment_advice_mail l where  trunc(l.mail_messagedatetime)='13-Nov-2024' and l.mail_success='V';
select count(1) from payments.payment_advice_mail l where  trunc(l.mail_messagedatetime)='13-Nov-2024' and l.mail_success='F';
select count(1) from payments.payment_advice_mail l where  trunc(l.mail_messagedatetime)='13-Nov-2024' and l.mail_success='P';
select * from payments.payment_advice_mail order by MAIL_MESSAGEDATETIME desc;
select * from IDCCORE.limitline where LMTLINE_CLIENT_CODE='100048123';
select * from idccore.omni_acnt where IACLINK_ACTUAL_ACNUM='5406007';
select * from imh.ce002pb where VALUE like '%10.102%';
select * from payments.txn_post_history where val_dt='26-DEC-24';
select * from PAYMENTS.txn_post_staging;
select * from payments.txn_post_history where ref_no='FCSF051224399368';
select * from CASHCORE.file_mst_pay where FILE_REFERENCE_NO='5452412120012328';
select * from payments.em300tb;
select * from CASHCORE.template_mst where cif_no='100105556' and template_id='TMP111911';
select * from CASHCORE.template_field_definition where field_id='FLD078' 
and template_id in (select template_id from CASHCORE.template_mst where cif_no='100105556' and template_id='TMP111911') ;
select * from DATA_SYNC.dtsync_status_hist where  tod_date='20250102';
select * from idccore.omni_acnt;
select * from CASHCORE.field_mst;
select * from idccore.tran2025;
select * from CASHCORE.template_field_definition where field_id='FLD078' and template_id in ('TMP111916','TMP111911');
select * from CASHCORE.txn_mst_pay where FILE_REFERENCE_NO='5452412120012330';
select * from CASHCORE.file_error_pay where fileid_cd='5459829114144306';
select * from PAYMENTS.txn_post_staging where ref_no='FCSF051224399368';
select * from payments.ps029mb where swift_code='BBITUS3MXXX';
select * from payments.wf110tb where ref_no='FCSF051224399368';
select * from payments.wf220tb;
select * from payments.ps032mb;
select * from payments.ca080tb where ref_no='FCSF051224399363';
select * from payments.if016tb where ref_no='FCSF051224399363';
select * from payments.if016tb where req_log like '%20241007796%';
select * from payments.if016tb where trunc(REQ_DATE_TIME)='02-JAN-25';
select * from PAYMENTS.deal_details;
select * from payments.wf110tb;
select * from idccore.acnts;
select * from dfcore.account_info;
select * from idccore.iaclink;
select * from IDCCORE.llacntos where LLACNTOS_CLIENT_ACNUM='1001000017869';
select * from DATA_SYNC.dtsync_status_hist;
select * from cbsonlp.sact where entity_no like '%4176516' and tod_date='20250102';
select * from cbsonlp.saft  where ACCT_NO like '%4176516' and tod_date='20250102';
--truncate table DATA_SYNC.dtsync_status_hist;
select * from dfcore.od_users_mb where od_user_no='100185363';

select * from payments.if016tb where ref_no='BLSF231224405099';
select * from payments.if016tb where trunc(REQ_DATE_TIME)='04-DEC-24';
select * from PAYMENTS.payment_advice_txn order by MAIL_TRANSACTIONDATETIME desc;
select * from payments.em300tb;
select * from PAYMENTS.em301mx_tb where app_srno='FCSF241224399694';
select * from payments.txn_post_history where ref_no='FCSF221124663069';
select * from PAYMENTS.txn_post_history where ref_no='FCSF051224399367';
select * from PAYMENTS.account_master where cif='100002526';
select * from payments.ps015tb where seq_no='BLSF231224405099';
select * from payments.wf110tb where ref_no='BLSF231224405099';
select * from payments.bl100hb where BL_TXNREFNO='BLSF231224405099';
select * from CASHCORE.file_mst_pay where cif_cd='10000170';
select * from cashcore.ps080tb where file_ref_no='5459725124081939';
select * from cbx.od_users_mb;
select * from PAYMENTS.eod_pending_txn;
select * from CBX.user_device_details;
select * from CBX.od_txn_lock_tracker;
select * from payments.MC022TB_MX;


SELECT  * FROM all_tab_columns WHERE data_type = 'CLOB' ORDER BY owner, table_name;
select * from payments.em300tb where user_Refno='5451822114095613';
select * from PAYMENTS.txn_post_staging;
select * from payments.if001tb order by ACTUAL_REQ_DATE desc;
select a.AUDIT_DATE, a.od_login_id, a.USER_NO ,b.event_desc, b.action, a.reference, a.OD_GCIF, b.EVENT_TITLE
from cbx.od_audit a
left join cbx.event_master b on a.event_id = b.event_id
where a.OD_GCIF='10000930'
order by a.AUDIT_DATE desc;
select * from payments.em300tb where user_REfno='FCSF131124394410';
select * from payments.em300tb order by MSG_CREATION_SYS_TIME desc;
select * from payments.wf110tb where ref_no='5456319114101716';
select * from IMH.mh_audit_log order by REQ_IN_DTM desc;
select * from IMH.mh_audit_log where REQ_IN_MSG_VAL like '%5453219114114333%';
select * from imh.tr910mb;
select * from dfcore.od_users_mb where mobile_no like '%12234567%';
select * from IDCCORE.addrdtls where ADDRDTLS_MOBILE_NUM = '012345678';
select * from cbx.OD_TXN_MASTER where od_Ref_no='5459511114151911';
--update cbx.OD_TXN_MASTER set OD_VERSION_NO=6 where od_Ref_no='5452111114152002';
--update cbx.OD_TXN_MASTER set OD_VERSION_NO=6 where od_Ref_no='5459511114151911';
select * from cbx.OD_TXN_LOCK_TRACKER;
select * from CBX.od_txn_master_hb where od_Ref_no='5452111114152002';
select * from CBX.op;
select * from cbx.OD_USER_MESSAGE;
select * from CBX.od_txn_master_hb where trunc(OD_MAKER_DATE)='20-NOV-24';
select * from IDCCORE.indclients;
select * from IDCCORE.acntbal where ACNTBAL_AC_AMT_ON_HOLD<0;
select * from idccore.omni_acnt;
select * from dfcore.customer_info where CUSTOMER_NUMBER='100390936';
select * from arx.tb_arm_user_master;
select * from idccore.PRE_MIG_STAGE_ERR_COUNT;
select * from DATA_SYNC.dtsync_status_hist where saf_table='CURM';
select * from DATA_SYNC.dtsync_status_hist where status<>'SUCCESS';
select * from payments.ca080tb where ref_no='5459018114150357';
select * from payments.if001tb where ref_no='5459018114150357';
select * from payments.if016tb where ref_no='5459018114150357';
select * from arx.tb_arm_user_master where user_login='55415790';
select * from CBX.oo_payment_txn_mt where GCIF='10000930';
select * from dfcore.od_users_mb where od_login_id='100227181';
select * from arx.tb_arm_user_master;
select * from IMH.currency_master;
select * from PAYMENTS.ca850mb;
select * from cashcore.ps080tb where DR_ACC='5104084';
select * from cashcore.ps080tb where cr_acc like 'GB%';
select * from payments.if001tb order by req_date_time desc;
select * from payments.if001tb where ref_no='AAAFC3528924';
select * from idccore.omni_acnt where iaclink_actual_acnum='5825290';
select * from DATA_SYNC.dtsync_status_hist where entity_no like '%5825290' order by tod_date desc;
select * from CBSONLP.saft where ACCT_NO like '%5498465' order by tod_date desc;
select * from cbx.od_audit where OD_GCIF='10000930';
select * from CBX.oo_payment_txn_mt where gcif='10000930';
select * from payments.em300tb where user_refno in ('FCSF071124390094');
select * from DFCORE.transfers_txn_mt where ref_no='AAAFC3528924';
select * from payments.vw_sanction
select * from payments.em301tb;
select * from payments.wf110tb where ref_no='FCSF071124390094';
update payments.em300tb set S_FLG='AUTH' where user_refno in ('FCSF041124389990','FCSF041124389989','FCSF041124389993','FCSF041124390005');
select * from payments.ca080tb where ref_no='FCSF041124390005';
select * from user_procedures where OBJECT_NAME like '%PURG%';
select * from idccore.arch_error_log;
select * from cashcore.ps080tb where ref_no='5455105114155427';
select * from payments.ps029mb where swift_code='BKNZNZ22985';
select * from payments.ps015tb where seq_no='5456319114101716';
select * from arx.UL001MB;
select * from arx.TB_ARM_USER_MASTER where USER_LOGIN='Tithary.R';
select * from cashcore.ps080tb where cr_acc like '%GB%';
select * from payments.account_master order by open_date desc;
select * from payments.ca850mb;
select * from cashcore.ca850mb;
select * from CASHCORE.txn_error_pay;
select * from cashcore.account_master where cif= '100329726';
select * from DATA_SYNC.dtsync_status_hist where refresh_type='SS' order by tod_date desc;
 SELECT * FROM OO_PAYMENT_TXN_HT;
 SELECT * FROM payments.MA011MB WHERE TABLE_NAME = 'PS029MB' AND TEXT_CD IN ('9029', '9030');
 select * from payments.wf003pb;
select * from IMH.ce002pb where value like '%10.102.1%';
select * from IMH.mh_audit_log where req_in_msg_val like '%AAAFB05AAE24%';
select * from imh.timer;
select * from IMH.mh_audit_log where RESP_OUT_DTM is not null order by RESP_OUT_DTM desc;
select * from DFCORE.cards_txn_mt where card_no='4862980016007074';
select * from IMH.ce002pb where name='AddressLocation';
select * from IMH.tr910mb;
select * from IMH.mh_audit_log order by REQ_IN_DTM desc;
select * from DFCORE.cards_txn_mt;
select * from CBX.oo_payment_txn_mt where reference_no='5453504114150355';
select * from payments.wf110tb where ref_no='A2SF081124390101';
select * from PAYMENTS.wf120tb where ref_no='5453504114150355';

select * from PAYMENTS.eod_pending_txn where ref_no='5453504114150355';
select * from PAYMENTS.eod_pending_txn_bkp;
select * from payments.account_master where ac_no like '100000014494';
select * from payments.ps029mb;
select * from IDCCORE.acntbal where ACNTBAL_INTERNAL_ACNUM='1001000016942';
select * from payments.txn_post_history where ref_no='5452411112172736';
select * from payments.if016tb where ref_no='5452411112172736';
select distinct COUNTRY from payments.ps029mb where iso_;

select * from payments.ps015tb where seq_no='FCSF081124390099';
select * from CASHCORE.portal_request where ref_no in (select ref_no from cashcore.ps080tb where file_ref_no='5451708114134326');
select * from CASHCORE.accounting_staging_internal;
select * from payments.ca080tb where ref_no='FCSF081124390096';
select * from payments.if016tb where ref_no in (select ref_no from cashcore.ps080tb where file_ref_no='5452308114163748');
select * from PAYMENTS.txn_post_staging where ref_no in (select ref_no from cashcore.ps080tb where file_ref_no='5451708114134326');
select * from cashcore.ps080tb where file_ref_no='5452308114163748';
select * from CASHCORE.file_mst_pay where file_reference_no='5452308114163748';
select * from PAYMENTS.ps013wb where txn_ref_no='5453504114150355';
select * from payments.if001tb where ref_no='5453504114150355';
select * from payments.if016tb where ref_no='FCSF081124390099';
select * from IMH.TR910MB;
select * from payments.if016hb;
select * from CBX.OD_FEED_ACCOUNT_MASTER;
select * from OD_FEED_ACCOUNT_MASTER;
GRANT all ON IDCCORE TO cbx;

-- Example DBA command to grant SELECT with grant option:
GRANT SELECT ON IDCCORE.MBRN TO cashcore WITH GRANT OPTION;
select * from payments.ca080tb;
select * from payments.if016tb where ref_no='A2SF051124390066';
select * from PAYMENTS.host_err_cd_master;
select * from CBX.oo_payment_txn_mt where REFERENCE_NO='5452410092140340';
select * from payments.txn_post_history where trunc(TXN_POSTED_ON)='18-NOV-24' order by TXN_POSTED_ON desc;
select * from payments.txn_post_history where ref_no='A2SF081124390101';
select * from PAYMENTS.txn_post_errors where trunc(TXN_POSTED_ON)>'05-NOV-24' order by TXN_POSTED_ON desc;
select * from payments.txn_post_staging;
select * from CASHCORE.currency_cutoff_master;
update CASHCORE.currency_cutoff_master set CUT_OFF_TIME='233000';
select * from payments.if001tb where trunc(REQ_DATE_TIME)>='04-NOV-24' order by REQ_DATE_TIME desc;
select * from payments.if016tb where ref_no='AAAFB05DAE24';
select * from payments.ca080tb where ref_no='AAAD79254224';
select * from payments.txn_post_history where ref_no='FCSF071124390089';
select * from payments.txn_post_history where host_txn_cd='1145' order by val_dt desc;
select * from payments.txn_post_history where host_txn_cd='1045' order by TXN_POSTED_ON desc;
select * from DFCORE.CARDS_TXN_MT where ref_no='AAAFB05EAE24';
select * from DFCORE.vw_cards_txn_dtls;
select * from payments.txn_post_history where col_1='5141049';
select * from imh.timer;
select * from payments.em300tb where user_refno='FCSF071124390089';
select * from PAYMENTS.em301mx_tb where app_srno='FCSF071124390089';
select * from payments.account_master where legacy_ac='2484035';
select * from cashcore.account_master;
GRANT all ON PAYMENTS.IF001TB TO DFCORE WITH GRANT OPTION;
select * from cbx.od_pending_mail order by OD_DATE desc;
--BEGIN SP_CUST_ACCT_FEED(); END;
select * from idccore.hollist;


------------
select * from gr020mb;
select * from VW_ACC_LIST_CA010MB;
select * from VW_ACC_LIST_CA010MB;
select * from cbx.MIGRATION_STATUS;
select * from cbx.OD_PORTAL_ACCT_MASTER;
select * from cbx.VW_ACC_LIST_CA010MB;
select * from cbx.VW_ACC_LIST_CA010MB_MV;
select * from cbx.VW_CUSTOMER_MASTER_CORE_BATCH;
select * from account_master where ac_no='4197537';
select * from GR010MB;

update customer_master set CIF_STATUS='A'; ON_BOARD_FLAG = 'Y';
update account_master set ON_BOARD_FLAG='Y';
update GR010MB set ON_BOARD_FLAG = 'P';

--begin SP_CUST_ACCT_FEED_1; end;

----------
select * from payments.txn_post_history where HOST_TXN_CD  in ('1045','1145') and txn_type not in ('A2A');

SELECT REF_NO, COL_1,COUNT(*)
FROM payments.txn_post_history
where HOST_TXN_TYPE<>'CH' and HOST_TXN_CD not in ('1045','1145')
GROUP BY REF_NO,COL_1
HAVING COUNT(*) > 1;

select * from imh.timer;
select * from PAYMENTS.txn_post_staging;
select * from payments.ps030mb;
select * from cashcore.UL001MB;
select * from payments.ps029mb where bank_cd='173923';
select * from payments.ps015tb where seq_no='5452411112172692';
select * from CBX.oo_payment_txn_mt where reference_no='5452411112172692';
select * from payments.txn_post_history where ref_no in ('5452411122168428');
select * from payments.txn_post_history where  val_dt='18-NOV-24';
select * from payments.txn_post_history where TXN_TYPE='DFTOUT' and val_dt='11-NOV-24' and col_1='4176516';
select * from PAYMENTS.dft_outward where trunc(AUTH_DT)='11-NOV-24';
select * from payments.txn_post_history where ref_no in ('5452411112172692','5452411112172736','5452411112172751','5452411112172739','5452411112172761') order by ref_no;
select * from payments.ca080tb where  ref_no in ('5452411112172692','5452411112172736','5452411112172751','5452411112172739','5452411112172761') order by ref_no;
select * from PAYMENTS.ca080tb where ref_no='5457112114132535';
select * from cashcore.ps080tb where file_ref_no='5451512114164549' and TXN_STATUS='A';
select * from PAYMENTS.payment_advice_mail where MAIL_REFERENCEID in ('5457112114132535');
select * from PAYMENTS.payment_advice_txn where MAIL_TXN_ID in ('5457112114132535');
select * from payments.gr020mb where AC_NO='1001000004446';
select REF_NO, REQ_DATE_TIME, RES_DATE_TIME from payments.if016tb where ref_no='5452411112172761';
select * from payments.txn_post_dupl where ref_no in ('5456212114130500') order by ref_no;
select * from payments.txn_post_staging where ref_no in ('5452411122168442','5452411122168443','5452411122168444','5452411122168445',
'5452411122168446','5452411122168447','5452411122168448');
select * from payments.if016tb where ref_no in ('5452411112172692','5452411112172736','5452411112172751','5452411112172739','5452411112172761') order by ref_no;
select * from PAYMENTS.messages where msg like '%5452411112172692%';

/*
declare
    num  number;
    msg varchar2(500);
begin
    payments.CA099PT('BR0001','5456212114130500',num, msg,'Y');
    DBMS_OUTPUT.PUT_line('output -> ' || num || msg );
end;*/

SELECT COUNT(*) 
FROM payments.TXN_POST_HISTORY 
where  TXN_TYPE='DFTOUT' AND --VAL_dT=t_val_dt AND CHANNEL_ID=T_CHANNEL_ID  AND COL_1=dr_legacy_no  AND COL_3=Dr_Amount AND COL_8=t_cr_ac_no AND
HOST_TXN_TYPE IN('TX','CH');


SELECT DISTINCT    UFM.OD_PRODUCT_CODE PRODUCT,    UFM.OD_SUBPROD_CODE SUBPROD,    UFM.OD_FUNCTION_CODE FUNCTION    
FROM    cbx.OD_USER_FUNCTION_MB UFM   WHERE    UFM.OD_USER_NO =:1      AND UFM.OD_GCIF =:2  