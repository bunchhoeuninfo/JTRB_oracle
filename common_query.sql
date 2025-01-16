--*** UAT0 test account (USD)5605944

-----------------------------------------------
select * from payments.ps030mb;

-----****************************************
SELECT
    *
FROM
    payments.if003pb
WHERE
    value LIKE '%103%';

SELECT
    *
FROM
    cbx.od_txn_master
ORDER BY
    od_maker_date DESC;

SELECT
    *
FROM
    imh.

--*****GDT Project Table*******
    chn_txn_post userdevicemb;

-----------------------------
select * from payments.if001tb where ref_no='5452301301443222';
select * from cashcore.ps080tb;
select * from cashcore.ps082tb where ref_no='5452301301443222';
select * from cashcore.portal_request where ref_no='5452301301443222';
select * from cashcore.TXN_AUDIT_PAY;
select * from idccore.maincont;

--CCSAU & CCSAM
select * from cashcore.autoupload_audit;
select * From cbx.auto_upload_txn;



SELECT * FROM all_source WHERE text LIKE '%SP_SYNC_MONTH_BAL%';





--========================SP to find value in any table

DECLARE
  match_count INTEGER;

--the owner/schema of the tables you are looking at
  v_owner VARCHAR2( 255) :='LMS' ;

-- data type you look at (in CAPITAL)
-- VARCHAR2, NUMBER, etc.
  v_data_type VARCHAR2( 255) :='VARCHAR2' ;

--The value you are looking for with like "%" operator
  v_search_string VARCHAR2(4000) := '%While selecting from M_FIN_MAP%' ;

BEGIN
  FOR t IN (SELECT atc.table_name
                  ,atc.column_name
                  ,atc.owner 
            FROM all_tab_cols atc
           WHERE atc.owner = v_owner
             AND data_type =  v_data_type
             -- esclude vir. columns
             AND atc.column_id is not null
             -- exclude views
             AND not exists (select 1 
                               from all_views 
                               where view_name = atc.table_name) ) LOOP

    EXECUTE IMMEDIATE
        'SELECT COUNT(*) FROM ' 
         || t.owner || '.'  ||t. table_name|| 
        ' WHERE UPPER("'||t.column_name ||'") LIKE  UPPER(:1)'
    INTO match_count
    USING v_search_string ;

    IF match_count > 0 THEN
      dbms_output.put_line( t. table_name ||' ' ||t.column_name ||' '||match_count );
    END IF;

  END LOOP;
END;
/
--=======================================================


select * from dfcore.account_info where acc_no = '4346207';
select * from idccore.omni_acnt where IACLINK_ACTUAL_ACNUM in ('4446326','4448743');
select * from payments.if001tb where ref_no = 'AAAC369D3922';
select * from payments.if016tb where ref_no ='AAAC369D3922';
select * from idccore.omni_acnt where iaclink;

select * from data_sync.dtsync_status_hist where entity_no like '%2468625' order by tod_date desc;


ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RRRR HH24:MI:SS';








--RESET ARX PASSWORD
--############################################################################################################# 
--#Run below queries in sql devloper/toad 
--#Pl note that the passwords will be updated irrespective of the current status of the user & password history 
--############################################################################################################# 
--#############################################
--#Below sql support in version upto 18.0.x 
--#############################################
--UPDATE TB_ARM_USER_MASTER SET USER_STATUS = 2, UNSCSSFL_ATMPT = 0 WHERE  USER_LOGIN = 'acenla'; 
--UPDATE IMS_USER_PSWD SET INST_EFF_DTM = sysdate, NXT_PSWD_EXP_DTM = sysdate + NVL((SELECT CNFG_VALUE FROM IMS_PSWD_CONFIG WHERE CNFG_NAME = 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' AND TYPE_ID=(SELECT USER_TYPE FROM TB_ARM_USER_MASTER WHERE USER_LOGIN='acenla') AND IDENTIFIER_ID = (SELECT USER_IDENTIFIER_ID FROM TB_ARM_USER_MASTER WHERE USER_LOGIN='acenla')),(SELECT CNFG_VALUE FROM IMS_PSWD_CONFIG WHERE CNFG_NAME = 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' AND TYPE_ID=(SELECT USER_TYPE FROM TB_ARM_USER_MASTER WHERE USER_LOGIN='acenla') AND IDENTIFIER_ID = 0)),  PSWD_VAL = '9229c772d6c07853cdd9b1ce61991681' WHERE PSWD_TYP_CD = 'LGN' AND INST_EXP_DTM IS NULL AND USER_ID  = (SELECT ID FROM TB_ARM_USER_MASTER WHERE USER_LOGIN = 'acenla');  


select to_char(actual_req_date, 'dd-mon-rr hh24:mi:ss') from payments.if001tb where ref_no = 'AAAB308D0821';
select to_char(OD_AUTH_DATE, 'dd-mon-rr hh24:mi:ss') from dfcore.od_txn_master where od_ref_no = 'AAAB308D0821';

select * from dfcore.od_txn_master where od_ref_no = 'AAAB308D0821';

--***CHARGE SETUP
select ref_no from ca080tb where mod_Cd='FC' and txn_Cd='1';
select * from payments.ca080tb where ref_no='FCSF260819007668';

select * from payments.ch002mb where txn_id like '%999FC1BRC%' and CHANNEL_ID= 'BRC' and service_tier = 'ST0002' ; 
SELECT * FROM CH001MB WHERE CHG_cD in ('CH103','CH102');
select * from mc012tb;
SELECT * FROM PS028MB WHERE CCY_CD='USD';
SELECT * FROM PS029MB WHERE BANK_CD=101321;
SELECT * FROM GR020MB WHERE LEGACY_aC='1475010';
SELECT * FROM PAYMENTS.CH002MB WHERE TXN_ID LIKE '%FC1BRC%' AND CHANNEL_ID='BRC';
UPDATE CH001MB SET FXD_PRICE='21' WHERE CHG_CD='CH103';
UPDATE CH001MB SET VAR_PRICE=0.3 WHERE CHG_CD='CH102';
SELECT * FROM CH002MB WHERE TXN_ID='999FC1BRC01' AND SERVICE_tIER='ST0002' AND CHANNEL_ID='BRC' AND CHG_cD='CH102';
UPDATE CH002MB SET MIN_AMT='23' WHERE TXN_ID='999FC1BRC01' AND SERVICE_tIER='ST0002' AND CHANNEL_ID='BRC' AND CHG_cD='CH102';

--IDC PROD CODE & branch maitneance MAINTENANCE
--prod code need to maintain in this table

---THESE TABLE HAS TO MAINTAIN
--1) ->PRODUCTS
--2) ->ACSEQDTL
--3) ->CMNOTN;
--3.1)ACTYPES
--4) ->CASHCORE.PRODUCT_ACCOUNT_TYPE_CBS
--5) -> IDCCORE.IBACPM -- GL head maitenance for particulare currency and also brn creation
--6) -> DFCORE.APP_CODE_MAINTENANCE_MASTER
--7) -> DFCORE.CUST_ACC_TYPE_MAINT_MB
--8) -> DFCORE.account_type_master
--9) -> dfcore.OD_PAY_CCY_MATRIX
--)select * from payments.GR001mb; shall be synced dynamically
select * from CASHCORE.PRODUCT_ACCOUNT_TYPE_CBS;
select * from idccore.omni_acnt;
select * from idccore.ACSEQDTL where ACSEQDTL_PRODUCT_CODE = '30';
select * from DFCORE.APP_CODE_MAINTENANCE_MASTER where ACC_TYPE like '%1200%';

update DFCORE.APP_CODE_MAINTENANCE_MASTER set acc_type='100,102,200,202,400,500,501,502,503,506,507,534,573,600,602,700,800,801,802,803,807,834,873,900,1000,1100,1102,1200,1202,1260,1300,1400,1500,1502,1534,1602,2008,4300,5016,6000,6002,6025,6100,6102,6200,6202,6300,6400,6500,6600,6700,7900,7910,8000,8100,8110,9800,1702,1700,1800,1802,0083,3000,3002' where MODULE_TYPE|| ACC_TYPE_DESC|| ACC_STATUS|| ACC_CCY_CODE='ACSUMCA,SAALLALL';


SELECT * FROM idccore.CBSASIINNP I WHERE I.ASIIN_FIELD_003 = '920000' AND I.ASIIN_DATE > '01-NOV-2020' AND I.ASIIN_FIELD_002 LIKE '%100000041%' ORDER BY I.ASIIN_IN_TIME DESC;
SELECT * FROM idccore.CBSASIOUTNP O WHERE O.ASIOUT_FIELD_003 = '920000' AND O.ASIOUT_DATE > '01-NOV-2020' AND O.ASIOUT_FIELD_002 LIKE '%100000041%' ORDER BY 
O.ASIOUT_OUT_TIME DESC;
SELECT * FROM idccore.CBSASIINNP I WHERE I.ASIIN_FIELD_011 = 'AAAB0C4EAD20'  AND I.ASIIN_DATE > '01-NOV-2020' ORDER BY I.ASIIN_IN_TIME DESC;
select * from payments.if012tb;




SELECT * FROM LMS.T_COMMON_REPORT WHERE tcr_cust_id||tcr_con_id||tcr_proj_id IN (SELECT MPI_CUST_ID||MPI_CON_ID||MPI_PROJ_ID FROM LMS.M_PROJ_INFO WHERE 
mpi_mig_flag IS NULL AND REC_ST='A') ORDER BY tcr_cust_id||tcr_con_id||tcr_proj_id,tcr_slno;
SELECT * FROM LMS.M_DISB_INFO WHERE MDI_CUST_ID||MDI_CON_ID||MDI_PROJ_ID IN (SELECT MPI_CUST_ID||MPI_CON_ID||MPI_PROJ_ID FROM LMS.M_PROJ_INFO WHERE 
mpi_mig_flag IS NULL AND REC_ST='A') ORDER BY MDI_CUST_ID||MDI_CON_ID||MDI_PROJ_ID,MDI_DISB_DT;
SELECT * FROM LMS.M_TXN_INFO WHERE MTI_CUST_ID||MTI_CON_ID||MTI_PROJ_ID IN (SELECT MPI_CUST_ID||MPI_CON_ID||MPI_PROJ_ID FROM LMS.M_PROJ_INFO WHERE 
mpi_mig_flag IS NULL AND REC_ST='A') ORDER BY MTI_CUST_ID||MTI_CON_ID||MTI_PROJ_ID,MTI_BUSI_DT;
SELECT * FROM LMS.M_DISB_INFO,LMS.M_TXN_INFO WHERE
MDI_CUST_ID =MTI_CUST_ID AND
MDI_CON_ID = MTI_CON_ID AND
MDI_PROJ_ID= MTI_PROJ_ID AND
MDI_DISB_DT= MTI_BUSI_DT AND 
MTI_TXN_CD='DISB'  AND
MDI_DISB_AMT=MTI_TXN_TOT_AMT AND
MDI_CUST_ID||MDI_CON_ID||MDI_PROJ_ID IN (SELECT MPI_CUST_ID||MPI_CON_ID||MPI_PROJ_ID FROM LMS.M_PROJ_INFO WHERE 
mpi_mig_flag IS NULL AND REC_ST='A');

select * from idccore.iaclink where iaclink_actual_acnum = '4382202';
select * from idccore.ACNTCBAL where acntcbal_internal_acnum = '1001200032631';
select * from idccore.ACNTBAL where ACNTBAL_INTERNAL_ACNUM = '1001200032631';
select * from idccore.PBDCONTRACT where pbdcont_dep_ac_num = '1001000007155';
select * from data_sync.dtsync_status_hist where entity_no like '%4252024';
select * from data_sync.dtsync_audit_log where log_key = '12007-00000000004252024-20210201-15513392';

select * from idccore.iaclink where iaclink_actual_acnum = '458175';

select * from DATA_SYNC.DTSYNC_STATUS_HIST WHERE ENTITY_NO like '%4329962';
select * from DATA_SYNC.DTSYNC_AUDIT_LOG where log_key = '9992-00000000004329962-20201212-02013433';

select * from idccore.PBDCONTRACT;
select * from iaclink;
select * from data_sync.dtsyn_status_hist;
--CS0048647
SELECT * FROM lms.M_PROJ_INFO WHERE MPI_LEGACY_ID like '%3923775'; 
SELECT * FROM lms.M_PROJ_INFO WHERE MPI_LEGACY_ID like '%4228524';
--Pass the CUST_ID,CON_ID & PROJ_ID to the below query and send the data
SELECT * FROM lms.M_PROJ_INFO WHERE MPI_CUST_ID =0100162649 AND MPI_CON_ID=002 AND MPI_PROJ_ID=0001;
SELECT * FROM lms.M_PROJ_FINBAL_VIEW WHERE MPF_CUST_ID =0100162649 AND MPF_CON_ID=002 AND MPF_PROJ_ID=0001;
SELECT * FROM LMS.H_PROJ_PAYMENT WHERE HPP_CUST_ID =0100162649 AND HPP_CON_ID=002 AND HPP_PROJ_ID=0001;
SELECT * FROM LMS.M_BALANCE_DTLS WHERE MBD_CUST_ID =0100162649 AND MBD_CON_ID=002 AND MBD_PROJ_ID=0001;
SELECT * FROM LMS.M_LATECHG_INFO WHERE MLI_CUST_ID =0100162649 AND MLI_CON_ID=002 AND MLI_PROJ_ID=0001;
SELECT * FROM LMS.M_TXN_INFO WHERE MTI_CUST_ID =0100162649 AND MTI_CON_ID=002 AND MTI_PROJ_ID=0001;
SELECT * FROM lms.M_DISB_SCHD WHERE MDS_CUST_ID =0100162649 AND MDS_CON_ID=002 AND MDS_PROJ_ID=0001;
SELECT * FROM lms.M_DISB_INFO WHERE MDI_CUST_ID =0100162649 AND MDI_CON_ID=002 AND MDI_PROJ_ID=0001;
SELECT * FROM lms.M_REPMT_SCHD WHERE MRS_CUST_ID =0100162649 AND MRS_CON_ID=002 AND MRS_PROJ_ID=0001;
SELECT * FROM lms.T_COMMON_REPORT  WHERE TCR_CUST_ID=0100162649 AND TCR_CON_ID=002 AND TCR_PROJ_ID=0001;




SELECT mpi_legacy_id, mpi_cust_id, mpi_repmt_ccy, pp_prod_desc, mpi_proj_cost,  mpf_prin_balance,
          GREATEST(LEAST(NVL(mid_base_rt,0) + NVL(mid_cust_int_offset,0) + NVL(mid_prod_offset,0) + NVL(mid_proj_offset,0), mid_net_intrt_ceil), mid_net_intrt_flor),
          mc_cust_name,  mpi_st_dt, mpi_repmt_tnr, DECODE(MPI_REPMT_FRQ,'PFRMON','M','PFRQUA','Q','PFRHAF','H','PFRYRL','Y','M'),
	  mpi_mat_dt,  0, mpad_accno, mpad_accno, mpf_tot_disb_amt, mpi_emi, mpf_next_due_cre_dt, 0, mpi_emi, mpf_dues_os, mpf_tot_os, 
          mpi_repmt_tnr,
          (select ctrl_desc2 from lms.control where ctrl_text = 'DELQ-STAT' and ctrl_desc1 = mpi_dq_stat_cd)||' '||NVL(mpi_dpd,0)||' Day(s)', 
           mpi_disb_dt, pc_business_dt - NVL(mpi_dpd,0), (Select pcty_city_desc FROm lms.p_branch where pcty_city_cd = mpi_org_pos_cd),
	   m_proj_info.rec_st
   FROM   lms.m_proj_info, lms.m_proj_finbal_view, lms.m_interest_dtls, lms.p_prd, lms.m_cust, lms.p_ctrl,
          (
          SELECT mpad_cust_id, mpad_con_id, mpad_proj_id, mpad_accno
          FROM   lms.m_proj_accno_details
          WHERE  mpad_priority = 1)
   WHERE  mpi_legacy_id  =  '00000000003926073'
   AND    mpi_cust_id    = mpf_cust_id
   AND    mpi_con_id     = mpf_con_id
   AND    mpi_proj_id    = mpf_proj_id
   AND    mpi_cust_id    = mid_cust_id
   AND    mpi_con_id     = mid_con_id
   AND    mpi_proj_id    = mid_proj_id
   AND    mpi_cust_id    = mc_cust_id
   AND    mpi_cust_id    = mpad_cust_id(+)
   AND    mpi_con_id     = mpad_con_id(+)
   AND    mpi_proj_id    = mpad_proj_id(+)
   AND    mpi_prod_cd    = pp_prod_cd;
 
   SELECT * FROM lms.intf_cbx_loan_info WHERE icli_loan_number='00000000003926073';




/**LMS***/

select * from lms.m_proj_info where mpi_legacy_id like '%3735715';
SELECT * FROM LMS.T_COMMON_REPORT  WHERE TCR_CUST_ID='0100004178' AND TCR_CON_ID='001' AND TCR_PROJ_ID='0001';
SELECT * FROM lms.M_PROJ_FINBAL_VIEW WHERE MPF_CUST_ID ='0100004178' AND MPF_CON_ID='001' AND MPF_PROJ_ID='0001';
SELECT * FROM LMS.H_PROJ_PAYMENT WHERE HPP_CUST_ID ='0100004178' AND HPP_CON_ID='001' AND HPP_PROJ_ID='0001';
SELECT * FROM LMS.M_BALANCE_DTLS WHERE MBD_CUST_ID ='0100004178' AND MBD_CON_ID='001' AND MBD_PROJ_ID='0001';
SELECT * FROM LMS.M_LATECHG_INFO WHERE MLI_CUST_ID ='0100004178' AND MLI_CON_ID='001' AND MLI_PROJ_ID='0001';
SELECT * FROM LMS.M_TXN_INFO WHERE MTI_CUST_ID ='0100004178' AND MTI_CON_ID='001' AND MTI_PROJ_ID='0001';
SELECT * FROM LMS.M_REPMT_SCHD WHERE MRS_CUST_ID ='0100004178' AND MRS_CON_ID='001' AND MRS_PROJ_ID='0001';
 SELECT NVL(SUM(mti_prin_amt),0)
      FROM   lms.m_txn_info
   WHERE  mti_cust_id  = '0100004178'
   AND    mti_con_id   = '001'
   AND    mti_proj_id  = '0001'
   AND    mti_txn_cd   = 'DISB'
   AND    mkr_id       = 'MIGMKR'
   AND    mti_busi_dt  <= '18-AUG-19';
SELECT NVL(SUM(mli_latechg_amt),0)
      FROM   lms.m_latechg_info
   WHERE  mli_cust_id  = '0100004178'
   AND    mli_con_id   = '001'
   AND    mli_proj_id  = '0001'
   AND    mli_mig_flag = 'Y';
SELECT -1*NVL(SUM(mti_prin_due_amt+mti_int_due_amt),0)
   
   FROM   lms.m_txn_info
   WHERE  mti_cust_id  = '0100004178'
   AND    mti_con_id   = '001'
   AND    mti_proj_id  = '0001'
   AND    mti_txn_cd   = 'PYMT'
   AND    mkr_id       = 'MIGMKR'
   AND    mti_busi_dt  <= '18-AUG-19'; 
   
   SELECT NVL(SUM(mti_int_amt + mti_cap_int_amt),0)
     FROM   LMS.m_txn_info
   WHERE  mti_cust_id  = '0100004178'
   AND    mti_con_id   = '001'
   AND    mti_proj_id  = '0001'
   AND    mti_txn_cd   = 'DUECRE'
   AND    mkr_id       = 'MIGMKR'
   AND    mti_busi_dt  <= '18-AUG-19'; 





/*******************************/
SELECT OD_TO_ID,OD_MAIL_BODY,OD_MAIL_SUBJECT,OD_REPLY_TO,OD_MAIL_STATUS,OD_REF_ID,OD_CC_TO,OD_BCC_TO,OD_PATH,OD_DATE,OD_HAS_ATTACHMENT,OD_FILE_NAME  
FROM payments.OD_PENDING_MAIL M WHERE OD_MAIL_STATUS= 'N';

select * from PAYMENTS.OD_PENDING_MAIL where OD_MAIL_BODY like '%AAAB1B5DED20%';
select * from imh.timer;


SELECT * FROM lms.M_PROJ_INFO WHERE MPI_LEGACY_ID=3926073;
SELECT * FROM lms.M_PROJ_FINBAL_VIEW WHERE MPF_CUST_ID='0100176703' AND MPF_CON_ID='001' AND MPF_PROJ_ID='0001';
SELECT * FROM lms.M_INTEREST_DTLS WHERE MID_CUST_ID='0100176703' AND MID_CON_ID='001' AND MID_PROJ_ID='0001';
SELECT * FROM lms.M_PROJ_ACCNO_DETAILS WHERE MPAD_CUST_ID='0100176703' AND MPAD_CON_ID='001' AND MPAD_PROJ_ID='0001';
SELECT * FROM lms.intf_cbx_loan_info WHERE  icli_cust_id = 3926073;
select * from payments.if008tb where req_log_1 like '%202100182336%';



SELECT * FROM lms.M_PROJ_INFO WHERE MPI_LEGACY_ID=3926073;
SELECT * FROM lms.M_PROJ_FINBAL_VIEW WHERE MPF_CUST_ID='0100176703' AND MPF_CON_ID='001' AND MPF_PROJ_ID='0001';
SELECT * FROM DATASYNC.SAFL WHERE ACCT_NO =3926073;


select * from PAYMENTS.if008tb where sw_ref_no = '202000342765';
select * from PAYMENTS.MC012TB where msg_seq_num = 'FCSF101220047511';

select INDCLIENT_CODE, INDCLIENT_BIRTH_DATE from IDCCORE.INDCLIENTS;

 select y.TOD_DATE, y.TOD_TIME, y.ENTITY_NO,  ACNTS_CLOSURE_DATE, ACNTBAL_AC_BAL, y.ERROR_MSG
from data_sync.dtsync_status_hist y , idccore.ACNTS A, idccore.IACLINK, idccore.ACNTBAL
      where refresh_type='AX' AND ERROR_MSG != 'S'
 AND ERROR_MSG NOT LIKE '%end-of-body reached%'
 and A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM 
AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM
 and ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM
and to_number(y.ENTITY_NO)=IACLINK_ACTUAL_ACNUM
      AND ACNTS_CLOSURE_DATE IS NOT NULL;
      
      
select * from PAYMENTS.PS029MB where swift_code like '%CRAA%';





select * from PAYMENTS.MC012TB;
select * from PAYMENTS.EM300TB where msg_type in ('199','103');

select a.clients_name, a.clients_code, a.clients_home_brn_code curr_home_brn, b.br_cd av_brn 
from idccore.clients a
left join dfcore.BRANCH_MASTER b on A.CLIENTS_HOME_BRN_CODE = b.br_cd
where a.clients_home_brn_code in ('31','20','80','90');

select * from dfcore.BRANCH_MASTER;




/*Please find the password reset scripts for CBX Backoffice users. Kindly run this script in Production to access these users.
UPDATE ARX.TB_ARM_USER_MASTER SET USER_STATUS = 2, UNSCSSFL_ATMPT = 0 WHERE  USER_LOGIN = 'SYSADMIN1'; 
UPDATE ARX.IMS_USER_PSWD SET INST_EFF_DTM = sysdate, NXT_PSWD_EXP_DTM = sysdate + NVL((SELECT CNFG_VALUE FROM ARX.IMS_PSWD_CONFIG WHERE 
CNFG_NAME = 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' AND TYPE_ID=(SELECT USER_TYPE 
FROM ARX.TB_ARM_USER_MASTER WHERE USER_LOGIN='SYSADMIN2') AND IDENTIFIER_ID = (SELECT USER_IDENTIFIER_ID FROM ARX.TB_ARM_USER_MASTER 
WHERE USER_LOGIN='SYSADMIN2')),(SELECT CNFG_VALUE FROM ARX.IMS_PSWD_CONFIG WHERE CNFG_NAME = 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' 
AND TYPE_ID=(SELECT USER_TYPE FROM ARX.TB_ARM_USER_MASTER WHERE USER_LOGIN='SYSADMIN2') AND IDENTIFIER_ID = 0)),  
PSWD_VAL = 'e07e74631123f6b602d398fdc15dc5d8' WHERE PSWD_TYP_CD = 'LGN' AND INST_EXP_DTM IS NULL AND USER_ID  = 
(SELECT ID FROM ARX.TB_ARM_USER_MASTER WHERE USER_LOGIN = 'SYSADMIN2');  

UPDATE arx.TB_ARM_USER_MASTER SET USER_STATUS = 2, exp_date = '01-FEB-22', UNSCSSFL_ATMPT = 0 WHERE  USER_LOGIN = 'CBXSUPERADMIN3'; 
UPDATE arx.IMS_USER_PSWD SET INST_EFF_DTM = sysdate, NXT_PSWD_EXP_DTM = 100+ sysdate + NVL((SELECT CNFG_VALUE FROM arx.IMS_PSWD_CONFIG WHERE CNFG_NAME 
= 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' AND TYPE_ID=(SELECT USER_TYPE FROM arx.TB_ARM_USER_MASTER WHERE USER_LOGIN='CBXSUPERADMIN3') 
AND IDENTIFIER_ID = (SELECT USER_IDENTIFIER_ID FROM arx.TB_ARM_USER_MASTER WHERE USER_LOGIN='CBXSUPERADMIN3')),(SELECT CNFG_VALUE FROM 
arx.IMS_PSWD_CONFIG WHERE CNFG_NAME = 'PASSWD_EXPIRY_DAYS' AND TYPE='UT' AND TYPE_ID=(SELECT USER_TYPE FROM arx.TB_ARM_USER_MASTER WHERE 
USER_LOGIN='CBXSUPERADMIN3') AND IDENTIFIER_ID = 0)),  PSWD_VAL = 'e07e74631123f6b602d398fdc15dc5d8' WHERE PSWD_TYP_CD = 'LGN' 
AND INST_EXP_DTM IS NULL AND USER_ID  = (SELECT ID FROM arx.TB_ARM_USER_MASTER WHERE USER_LOGIN = 'CBXSUPERADMIN3');  
*/
select * from ARX.TB_ARM_USER_MASTER where user_login= 'SYSADMIN3';
select * from ARX.IMS_USER_PSWD where user_id = '1723';


select * from IDCCORE.HOLLIST where HOLLIST_ENTD_ON = '11-DEC-19';
select * from PAYMENTS.TXN_POST_HISTORY where ref_no = 'FCSF061120041117';
select distinct trunc(DR_VAL_DATE) from payments.Fcy_Outward where ref_no = 'FCSF061120041117';
select * from PAYMENTS.WF110TB where ref_no = 'FCSF061120041117';

select * from DATA_SYNC.DTSYNC_STATUS_HIST where REFRESH_TYPE = 'AX' and status <> 'SUCCESS';
select * from PAYMENTS.TXN_POST_HISTORY where ref_no = '5452010280876042';
select * from PAYMENTS.IF001TB where ref_no = '5452010280876042';
select * from CASHCORE.PS080TB where REF_NO = '5452010280876042';


SELECT ACNTS_CLIENT_NUM CIF, IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR,
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'01-OCT-2020',(select MN_CURR_BUSINESS_DATE from maincont)) CLSBAL,
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'01-OCT-2020',(select MN_CURR_BUSINESS_DATE from maincont),'1') CLSBAL_flg_1
FROM ACNTS A, IACLINK
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM
AND IACLINK_ACTUAL_ACNUM IN (2436557)
ORDER BY 1;



SELECT *
  FROM idccore.ACBALASONHIST
 WHERE ACBALH_ENTITY_NUM = 1
   AND ACBALH_INTERNAL_ACNUM =  ( SELECT IACLINK_INTERNAL_ACNUM FROM idccore.IACLINK WHERE IACLINK_ACTUAL_ACNUM IN (2436557) 
AND IACLINK_ENTITY_NUM=1 )
   ORDER BY ACBALH_ASON_DATE;



--Check purging
SELECT * FROM cashcore.ARCHIVE_INFO_DETAILS;
select * from OD_SYSTEM_PARAMETER_MB 
 where OD_CODE_TYPE   = 'CBX_DATA_PURGING_SCHEDULER'    
   and OD_DESCRIPTION = 'DIB_BANK' ;
SELECT * FROM ARCHIVE_INFO_DETAILS;
SELECT * FROM ARCH_ERROR_LOG;



select * from DATA_SYNC.DTSYNC_STATUS_HIST where TOD_DATE = '20200921';
select * from cashcore.omni_acnt;
--SELECT * FROM DATA_SYNC.PRE_MIG_Swhere ref_no = '5452001230516492';
select * from payments.if01TAGE_ERR_COUNT;
--select * from PAYMENTS.WF110TB 6tb where ref_no = '5452001230516492'; 
select * from PAYMENTS.IF016TB where ref_no = '5451617030104521';
select * from PAYMENTS.TXN_POST_ERRORS where ref_no = '5452001230516492';
select * from PAYMENTS.TXN_POST_STAGING where STATUS = 'O';
select * from cashcore.wf110tb where ref_no = '5452001230516492';
select * from CASHCORE.PS080TB where ref_no = '5452001230516492';
select * from CBX.OD_TXN_MASTER where OD_REF_NO = '5452001230516492';
select * from IDCCORE.clients where clients_code = '100109%18';
select * from IDCCORE.CORPCLIENTS;

SELECT * FROM DATA_SYNC.DTSYNC_AUDIT_LOG L WHERE LOG_KEY like '%'
AND TRUNC(SYS_DT)='03-JUL-2020'
ORDER BY SYS_DT, LOG_KEY;

SELECT TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, H.*  
FROM  DATA_SYNC.dtsync_status_hist H
WHERE ENTITY_NO = 'KHR' AND TOD_DATE='20200703';




select * from DATA_SYNC.dtsync_status_hist where entity_no like '%3313272'; 
select * from DATA_SYNC.dtsync_status_hist where entity_no like '%3846165'; 



select count(*) from idccore.tran2020;

select * from idccore.tran2020 order by TRAN_DATE_OF_TRAN desc;

select* from PAYMENTS.wf110tb where ref_no = '5451326060134818';
select * from cbx.od_txn_master where od_ref_no = '5451326060134818';
select * from CASHCORE.ps080tb where ref_no = '5451326060134818';


select * from DATA_SYNC.dtsync_status_hist order by tod_date desc, tod_time desc;
select * from data_sync.dtsync_audit_log order by sys_dt desc;

select * from payments.wf110tb where ref_no = 'AAAAE13EC520';
select * from PAYMENTS.if001tb where ref_no = 'AAAAE13E9E20';
select * from PAYMENTS.if016tb where ref_no = 'AAAAE13EC520';


--Balance mismtch investigation
SELECT CLIENTS_CODE CIF, IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'01-JAN-2020',(select MN_CURR_BUSINESS_DATE from maincont),'1') CLSBAL_1, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'01-JAN-2020',(select MN_CURR_BUSINESS_DATE from maincont)) CLSBAL_DEF, 
ACNTBAL_AC_BAL curr_bal,
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'31-DEC-2019',(select MN_CURR_BUSINESS_DATE from maincont),'1') DEC31CLSBAL_1, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'31-DEC-2019',(select MN_CURR_BUSINESS_DATE from maincont)) DEC31CLSBAL_DEF, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'02-SEP-2019',(select MN_CURR_BUSINESS_DATE from maincont),'1') SEP2CLSBAL_1, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'02-SEP-2019',(select MN_CURR_BUSINESS_DATE from maincont)) SEP2CLSBAL_DEF
FROM idccore.ACNTS A, idccore.IACLINK, idccore.acntbal, idccore.CLIENTS
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM and ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM
AND A.ACNTS_CLIENT_NUM = CLIENTS_CODE
and IACLINK_ACTUAL_ACNUM='2247651';


--****************CARD TXN DETAIL
select * from dfcore.vw_all_txn_dtls where stat_group = 'CARDS' order by created_date desc;
select * from dfcore.VW_CARDS_TXN_DTLS;
select b.cust_full_name, a.*
from dfcore.CARDS_TXN_MT a
left join dfcore.customer_info b on a.cif = b.CUSTOMER_NUMBER
order by created_date desc;
select * from PAYMENTS.txn_post_history where ref_no = 'AAAAD53A5F20';
select * from PAYMENTS.if001tb where ref_no = 'AAAADC29E120';
select * from dfcore.CARDS_TXN_MT where ref_no = 'AAAADC29E120';
 select * from dfcore.customer_info;

SELECT * FROM DATA_SYNC.DTSYNC_AUDIT_LOG L WHERE LOG_KEY = 'MON_BAL_30MAY2020'
ORDER BY LOG_KEY,SYS_DT DESC;



--Total Number of Users Registered
select count(od_user_no) from dfcore.od_users_mb where od_udf15='Y';
--Total volume of the Transactions Per Day(Both channel Desktop & Mobile) between last 1 Month.
SELECT COUNT(*) CNT_TXN,
  DECODE(od_status,'AH','SUCCESS','RH','FAILURE') STATUS,
  OD_CHANNEL_ID CHANNEL
FROM dfcore.OD_TXN_MASTER
WHERE OD_MAKER_DATE between sysdate AND sysdate-30 AND  od_status IN('AH','RH')
GROUP BY OD_STATUS,OD_CHANNEL_ID;
--Total Number of Users registered mPIN.
select PLATFORM,count(*) from dfcore.OD_USERs_DEVICE_MB group by PLATFORM;




--loan narration
select mpi_legacy_id, MTI_CUST_ID,MTI_BUSI_DT, MTI_TXN_TOT_AMT, MTI_REMARK 
from LMS.m_txn_info t, LMS.m_proj_info
where MTI_CUST_ID=MPI_CUST_ID and MTI_CON_ID=MPI_CON_ID and MTI_PROJ_ID=MPI_PROJ_ID
--and mpi_legacy_id='00000000004023739' 
AND TRUNC(MTI_BUSI_DT) >'18-AUG-2019'
order by mpi_legacy_id,MTI_BUSI_DT;

SELECT mpi_legacy_id, MDI_CUST_ID, MDI_DISB_DT, MDI_DISB_AMT, MDI_REMARKS
FROM LMS.m_proj_info, LMS.m_disb_info d
where mdi_fkey=mpi_fkey and mdi_cust_id=mpi_cust_id and mdi_con_id=mpi_con_id and mdi_proj_id=mpi_proj_id
--and mpi_legacy_id = lpad(4023626,17,0)
AND MDI_DISB_DT > '18-AUG-2019'
ORDER BY mpi_legacy_id,MDI_DISB_DT;

select * from idccore.acnts where ACNTS_AC_NAME1 like '%&%';
select * from IDCCORE.iaclink;

--check swift in thru PE
select msg_type, msg_seq_num, status, mkr_id, mkr_dt, rad_ref_no, send_swift, recv_swift, related_ref, remarks from payments.mc012tb where trunc(mkr_dt)= '31-MAR-20';
select * from payments.mc012tb;

select * from PAYMENTS.mc012tb;
select * from PAYMENTS.if016tb where ref_no = 'SWFT190919000442';
select to_char(od_maker_date, 'DD-MON-RR HH:MI:SS') ;
select * from DFCORE.od_txn_master where od_ref_no = 'AAAAD049C120';
select * from IDCCORE.hollist;
--check PE error txn
select * from payments.IF001TB where ref_no = 'AAAAD049C120';
select * from PAYMENTS.wf110tb;
--check RBX table definition
SELECT    * FROM dfct.VIEW_DEFINITIOn where view_id in('ACC_TRAN_STATEMNT_VIEW_M','TXN_LOAN_STMT_VIEW_M','CREDIT_CARD_STMT_VIEW_M');
select * from dfct.form_item_definition where  form_id='FORM_ACC_STATEMENT_1';
select * from dfct.view_template_master where TEMPLATE_ID in('JT_ACC_STATEMENT','JT_CC_STATEMENT','LOAN_STMT');
select * from dfct.widget_definition_tool_pref;
select * from dfct.view_definition_tool_pref where  view_id in('ACC_TRAN_STATEMNT_VIEW_M','ACC_TRAN_STATEMNT_VIEW','TXN_LOAN_STMT_VIEW_M','CREDIT_CARD_STMT_VIEW_M');
select * from dfct.mst_cib_appid_handler_map where appid in('ACC_TRAN_STATEMNT_VIEW_M','ACC_TRAN_STATEMNT_VIEW','TXN_LOAN_STMT_VIEW_M','CREDIT_CARD_STMT_VIEW_M');
select * from dfct.DEBIT_SUM_VIEW;
select * from DFCT.view_definition;


---------------------------customer/account not created due to validation errors--------------------------------------------------------------------- 

SELECT DISTINCT KEY_FIELD1, KEY_FIELD2, KEY_FIELD3, TABLE_NAME, FIELD_NAME 
FROM IDCCORE.PRE_MIG_STAGE_ERR_DTL 
WHERE KEY_FIELD1 IN 
( 
    SELECT DISTINCT TO_NUMBER(ENTITY_NO) 
    FROM ( 
         select TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, ENTITY_NO, 
         SAF_TABLE, 
         NVL((CASE 
           WHEN SAF_TABLE='SAFC' THEN 
                (SELECT TO_CHAR(C.CLIENTS_CODE) 
                FROM idccore.CLIENTS C 
                WHERE C.CLIENTS_CODE = TO_NUMBER(ENTITY_NO)) 
           WHEN SAF_TABLE='SAFA' THEN 
                (SELECT I.IACLINK_ACTUAL_ACNUM 
                FROM idccore.ACNTS A, idccore.IACLINK I 
                WHERE A.ACNTS_INTERNAL_ACNUM=I.IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=I.IACLINK_ENTITY_NUM 
                AND I.IACLINK_ACTUAL_ACNUM = TO_NUMBER(ENTITY_NO)) 
         END),'Z') ENTITY_AVAIL 
         from DATA_SYNC.dtsync_status_hist 
         where refresh_type IN ('>C','>M') and status='FAILED' 
         AND SAF_TABLE IN ('SAFC','SAFA') 
         AND ERROR_MSG NOT LIKE '%ORA-29266: end-of-body reached%' 
         AND ERROR_MSG NOT LIKE '%ACCOUNT NUMBER ALREADY MIGRATED%'     
    )     
    WHERE ENTITY_AVAIL = 'Z' 
)     
ORDER BY KEY_FIELD1;




--------------------------------------------------TO DETECT any failed transaction during synching ---------------------------------------------------------------------------- 

SELECT   TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, H.*   
FROM data_sync.dtsync_status_hist H 
WHERE status='FAILED' AND  refresh_type NOT IN ('AH','AS') AND saf_table='SAFT' 
AND ERROR_MSG NOT LIKE '%Transaction Amount Cannot Be Zero During Addition  Record Num = 1  Record Num = 1  Record Num = 1%' 
AND ERROR_MSG NOT LIKE '%Transaction Not Allowed - Closed Account  Record Num = 1%' 
AND ERROR_MSG NOT LIKE '%ORA-29266: end-of-body reached%' 
AND ERROR_MSG NOT LIKE '%Account Already Closed..%' 
AND ERROR_MSG NOT LIKE '%Application Process Date is greater than System Business Date%' 
AND ERROR_MSG NOT LIKE '%Deposit Already Closed PBDCONTRACT Table%' 
AND ERROR_MSG NOT LIKE '%ACCOUNT NUMBER ALREADY MIGRATED%' 
AND ERROR_MSG NOT LIKE '%No Open Deposit Contract Found for Ac%' 
ORDER BY TOD_DATE, TOD_TIME, ENTITY_NO; 


select * from payments.txn_post_errors where ref_no in ('5451923030104005');
select to_char(TXN_POSTED_ON,'DD-MM-YYYY hh24:mi:ss') from payments.txn_post_errors where ref_no in ('5451523030104736');


--transaction narrations

SELECT IACLINK_ACTUAL_ACNUM ACNUM, TRAN_DATE_OF_TRAN TRAN_DT, DECODE( TRAN_DB_CR_FLG, 'C', TRAN_AMOUNT,-TRAN_AMOUNT) TXN_AMT,  
TRAN_VALUE_DATE VAL_DT,TRIM(TRAN_SUB_PROFIT_CNTR), TRAN_NARR_DTL1 NARR_DTL,
TRANAI_NARR_DTL1, TRANAI_NARR_DTL2, TRANAI_NARR_DTL3
FROM IDCCORE.TRAN2022, IDCCORE.IACLINK, idccore.TRANADDINFO2022
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
and TRANAI_ENTITY_NUM=TRAN_ENTITY_NUM and TRANAI_BRN_CODE=TRAN_BRN_CODE 
and TRANAI_DATE_OF_TRAN=TRAN_DATE_OF_TRAN and TRANAI_BATCH_NUMBER=TRAN_BATCH_NUMBER and TRANAI_BATCH_SL_NUM=TRAN_BATCH_SL_NUM
AND TRAN_DATE_OF_TRAN BETWEEN '8-APR-2022' AND '10-AUG-2022'
AND IACLINK_ACTUAL_ACNUM IN ( 4936477,4936488 )
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN;

select * from IDCCORE.TRANADDINFO2020;

select * from dfcore.account_info where cust_no = '100376329';

SELECT IACLINK_ACTUAL_ACNUM ACC_NO, Q.* FROM CLRVALQ Q, IACLINK
WHERE IACLINK_INTERNAL_ACNUM=Q.CLRVALQ_INTERNAL_AC_NUM
AND IACLINK_ENTITY_NUM=Q.CLRVALQ_ENTITY_NUM --AND IACLINK_ACTUAL_ACNUM IN (367810)
AND IACLINK_INTERNAL_ACNUM=1001100024516
AND CLRVALQ_FUTURE_VALUE_DATE <= '23-MAR-2020';


SELECT * FROM DATA_SYNC.DTSYNC_AUDIT_LOG WHERE LOG_KEY='PKG_FWDVALQ';

SELECT * FROM SODEODLOGDTL WHERE LOGDTL_DATE >= '16-MAR-2020';



--****data sync
BEGIN
  DBMS_SCHEDULER.STOP_JOB(
    JOB_NAME            => 'DTSYNC_FIRST_TRY');
END;
BEGIN
DBMS_SCHEDULER.run_job (job_name => 'DTSYNC_FIRST_TRY',
                          use_current_session => FALSE);
END;

select * from payments.PS013TB where txn_ref_no = '5455218030092003';


--******************UPDATE RBX PAYMENT STATUS TO SUCCESS
--update PAYMENTS.wf110tb set status='V', cond_reason='MANUALLY PROCESSED BY BANK' where REF_NO in ('AAAAC8E20B20','AAAAC8C00C20','5454125020142346'); 

--*******CHANGE PE DATE
--UPDATE payments.CA850MB SET LAST_WRK_DT ='17-SEP-21',BSNS_DT='20-SEP-21',PRC_DT='20-SEP-21' WHERE BR_CD='BR0001';
--****** REMOE SPECIAL CHARACTER WHICH CAUSE BLANCE SCREEN IN PE
--UPDATE PS013TB SET EXTERNAL_REMARKS='Payment Handa'  WHERE TXN_REF_NO='5455218030092003';
select * from payments.ca850mb;
select * from payments.if016tb where ref_no = 'FCSF111220048051';


select iaclink_actual_ACNUM, q.*
from clrvalq q, iaclink
where q.CLRVALQ_ENTITY_NUM=iaclink_ENTITY_NUM and q.CLRVALQ_INTERNAL_AC_NUM=iaclink_INTERNAL_ACNUM
order by q.CLRVALQ_TRAN_DATE, q.CLRVALQ_TRAN_BATCH_NUM, q.CLRVALQ_TRAN_BATCH_SL_NUM;

SELECT IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'10-feb-2020',(select MN_CURR_BUSINESS_DATE from maincont)) CLSBAL, 
ab.*
FROM ACNTS A, IACLINK, acntbal ab
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ab.ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM and ab.ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM
and ( ab.ACNTBAL_AC_CLG_CR_SUM <> 0 OR ab.ACNTBAL_BC_CLG_CR_SUM <> 0 );



SELECT IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR, 
FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'10-feb-2020',(select MN_CURR_BUSINESS_DATE from maincont)) CLSBAL, 
ab.*
FROM idccore.ACNTS A, idccore.IACLINK, idccore.acntbal ab
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ab.ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM and ab.ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM
AND IACLINK_ACTUAL_ACNUM IN (2108865);


select * from payments.wf110tb where ref_no = '5454125020142346';
select * from PAYMENTS.if016tb where ref_no = '5454125020142346';

--****ARX USER LOGIN-LOGOUT ACTIVITY DETAIL 
select USER_LOGIN as USER_LOGIN,CD_SUB_TYP_CD as ACTIVITY ,ACTVY_DTM as ACTIVITY_DATE 
from arx.IMS_ACTVY_LOG 
where CD_SUB_TYP_CD in ('Login','Logout') and ACTVY_DTM > TO_DATE('27-dec-2019','dd-mon-yyyy'); 

select * from  arx.IMS_ACTVY_LOG where ACTVY_DTM > TO_DATE('27-dec-2019','dd-mon-yyyy') and user_login = 'CHHIM.B';

select * from ARX.ims_actvy_log;


SELECT mpi.MPI_CUST_ID CIF, mpi.MPI_LEGACY_ID ACCT_NO,mpiv.MPF_TOT_OS BAL, G.F_NAME CNAME, MPI_REPMT_CCY CUR
FROM LMS.m_proj_finbal_VIEW mpiv, LMS.M_PROJ_INFO mpi , LMS.gr010mb g
where mpiv.MPF_CUST_ID = mpi.MPI_CUST_ID
and mpiv.MPF_CON_ID = mpi.MPI_CON_ID
and mpiv.MPF_PROJ_ID = mpi.MPI_PROJ_ID
and mpi.MPI_CUST_ID = g.CIF_NO
and mpi.MPI_LEGACY_ID in (LPAD(4261027,17,0), LPAD(2425444,17,0))
order by mpi.MPI_LEGACY_ID;

select mpi.MPI_LEGACY_ID, t.*
FROM LMS.m_txn_info t, LMS.M_PROJ_INFO mpi
where t.MTI_CUST_ID = mpi.MPI_CUST_ID and t.MTI_CON_ID = mpi.MPI_CON_ID and t.MTI_PROJ_ID = mpi.MPI_PROJ_ID
and mpi.MPI_LEGACY_ID = lpad(4256324,17,0)
ORDER BY MTI_BUSI_DT;

SELECT mpi_legacy_id, d.* 
FROM LMS.m_proj_info, LMS.m_disb_info d
where mdi_fkey=mpi_fkey and mdi_cust_id=mpi_cust_id and mdi_con_id=mdi_con_id and mdi_proj_id=mpi_proj_id
and mpi_legacy_id = lpad(2744914,17,0)
ORDER BY MDI_DISB_DT;




SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS WHERE JOB_NAME='DTSYN1629936' ORDER BY LOG_DATE;
SELECT * FROM USER_SCHEDULER_JOB_RUN_DETAILS WHERE JOB_NAME='DTSYN1629946' ORDER BY LOG_DATE;

--****LOAN TXN
SELECT mpi_legacy_id, d.* 
FROM LMS.m_proj_info, LMS.m_disb_info d
where mdi_fkey=mpi_fkey and mdi_cust_id=mpi_cust_id and mdi_con_id=mdi_con_id and mdi_proj_id=mpi_proj_id
and mpi_legacy_id = lpad(3313272,17,0)
ORDER BY MDI_DISB_DT;

select * from DATA_SYNC.DTSYNC_SP_MAINT order by 1,2;



--PAYMENT HOST ERROR CODE
select * from payments.host_err_cd_master where host_hdr_flag_1 = '2';
select * from payments.host_err_cd_master where HOST_ERR_TEXT like '%OUT%';


SELECT * FROM IDCCORE.ACNTLINK WHERE ACNTLINK_CIF_NUMBER=100181525;
select * from IDCCORE.IACLINK where IACLINK_CIF_NUMBER=100181525;
select * from IDCCORE.ACNTS where ACNTS_CLIENT_NUM=100181525;
SELECT * FROM DATA_SYNC.DTSYNC_STATUS_HIST 
WHERE REFRESH_TYPE IN ('>C','>M')  AND ENTITY_NO = LPAD(2805265,17,0) 
ORDER BY TOD_DATE; 

select * from cbx.od_pending_mail where od_mail_body like '%10000169%';
select * from CASHCORE.omni_account;

SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_VALUE_DATE, TRAN_NARR_DTL1
FROM IDCCORE.TRAN2019, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN BETWEEN '01-JAN-2019' AND '30-MAR-2020'
AND IACLINK_ACTUAL_ACNUM IN (4256324)
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN;

SELECT * FROM data_sync.DTSYNC_AUDIT_LOG WHERE LOG_KEY like '%ONLINE_HTTP_03%2020%'
ORDER BY LOG_KEY,SYS_DT DESC;

SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_VALUE_DATE, TRAN_NARR_DTL1
FROM IDCCORE.TRAN2020, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN BETWEEN '01-jan-2020' AND '05-jan-2020'
AND IACLINK_ACTUAL_ACNUM IN ( 4191057 )
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN;

select * from payments.host_err_cd_master where count(host_err_cd);


SELECT TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, H.*  FROM  data_sync.dtsync_status_hist H
WHERE H.ENTITY_NO = LPAD('4191057',17,0)
ORDER BY TOD_DATE;



SELECT TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, H.*  
FROM  data_sync.dtsync_status_hist H
WHERE ENTITY_NO=LPAD(4236341,17,0)
order by tod_date, tod_time;

SELECT * FROM data_sync.DTSYNC_AUDIT_LOG L WHERE LOG_KEY like '%4236341%'
ORDER BY LOG_KEY,SYS_DT DESC;



SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_VALUE_DATE, TRAN_NARR_DTL1 
FROM IDCCORE.TRAN2020, IDCCORE.IACLINK 
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM 
AND TRAN_DATE_OF_TRAN BETWEEN '18-AUG-2019' AND '13-MAR-20' 
AND IACLINK_ACTUAL_ACNUM IN ( 4242196 ) 
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN; 

SELECT * FROM DATA_SYNC.DTSYNC_STATUS_HIST WHERE REFRESH_TYPE='CP' AND STATUS='SUCCESS' order by tod_date, tod_time; 

--ARX user activity
select USER_LOGIN as USER_LOGIN,CD_SUB_TYP_CD as ACTIVITY ,ACTVY_DTM as ACTIVITY_DATE 
from arx.IMS_ACTVY_LOG 
where CD_SUB_TYP_CD in ('Login','Logout') 
and ACTVY_DTM >= TO_DATE('27-dec-2019','dd-mon-yyyy')
and actvy_dtm <= to_date('28-dec-2019','dd-mon-yyyy')
order by activity_date; 

select * from arx.tb_arm_user_master where user_login like '%Saren%';




--ARX Log
select * from ARX.tb_arm_session where to_date(creation_time,'DD-MON-RR') = '27-DEC-19';
select * from ARX.tb_arm_user_master where user_login = 'Sokloing.Yim';
select * from ARX.od_audit where od_login_id = 'CHHIM.B';


--shreeni query to checki Finet & IDC statement 
SELECT mpi_legacy_id, a.mti_proj_id, a.mti_txn_pos_cd, a.mti_busi_dt,a.mti_val_dt, a.mti_txn_cd, a.mti_txn_tot_amt, mti_prin_amt, mti_prin_due_amt, mti_remark, mti_ref_no
FROM LMS.m_txn_info a
    left join lms.M_PROJ_INFO b on a.MTI_CUST_ID = b.MPI_CUST_ID
where b.MPI_LEGACY_ID=lpad(2744914,17,0)
    and a.mti_val_dt between '18-AUG-19' and '31-DEC-19';

select * from lms.m_txn_info;
select * from lms.M_PROJ_INFO where MPI_LEGACY_ID=lpad(4189843,17,0);

SELECT * FROM lms.M_PROJ_FINBAL ;
select * from lms.M_PROJ_INFO where MPI_LEGACY_ID=lpad(4189843,17,0);
select * from mpi.MPI_LEGACY_ID;
select * from ARX.tb_arm_user_master where user_login like '%TANG%';


select mpi.MPI_LEGACY_ID, count(1) cnt, sum(MTI_TXN_TOT_AMT)
FROM LMS.m_txn_info t, LMS.M_PROJ_INFO mpi
where t.MTI_CUST_ID = mpi.MPI_CUST_ID and t.MTI_CON_ID = mpi.MPI_CON_ID and t.MTI_PROJ_ID = mpi.MPI_PROJ_ID
and trunc(t.mti_sys_dt) = '30-DEC-2019'
and t.mti_busi_dt <> '30-DEC-2019'
and mpi.MPI_LEGACY_ID=lpad(4189843,17,0)
group by mpi.MPI_LEGACY_ID
order by mpi.MPI_LEGACY_ID;

SELECT mpi.MPI_LEGACY_ID,mpiv.MPF_TOT_OS
FROM LMS.m_proj_finbal_VIEW mpiv, LMS.M_PROJ_INFO mpi
where mpiv.MPF_CUST_ID = mpi.MPI_CUST_ID
and mpiv.MPF_CON_ID = mpi.MPI_CON_ID
and mpiv.MPF_PROJ_ID = mpi.MPI_PROJ_ID
and mpi.MPI_LEGACY_ID=lpad(1883303,17,0);

select * from lms.p_prd;

SELECT mpi.MPI_LEGACY_ID,mpiv.MPF_TOT_OS
FROM LMS.m_proj_finbal_VIEW mpiv, LMS.M_PROJ_INFO mpi
where mpiv.MPF_CUST_ID = mpi.MPI_CUST_ID
and mpiv.MPF_CON_ID = mpi.MPI_CON_ID
and mpiv.MPF_PROJ_ID = mpi.MPI_PROJ_ID
and mpi.MPI_LEGACY_ID=lpad(1883303,17,0);

select mpi.MPI_LEGACY_ID, count(1) cnt, sum(MTI_TXN_TOT_AMT)
FROM LMS.m_txn_info t, LMS.M_PROJ_INFO mpi
where t.MTI_CUST_ID = mpi.MPI_CUST_ID and t.MTI_CON_ID = mpi.MPI_CON_ID and t.MTI_PROJ_ID = mpi.MPI_PROJ_ID
and trunc(t.mti_sys_dt) = '30-DEC-2019'
and t.mti_busi_dt <> '30-DEC-2019'
group by mpi.MPI_LEGACY_ID
order by mpi.MPI_LEGACY_ID;

-----------END - LOAN ACCOUNT --
------------CASA ACCOUNT--------------

SELECT IACLINK_ACTUAL_ACNUM, tran_value_date, TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_BRN_CODE, TRAN_DATE_OF_TRAN, TRAN_BATCH_NUMBER
FROM IDCCORE.TRAN2019, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN = '30-DEC-2019'
and TRAN_DATE_OF_TRAN <> tran_value_date
AND IACLINK_ACTUAL_ACNUM NOT IN ( 2478940, 1883303, 2210620 )
and TRAN_TRN_EXT_REF_NUMBER <> '149845';
--group by IACLINK_ACTUAL_ACNUM;


SELECT IACLINK_ACTUAL_ACNUM, count(1) cnt, sum( decode(TRAN_DB_CR_FLG,'C', TRAN_AMOUNT, -TRAN_AMOUNT)) amt
FROM IDCCORE.TRAN2019, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN = '30-DEC-2019'
and TRAN_DATE_OF_TRAN <> tran_value_date
AND IACLINK_ACTUAL_ACNUM NOT IN (1883303,2478940,2210620)
group by IACLINK_ACTUAL_ACNUM
order by IACLINK_ACTUAL_ACNUM;

SELECT CLIENTS_CODE CIF, CLIENTS_NAME CL_NAME, IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR, 
idccore.FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'19-FEB-2020',(select MN_CURR_BUSINESS_DATE 
from idccore.maincont)) CLSBAL, ACNTBAL_AC_BAL curr_bal 
FROM idccore.ACNTS A, idccore.IACLINK, idccore.acntbal, idccore.CLIENTS 
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM and ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM 
AND A.ACNTS_CLIENT_NUM = CLIENTS_CODE
and IACLINK_ACTUAL_ACNUM='2108865';

SELECT
IACLINK_ACTUAL_ACNUM, tran_value_date, TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_BRN_CODE, TRAN_DATE_OF_TRAN, TRAN_BATCH_NUMBER
FROM IDCCORE.TRAN2019, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN = '30-DEC-2019'
and TRAN_DATE_OF_TRAN <> tran_value_date
AND IACLINK_ACTUAL_ACNUM IN ( 1883303 )
order by TRAN_DATE_OF_TRAN;

SELECT count(1) cnt, sum( decode(TRAN_DB_CR_FLG,'C', TRAN_AMOUNT, -TRAN_AMOUNT)) amt
FROM IDCCORE.TRAN2019, IDCCORE.IACLINK
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM
AND TRAN_DATE_OF_TRAN = '30-DEC-2019'
and TRAN_DATE_OF_TRAN <> tran_value_date
AND IACLINK_ACTUAL_ACNUM IN ('1883303');



---------------------LOAN BALANCE---------------
/* wrong query to get balance
SELECT lpad(MPI_LEGACY_ID,17,0), MPI_LEGACY_ID, 
           NVL(mlb_prin_clbal,0)           + NVL(mlb_inst_tax_clbal,0)     + 
       NVL(mlb_inst_ins_clbal,0)       + NVL(mlb_inst_cc_clbal,0)      + 
       NVL(mlb_oth_bkg_fee_clbal,0)    + NVL(mlb_oth_spl_chg_clbal,0)  + 
       NVL(mlb_oth_mm_clbal,0)         + NVL(mlb_oth_adv_emi_clbal,0)  + 
       NVL(mlb_oth_ins_clbal,0)        + NVL(mlb_oth_tax_clbal,0)      + 
       NVL(mlb_oo_non_acc_chg_clbal,0) + NVL(mlb_oo_acc_chg_clbal,0)   + 
       NVL(mlb_oo_tax_clbal,0)         + NVL(mlb_tax1_clbal,0)         + 
       NVL(mlb_tax2_clbal,0)           + NVL(mlb_tax3_clbal,0)         - 
       NVL(mlb_rpa_clbal,0)            + NVL(mlb_latechg_clbal,0)      + 
       NVL(mlb_int_clbal,0)            + NVL(mlb_cap_int_clbal,0)      + 
       NVL(mlb_oth_os_capitalized_clbal,0) Loan_bal 
FROM   lms.m_loan_balance, lms.m_proj_info 
WHERE  mlb_cust_id = mpi_cust_id 
AND    mlb_con_id  = mpi_con_id 
AND    mlb_proj_id = mpi_proj_id 
AND    mlb_tran_dt = (SELECT MAX(mlb_tran_dt) 
                      FROM   lms.m_loan_balance 
                      WHERE  mlb_cust_id = mpi_cust_id 
                      AND    mlb_con_id  = mpi_con_id 
                      AND    mlb_proj_id = mpi_proj_id 
                      AND    mlb_tran_dt <= '10-jan-2020'))a
where a.MPI_LEGACY_ID=lpad(3632709,17,0)*/

--LOAN BALANCE QUERY - CORRECT 1                      
SELECT mpi.MPI_CUST_ID CIF, mpi.MPI_LEGACY_ID ACCT_NO,mpiv.MPF_TOT_OS BAL, G.F_NAME CNAME, MPI_REPMT_CCY CUR
FROM LMS.m_proj_finbal_VIEW mpiv, LMS.M_PROJ_INFO mpi , LMS.gr010mb g
where mpiv.MPF_CUST_ID = mpi.MPI_CUST_ID
and mpiv.MPF_CON_ID = mpi.MPI_CON_ID
and mpiv.MPF_PROJ_ID = mpi.MPI_PROJ_ID
and mpi.MPI_CUST_ID = g.CIF_NO
and mpi.MPI_LEGACY_ID=lpad(4231489,17,0);

--'0000000000139645','00000000002340740','00000000003075712','0000000000684524','0000000000931110'

select * from LMS.m_proj_finbal_VIEW;
select * from LMS.m_proj_info;



-----------------------ACCOUNT BALANCE AS OF DATE------------------------


SELECT CLIENTS_CODE CIF, CLIENTS_NAME CL_NAME, IACLINK_ACTUAL_ACNUM ACC_NO, A.ACNTS_CURR_CODE CUR, a.ACNTS_LAST_TRAN_DATE,ACNTS_CLOSURE_DATE,
idccore.FN_GET_ASON_ACBAL_AC(1,A.ACNTS_INTERNAL_ACNUM,A.ACNTS_CURR_CODE,'18-OCT-2022',(select MN_CURR_BUSINESS_DATE 
from idccore.maincont)) CLSBAL, ACNTBAL_AC_BAL curr_bal 
FROM idccore.ACNTS A, idccore.IACLINK, idccore.acntbal, idccore.CLIENTS 
WHERE A.ACNTS_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=IACLINK_ENTITY_NUM 
and ACNTBAL_ENTITY_NUM=IACLINK_ENTITY_NUM and ACNTBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM 
AND A.ACNTS_CLIENT_NUM = CLIENTS_CODE
and IACLINK_ACTUAL_ACNUM in ('5059186');

select * from idccore.tran2021;


select * from payments.wf110tb where ref_no = 'FCSF231220050077';
select * from payments.if008tb;

select * FROM idccore.ACNTS;
SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,tran_brn_code, tran_batch_number, TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_VALUE_DATE, TRAN_NARR_DTL1, 
to_char(tran_entd_on,'dd-mon-yyyy hh24:mi:ss') 
FROM IDCCORE.TRAN2020, IDCCORE.IACLINK 
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM 
AND TRAN_DATE_OF_TRAN >= '05-FEB-2020'
AND IACLINK_ACTUAL_ACNUM IN (2935307) 
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN;

select * from PAYMENTS.if016tb where ref_no = '5455612020155807';
select * from PAYMENTS.txn_post_history where ref_no = 'AAAAC6BFF020';


select * from idccore.tran2020;
select * from idccore.iaclink;
select * from idccore.jointclientsdtl;



SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,tran_value_date, sum( decode(TRAN_DB_CR_FLG,'C', TRAN_AMOUNT, -TRAN_AMOUNT)) NET_AMOUNT 
FROM IDCCORE.TRAN2020, IDCCORE.IACLINK 
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM 
----AND TRAN_DATE_OF_TRAN BETWEEN '18-AUG-2019' AND '06-DEC-2019' 
----AND TRAN_DATE_OF_TRAN = '06-DEC-2019' 
and TRAN_DATE_OF_TRAN <> tran_value_date 
--AND IACLINK_ACTUAL_ACNUM IN ( 2384563, 372194) 
GROUP BY IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,tran_value_date 
order by TRAN_DATE_OF_TRAN; 







---------------------------customer/account not created due to validation errors--------------------------------------------------------------------- 

SELECT DISTINCT KEY_FIELD1, KEY_FIELD2, KEY_FIELD3, TABLE_NAME, FIELD_NAME 
FROM IDCCORE.PRE_MIG_STAGE_ERR_DTL 
WHERE KEY_FIELD1 IN 
( 
    SELECT DISTINCT TO_NUMBER(ENTITY_NO) 
    FROM ( 
         select TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, ENTITY_NO, 
         SAF_TABLE, 
         NVL((CASE 
           WHEN SAF_TABLE='SAFC' THEN 
                (SELECT TO_CHAR(C.CLIENTS_CODE) 
                FROM CLIENTS C 
                WHERE C.CLIENTS_CODE = TO_NUMBER(ENTITY_NO)) 
           WHEN SAF_TABLE='SAFA' THEN 
                (SELECT I.IACLINK_ACTUAL_ACNUM 
                FROM ACNTS A, IACLINK I 
                WHERE A.ACNTS_INTERNAL_ACNUM=I.IACLINK_INTERNAL_ACNUM AND A.ACNTS_ENTITY_NUM=I.IACLINK_ENTITY_NUM 
                AND I.IACLINK_ACTUAL_ACNUM = TO_NUMBER(ENTITY_NO)) 
         END),'Z') ENTITY_AVAIL 
         from DATA_SYNC.dtsync_status_hist 
         where refresh_type IN ('>C','>M') and status='FAILED' 
         AND SAF_TABLE IN ('SAFC','SAFA') 
         AND ERROR_MSG NOT LIKE '%ORA-29266: end-of-body reached%' 
         AND ERROR_MSG NOT LIKE '%ACCOUNT NUMBER ALREADY MIGRATED%'     
    )     
    WHERE ENTITY_AVAIL = 'Z' 
)     
ORDER BY KEY_FIELD1; 


--------------------------------------------------TO DETECT any failed transaction during synching ---------------------------------------------------------------------------- 

SELECT   TXN_JOURNAL_NUM || '-' || ENTITY_NO || '-' || TOD_DATE || '-' || TOD_TIME LK, H.*   
FROM data_sync.dtsync_status_hist H 
WHERE status='FAILED' AND  refresh_type NOT IN ('AH','AS') AND saf_table='SAFT' 
AND ERROR_MSG NOT LIKE '%Transaction Amount Cannot Be Zero During Addition  Record Num = 1  Record Num = 1  Record Num = 1%' 
AND ERROR_MSG NOT LIKE '%Transaction Not Allowed - Closed Account  Record Num = 1%' 
AND ERROR_MSG NOT LIKE '%ORA-29266: end-of-body reached%' 
AND ERROR_MSG NOT LIKE '%Account Already Closed..%' 
AND ERROR_MSG NOT LIKE '%Application Process Date is greater than System Business Date%' 
AND ERROR_MSG NOT LIKE '%Deposit Already Closed PBDCONTRACT Table%' 
AND ERROR_MSG NOT LIKE '%ACCOUNT NUMBER ALREADY MIGRATED%' 
AND ERROR_MSG NOT LIKE '%No Open Deposit Contract Found for Ac%' 
ORDER BY TOD_DATE, TOD_TIME, ENTITY_NO; 


--monitor payment requet txn
select ref_no, req_date_time, err_cd, err_desc, res_date_time, br_cd, teller_id
from payments.if016tb where trunc(req_date_time) >= '16-DEC-19' and Ref_no is not null 

order by req_date_time;

select * from PAYMENTS.txn_post_errors where val_dt = '16-DEC-19';
select * from DFCORE.od_txn_master where od_ref_no = 'AAAAC2272420';

select * from PAYMENTS.wf110tb where ref_no = 'AAAAC2272420';
select * from PAYMENTS.txn_post_errors where ref_no = '5454013129113128';
select * from payments.txn_post_history where ref_no = '5454013129113128';
select * from CASHCORE.ps080tb where ref_no = '5451912110438998';

select * from PAYMENTS.wf110tb where ref_no = 'AAAABD5FF119';
select * from PAYMENTS.txn_post_errors where ref_no = 'AAAABD5FF119';

select * from CASHCORE.ps080tb where ref_no = '5453913129160043';
select * from payments.if016tb where ref_no = 'AAAAC2272420';

select * from CASHCORE.ps080tb where ref_no = '5451912110437944';

--**********************************************
--****** CHECK ACCOUNT BALANCE-----------
--**********************************************
select b.iaclink_actual_acnum ,a.*
from IDCCORE.acntbal a
left join IDCCORE.iaclink b on a.acntbal_internal_acnum = b.iaclink_internal_acnum
where b.iaclink_actual_acnum = '3536822';

select * from cashcore.ps080tb where ref_no = '5456409129161845';
select * from payments.txn_post_staging where ref_no = '5456409129161845';


select * from data_sync.dtsync_status_hist where ENTITY_NO in ('00000000001994625','00000000004147665') and tod_date='20191212' 
order by ENTITY_NO, tod_time; 

SELECT * FROM data_sync.dtsync_status_hist 
WHERE ENTITY_NO = '00000000001994625' AND TOD_DATE='20191212' AND TOD_TIME='08580973';


select * from PAYMENTS.txn_post_history;
select * from idccore.iaclink where iaclink_actual_acnum = '4191193';
select * from PAYMENTS.IF012TB ;
---standing instruction detail
select * from payments.Bl100tb where bl_insrefno = 'BLSF011020034986';
select * from payments.bl100tb where src_ac_no = '707064';
select * from PAYMENTS.BL100HB;
select * from PAYMENTS.TXN_POST_HISTORY where ref_no = 'BLSF210920032239';
select * from PAYMENTS.BL100TB where SRC_AC_NO = '4190451';
select * from PAYMENTS.BL010MB;
select * from PAYMENTS.BL010hb;
select * from payments.MC014TB where ORD_CUST_DET like '%%';
select * from payments.GL001MB;
select * from payments.CA840PB where mod_cd = 'BL';
select * from payments.BL020mb;
select * from payments.if001tb where ref_no = 'AAAB0072AD';
select * from PAYMENTS.PS029MB;
select * from PAYMENTS.BL010TB;
select * from payments.bl100hb where BL_INSREFNO in ('BT2006170003241');
select * from payments.bl100hb where BL_INSREFNO in ('BT2006170003241');
select * from PAYMENTS.if001tb where ref_no = 'BT20072900003541';
select * from PAYMENTS.TXN_POST_HISTORY where ref_no = 'BT20072900003541';
select * from DFCORE.OD_TXN_MASTER where OD_REF_NO ='AAAAF7EE8920';
select * from PAYMENTS.IF012TB;
select * from payments.if008tb where sw_ref_no = 'S060248079D501';
select * from payments.if008tb where trunc(MSG_RECV_DATE) = '07-SEP-20' and mess_type in ('103','202');
select * from DFCORE.TRANSACTION_DETAILS;
select * from PAYMENTS.TXN_POST_STAGING;
select to_char(OD_MAKER_DATE, 'dd-mon-rr hh:mi:ss') from DFCORE.OD_TXN_MASTER where OD_REF_NO ='AAAAF7E49C20';

select * from PAYMENTS.bl100tb;
select * from payments.mc014tb;
select * from PAYMENTS.if001tb where ref_no like '?AO20191126000781';
select * from PAYMENTS.if016tb where ref_no = 'A2SF090620019665';
select * from PAYMENTS.txn_post_history where ref_no = '?AO20191126000781';
/*
wf110tb 
wf120tb 
wf130tb 
bl010tb */


-------check IFT file generated or not
--payments.em301tb
-- payments.em300tb

select to_char(MSG_PROCESSED_TIME, 'DD-MON-RR HH24:MI:SS'), s_flg ,user_refno from PAYMENTS.em300tb where user_refno in ('5456207060113618','5456408060103345');
select * from PAYMENTS.if016tb where ref_no = '5452007100751710';
select * from PAYMENTS.wf110tb where ref_no = '5452007100751710';
select * from PAYMENTS.em300tb where user_refno in ('5452010280876042');
select * from PAYMENTS.txn_post_history where ref_no in ('5456207060113618','5456408060103345');
select * from PAYMENTS.if016tb where ref_no in ('5456207060113618','5456408060103345');
select * from PAYMENTS.if016tb where ref_no = '5456310010100629';
select * from PAYMENTS.wf110tb where ref_no = '5452423010110051';
select * from payments.em301tb where APP_SRNO like '0501210000035625';
select * from payments.em301tb where MSG_LINE like ':56%';
select * from payments.if016tb where ref_no = 'AAAAB4536D20';
select * from PAYMENTS.IF008TB;
select * from payments.txn_post_history where ref_no = '5452423010110051';







select ref_no, txn_type, val_dt, status, col_3 amt, host_err_code, host_err_text, txn_posted_by, host_txn_type from PAYMENTS.txn_post_errors where ref_no = 'FCSF030120013564'
select to_char(auth_dt, 'DD-MON-YYYY HH:MI:SS') dd from PAYMENTS.em300tb where user_refno in ('FCSF261219013240');


1883303
select * from DFCORE.od_txn_master where od_ref_no = 'AAAABE02DE19';
select * from PAYMENTS.if016tb where ref_no = 'AAAABF2ADE19';
select * from PAYMENTS.txn_post_history where ref_no = 'AAAABDE88619'

select * from PAYMENTS.em301tb where app_srno in ('3012190000004219')

select * from PAYMENTS.wf110tb where ref_no = 'AAAAB9447719';
select * from DFCORE.od_txn_master where od_Ref_no = '5458426119113337';
select * from DFCORE.vw_transfers_tran_dtls_report where reference_number = 'AAAAB9447719'
select * from DFCORE.od_txn_master_hb where od_ref_no = 'AAAAB9447719';
select * from DFCORE.od_txn_field_details_mb
select * from PAYMENTS.if001tb where ref_no = '5453913129160043';
select * from CASHCORE.ps080tb where ref_no = '5453913129160043';
select * from PAYMENTS.txn_post_errors where ref_no = '5453913129160043';

 

select * from PAYMENTS.wf110tb 
where ref_no in (
select ref_no from CASHCORE.ps080tb where file_ref_no = '5457615119091322'
    and ref_no not in (
    select ref_no from PAYMENTS.txn_post_history 
    ))
;

select * from cashcore.omni_acnt;

select * from CASHCORE.file_mst_pay where file_reference_no in ('5455708119121815');
select ref_no, res_date_time, err_desc from PAYMENTS.if016tb where ref_no in ('5452330030154737', '5458730030154650','5459930030154230');
select * from DFCORE.od_users_mb;
select * from ARX.tb_arm_user_master where user_login like '%Proeun%';
select * from PAYMENTS.IF008TB where REQ_LOG_2 like '%S0602651087701%';
select * from cashcore.wf110tb;

select * from cbx.VW_GLOBAL_BNK_LCL_BNK_BRCH_MST;
select * from PAYMENTS.PS030MB;

select * from payments.wf110tb;

select * from payments.wf110tb where ref_no = '5456822090095419';
select * from CASHCORE.PS082TB  where ref_no = '5456028071065422';
select * from PAYMENTS.if001tb where ref_no = '5451202100221108';
select * from PAYMENTS.if016tb where ref_no = 'AAAAE13EC520';
select * from ARX.tb_arx_user_otp where MOBILE_NUMBER in ('6282232848120') order by OTP_GENERATED_TIME desc;
select * from ARX.tb_arx_user_otp where MOBILE_NUMBER in ('85587376052','85568999917');
select * from ARX.tb_arx_user_otp  order by OTP_GENERATED_TIME desc;


select * from arx.tb_arx_user_otp where MOBILE_NUMBER like '85578811772' order by OTP_GENERATED_TIME desc;
select * from arx.tb_arx_user_otp_history where MOBILE_NUMBER like '85578811772' order by OTP_GENERATED_TIME desc;
select * from arx.tb_arx_user_otp_history where MOBILE_NUMBER like '85578811772' order by OTP_GENERATED_TIME desc;
select * from dfcore.od_txn_
select * from ARX.tb_arx_user_otp where user_login='100389358' order by OTP_GENERATED_TIME desc;
select * from cbx.od_users_mb;
select * from cbx.iban

select ID, USER_LOGIN, OTP_STATUS, EMAIL_ID, MOBILE_NUMBER, REQUEST_TYPE, OTP_GENERATED_TIME, OTP_UPDATED_TIME
from arx.tb_arx_user_otp_history 
where MOBILE_NUMBER like '65%'
and trunc(OTP_GENERATED_TIME) between '01-DEC-22' and '31-DEC-22';

select ID, USER_LOGIN, OTP_STATUS, EMAIL_ID, MOBILE_NUMBER, REQUEST_TYPE, OTP_GENERATED_TIME, OTP_UPDATED_TIME
from arx.tb_arx_user_otp 
where MOBILE_NUMBER like '65%'
and trunc(OTP_GENERATED_TIME) between '01-DEC-22' and '31-DEC-22';

truncate table ARX.tb_arx_user_otp;



select * from ARX.tb_arx_user_otp where mobile_number = '66813757465';
select * from cashcore.omni_acnt;

[4:54 PM] Sokuntheary Has
    
66813757465


select * from payments.fx
select * from payments.if001tb;
select * from arx.tb_arm_user_master;
select * from payments.wf110tb;
select * from dfcore.OD_PAY_CCY_MATRIX;
select * from payments.ps029mb;

select * from PAYMENTS.IF016TB where ref_no = '5457413071120642';

[11:39 AM] Phyrun Heng
    
4184017

CHANTAEA



select * from ARX.TB_ARX_USER_OTP_HISTORY where OTP_REFERENCE = '3580316';
select * from CBX.BENE_AUDIT_TABLE;
select * from PAYMENTS.STP_TIME_WINDOW_MASTER;
select * from ARX.TB_ARX_USER_OTP_HISTORY;
select * from IDCCORE.HOLLIST where HOLLIST_AUTH_ON = '11-DEC-19';
select * from PAYMENTS.PS029MB where swift_code = 'HEBACY2NXXX';
select * from CBX.BANK_OFFERED_PRODUCTS_MAPPING;
select * from PAYMENTS.PS028MB;

select a.* from (
select user_login, otp_reference, otp_status, INVALID_ATTEMPT, mobile_number, request_type, otp_generated_time, otp_updated_time 
from ARX.tb_arx_user_otp
union all
select user_login, otp_reference, otp_status, INVALID_ATTEMPT, mobile_number, request_type, otp_generated_time, otp_updated_time 
from ARX.tb_arx_user_otp_history) a
where a.user_login = '100131625';
order by otp_generated_time;
select * from ARX.tb_arx_user_otp_history where mobile_number = '85588243945' order by otp_generated_time desc;

select * from ARX.tb_arx_user_otp_history where user_login = '100245930';
select * from DFCORE.od_users_mb;
select * from CBX.od_users_mb
select a.user_login, b.od_login_id, b.first_name || '-' || b.last_name full_name, a.otp_reference, c.gcif, c.global_cif_name ,a.otp_status, a.mobile_number, a.otp_updated_time 
from ARX.tb_arx_user_otp_history a
    left join CBX.od_users_mb b on a.user_login = b.od_user_no
    left join (select distinct gcif, global_cif_name from CBX.gcif_details) c on b.od_gcif = c.gcif
where a.otp_reference in ('79452052','97656398','55170442','48661774','10343141','95950501','79452052');

select * from CBX.gcif_details

select * from ARX.tb_arx_user_otp_history where user_login = '100169643';
select * from ARX.tb_arx_user_otp;

select * from IDCCORE.addrdtls where addrdtls_source_key = '100074897';
select * from cashcore.ps080tb where ref_no = '5451819020162443'


select user_login, otp_reference, otp_status, email_id, mobile_number, request_type, otp_generated_time 
from ARX.tb_arx_user_otp_history 
where OTP_REFERENCE = '18064280';
select * from ARX.tb_arx_user_otp_history;

select * from ARX.tb_arx_user_otp where mobile_number = '85512313898' order by OTP_GENERATED_TIME desc;
select * from ARX.tb_arx_user_otp where aws_response like '%33643970-e5d3-5385-9c6c-6e232503c519%';
select * from ARX.tb_arx_user_otp_history where  mobile_number = '85512313898' order by OTP_GENERATED_TIME desc;
select * from ARX.tb_arx_user_otp_history where aws_response like '%8adf7e3d-2cfc-5975-97d7-296e1bde81ee%';
select * from dfcore.customer_info where customer_number = 'incorrectly';


select * from PAYMENTS.txn_post_history where ref_no in ('5458426119113337');
select * from PAYMENTS.txn_post_errors where ref_no in ('5458426119113337');
select * from payments.if001tb where ref_no in ('5458426119113337');
select * from IDCCORE.acntbal;
select * from IDCCORE.acnts;
select * from DFCORE.accounts_txn_mt;
select * from PAYMENTS.wf110tb where ref_no = '5458426119113337'
select * from PAYMENTS.txn_post_history where ref_no = '5458426119113337';
select * from CBX.od_txn_master where od_ref_no = '5458426119113337'; 
select * from cbx.od_txn_master_hb where od_ref_no = '5458426119113337'; 
select * from CASHCORE.accounting_staging_internal where reference = '5458426119113337';
select count(*) from CASHCORE.accounting_staging_internal where status='O' ;
and value_date like '%25%';

select * from CASHCORE.ps080tb where ref_no in ('5458426119113337');
select * from CASHCORE.file_mst_pay where file_reference_no = '5454029109152645';
select * from CASHCORE.lot_details;
select * from PAYMENTS.wf110tb where ref_no in ('FCSF110920021208');
select * 
select * from DFCORE.od_txn_master where od_ref_no in ('5458426119113337');
select * from cbx.locale_key_value;
select * from cashcore.ps080tb;

select * from PAYMENTS.wf_user_lock where ref_no = '5454026024174022';
delete from PAYMENTS.wf_user_lock;



select * from CASHCORE.account_master where cif = '100001431';
select * from CASHCOREMIG.account_master where cif = '100001431';
select * from CASHCORE.account_master where ac_no like '%100001431%';
select * from CASHCORE.audit_mt940;
select * from CASHCORE.customer_master3 where cif like '%100205606%';
select * from CASHCORE.error_log_table where err_msg like '%121627%';
select * from cashcore.error_log_table where err_dt = '30-AUG-19';
select * from PAYMENTS.account_master where cif = '100176038'; 
select * from PAYMENTS.account_type_master;
SELECT * FROM CASHCORE.account_master WHERE CIF = '100215076';
select * from CASHCORE.accounting_staging_internal where account_no = '3242528';
select * from payments.DFT_OUTWARD where ref_no = '5456802099140215';
SELECT * FROM IDCCORE.acntstmt WHERE acnt_internal_acnum = '0030000000000347866';
SELECT * FROM CASHCORE.account_master WHERE cif = '100215076';
SELECT * FROM IDCCORE.acntbal WHERE acntbal_internal_acnum = '';


--Check Trade/Payment SOD/BOD date
select * from DATA_SYNC.dtsync_status_hist where refresh_type = 'EE' order by tod_date desc; -- EOD sync
select * from DATA_SYNC.dtsync_status_hist where refresh_type = 'SS' order by tod_date desc; --SOD sync
select * from IDCCORE.maincont;
SELECT PROC_NAME,DSS_URL FROM data_sync.DTSYNC_SP_MAINT WHERE  EVENT_TAB='FILE_EOD';
SELECT * FROM data_sync.DTSYNC_SP_MAINT WHERE  EVENT_TAB='FILE_EOD';
select * from DATA_SYNC.dtsync_status_hist where tod_date = '20200801' order by tod_time desc;
select count(1) from DATA_SYNC.dtsync_queue_job_tb;
SELECT * FROM idccore.EODSOD_CNTRL_JTR WHERE ES_CNTL_DATE='04-NOV-2019';





--CHECK CUSTOMER TYPE IN IDC
SELECT * FROM IDCCORE.indclients ;
SELECT * FROM IDCCORE.corpclients
SELECT * FROM IDCCORE.clients WHERE CLIENTS_CODE = '100017759';

select * from CASHCORE.txn_mst_pay;

--Bank Swift Code
--Ps029mb,ps030mb
select BANK_DESC, ADDRESS1, ADDRESS2, LOCATION, COUNTRY, SWIFT_CODE from PAYMENTS.ps029mb where swift_code like '%HSBCHKH0XXX%';

select * from PAYMENTS.ps029mb where swift_code like '%BBRUBEBBXXX%';
select * from payments.ps030mb where swift_code = 'TCABKHPP0XXX';
select * from payments.ps029mb where bank_desc like '%CROWN%'

--CBX CHECK
select * from CBX.cust_info;
select * from CASHCORE.account_master where ac_no like '%174759';
select * from CBX.mobile_update_temp where phone like '%906310768';
select * from CBX.od_account_master where od_gcif = '100176038';
select * from CBX.od_audit where od_gcif = '100154866'; -- CBX login audit - can check GCIF
select * from CBX.od_audit where user_no = '202431028043';
select * from cbx.od_users_mb where od_user_no='202431028043';
select audit_id, od_login_id, od_gcif,browser_name, od_cif, audit_date
from CBX.od_audit where od_login_id = 'VOUSRESRE';
select * from cbx.od_audit where reference = '5452109270005917';
select * from cashcore.file_mst_pay where FILE_REFERENCE_NO = '5452109270005917';
select * from cbx.

select * from CASHCORE.txn_error_pay where txn_id = '5456111099150832';-- check payment upload fail
select * from CASHCORE.txn_audit_pay where txn_id = '5456111099150832';
select * from CASHCORE.txn_mst_pay where txn_id = '5455715119114112';
select * from CASHCORE.paymnts_batch_details where file_reference_no = '5458511099171849';
select * from CASHCORE.account_master WHERE AC_NO = '3609804';
Select * from CBX.OD_PENDING_ALRT_MAIL where OD_REF_BATCH_NO = '200909093147874';  --check email has sent or not
select * from CBX.OD_PENDING_MAIL where OD_REF_ID = '200909093147874';
select * from CBX.AUDIT_MASTER;

select * from DATA_SYNC.saft;
select od_Ref_no, od_maker_date, cbx.od_txn_master.od_auth_date, od_value_date, od_Ref_no  from cbx.od_txn_master where od_ref_no in ('5456117109104834');
select dr_acc, dr_acc_ccy, dr_amount, cr_acc, cr_acc_ccy, cr_amount, ref_no, txn_dt, value_dt, ben_cust_acc, ben_cust_details, ben_bank_cd, debit_narrat, credit_narrat 
from CASHCORE.ps080tb where ref_no in  ('5451409109103349');

--BILL PAYMENT
select * from cashcore.ps082tb where ref_no='5457407050102128';
select * from cashcore.ps080tb where ref_no = '5457407050102128';
select * from PAYMENTS.bl050pb where bl_util_code='FVDUP';
select * from PAYMENTS.bl050pb;

--CBX Single TXN
select * from CBX.od_txn_master where OD_REF_no in  ('5456713010120454');
select * from CASHCORE.ps082tb where ref_no in  ('5451524129151016');
select dr_acc, dr_amount, ref_no, ben_cust_acc, ben_bank_cd from CASHCORE.ps080tb where ref_no in  ('5456614119141752');
select to_char(od_au, 'DD-MON-RR HH:MI:SS') select * from cashcore.ps080tb where ref_no in ('5451524129151016');
select acnts_curr_code, acnts_client_num, acnts_last_mod_on, acnts_ac_name1, iaclink_actual_acnum from IDCCORE.omni_acnt where iaclink_actual_acnum in ('1749527','1749538') -- check account status
select * from IDCCORE.omni_acnt where iaclink_actual_acnum in ('1749527','1749561') -- check account status;
select * from CBX.account_master where ac_no in ('1749561','1749538')
select * from CASHCORE.accounting_staging_internal where reference in  ('5457525119141029','5451625119140505');
select * from PAYMENTS.if001tb where ref_no in  ('5457525119141029','5451625119140505');
select * from PAYMENTS.wf110tb where ref_no in ('5451524129151016');
select * from PAYMENTS.txn_post_history where ref_no in ('5456614119141752');
select * from PAYMENTS.txn_post_errors where ref_no in ('5451625119140505');
select * from cbx.od_txn_master_hb  where OD_REF_no in  ('5451625119140505');;
select * from cashcore.omni_acnt;

select * from IDCCORE.acnts where acnts_account_number like '%2599840%';
select * from CASHCORE.file_mst_pay where file_reference_no = '5455815119095640';

select * from CASHCORE.file_mst_pay  order by maker_dat desc;
select * from cashcore.file_mst_pay where file_reference_no = '545860111913262'
select * from CASHCORE.accounting_staging_internal where reference = '545860111913262';
select * from CASHCORE.txn_mst_pay where file_reference_no = '545860111913262';
select * from PAYMENTS.wf110tb where ref_no = '545860111913262';
select * from cashcore.file_mst_pay where upload_file_name like '%Oska%';
select * from cashcore.file_mst_pay where file_reference_no = '5455708119121815';
select * from cashcore.ps080tb where file_ref_no = '5455708119121815' where file_reference_no 
--
select * from CASHCORE.ps080tb where file_ref_no
in ('5455208119095546');


select * from cashcore.file_mst_pay where file_status_cd = 'PROSSD' and to_date(maker_dat, 'DD-MON-RR') = '08-NOV-19'


--CBX File upload
SELECT * FROM cbx.od_txn_master WHERE od_ref_no in  ('5459814119171931')
select * from cbx.od_txn_master where od_gcif = '100004947';
select * from CASHCORE.ps080tb where ref_no in ('5458625109112428')
SELECT * FROM cashcore.ps080tb WHERE file_ref_no in  ('5455715119114112');
select * from cashcore.ps080tb where cr_acc like '4189752'
SELECT * FROM CASHCORE.accounting_staging_internal WHERE REFERENCE in  ('5459814119171931')
select * from CASHCORE.txn_mst_pay where txn_id = '5459814119171931';
SELECT * FROM CASHCORE.FILE_MST_PAY WHERE FILE_REFERENCE_NO in ('5459515119151347'
SELECT * FROM CASHCORE.FILE_ERROR_PAY WHERE FILEID_CD in  ('5459530109150204', '5457130109150032','5456630109145455');
SELECT * FROM CASHCORE.TXN_MST_PAY WHERE file_reference_no = '5453315119100033';
select * from cashcore.txn_mst_pay where txn_id in   ('5453315119100033')
SELECT * FROM CASHCORE.TXN_ERROR_PAY WHERE TXN_ID='5453315119100033';
SELECT * FROM PAYMENTS.IF001TB WHERE REF_NO in   ('5453315119100033')
SELECT * FROM payments.wf110tb WHERE ref_no  in  ('5451911150404799');
SELECT * FROM PAYMENTS.TXN_POST_HISTORY WHERE REF_NO in  ('5453315119100033');
SELECT * FROM PAYMENTS.TXN_POST_ERRORS WHERE REF_NO in  ('5459625109111110');


select * from cashcore.file_mst_pay

select * from ARX.tb_arm_app_config where cnfg_name like 'OTP_VALIDITY';
select * from PAYMENTS.txn_post_history;


select * from CBX.od_portal_acct_master where od_acc_no = '158228';
select * from CASHCORE.account_master where ac_no = '158228';
select * from CBX.audit_data_master where event_id = '11044';
select * from cbx.OD_PORTAL_ACCT_MASTER; -- store all account
select * from CBX.OD_TXN_MASTER_HB where od_gcif = '100176038';
select * from CBX.od_txn_master where od_gcif = '100176038';
select * from cbx.OD_ACCOUNT_MASTER where od_gcif = '100187377';
select * from cbx.OD_USER_CHANNEL_MB;

select * from DFCORE.ACCOUNT_MASTER where LEGACY_AC='3912083';
select customer_number, mobile_no, cust_full_name, dob,  cust_status, gender, email_id, first_name, cust_mod_date
select * from dfcore.customer_info where customer_number = '100039351'
select * from dfcore.customer_info where mobile_no = '85589555789';
select * from IDCCORE.cor
select * from DATA_SYNC.safa_customer_check where customer_no like '100000012';

--RBX CHECK
select * from dfcore.customer_info where customer_number in ('100151168');
select * from dfcore.account_info where acc_no = '44648416';
select * from DFCORE.od_users_mb where od_user_no = '100159655';
select * from arx.tb_arm_user_master where user_login = '60334604';
select * from dfcore.customer_master where cif = '100009910';

SELECT * FROM USER_SOURCE WHERE TEXT LIKE '%EPICPA%';



select --a.audit_date, a.USER_NO, a.REFERENCE, a.REFERENCE_KEY,a.WIDGET_ID, b.event_desc, b.action
a.*, b.action
from dfcore.od_audit a
left join DFCORE.event_master b on a.event_id = b.event_id
where USER_NO='100127442';
where audit_date between '24-FEB-23 11.00.00.660962000 AM' and '24-FEB-23 05.35.34.334036000 PM';
select count(distinct USER_NO) from (
select user_no, count(*) ct from dfcore.od_audit where audit_date between '24-FEB-23 11.40.00.660962000 AM' and '24-FEB-23 05.35.34.334036000 PM' group by USER_NO)  ;

select AUDIT_DATE, REFERENCE, ACTION, REFERENCE_KEY, WIDGET_ID from 
select AUDIT_DATE, REFERENCE, ACTION, REFERENCE_KEY, WIDGET_ID  ,USER_NO
from dfcore.od_audit a
left join DFCORE.event_master b on a.event_id = b.event_id
where a.USER_NO = '100026897';
select * from idccore.omni_acnt;
select * from dfcore.account_info;




select a.AUDIT_DATE, a.od_login_id, a.USER_NO ,b.event_desc, b.action, a.reference, a.OD_GCIF, b.EVENT_TITLE
from cbx.od_audit a
left join cbx.event_master b on a.event_id = b.event_id
where a.USER_NO='202431028043';

select a.AUDIT_DATE, a.od_login_id, a.USER_NO ,b.event_desc, b.action, a.reference, a.OD_GCIF, b.EVENT_TITLE
from cbx.od_audit a
left join cbx.event_master b on a.event_id = b.event_id
where a.od_login_id='SOPHANSCG'
order by a.AUDIT_DATE desc;

and trunc(AUDIT_DATE)='28-FEB-23';
select * from cbx.od_audit where user_no='450';
select * from cbx.event_master;

select * from cbx.od_audit where user_no='202027005885';
select * from cbx.od_audit where reference = '5456724041214457';

--AAAB308D0821

select a.audit_date, a.od_login_id, a.reference, b.event_desc, b.action
from dfcore.od_audit a
left join DFCORE.event_master b on a.event_id = b.event_id
where od_login_id = '97864803';
select * from dfcore.od_audit;

select * from dfcore.od_audit where reference = 'AAAB308D0821';

select * from PAYMENTS.OD_PENDING_MAIL where APPLICATION_ID = 'CBX';
select * from CBX.OD_PENDING_ALRT_MAIL where od_gcif = '100045007';

select * from dfcore.od_audit where user_no = '28335814';
select * from dfcore.od_audit;
100216645
28335814
select to_char(maker_date, 'DD-MON-RR HH24:MI:SS') from DFCORE.od_users_mb where od_user_no = '100216645';
select * from DFCORE.od_users_mb where od_user_no = '100216645';
select * from ARX.tb_arm_user_master;

select * from DATA_SYNC.dtsync_audit_log where log_key like '%100188723%'

select * from dfcore.customer_info where customer_number = '100188723';
select * from dfcore.od_users_mb where od_login_id = '72717433';
select * from DFCORE.od_users_mb where od_user_no = '100028119';
select * from ARX.tb_arm_user_master where user_login = '100188723';
select * from idccore.addrdtls where addrdtls_source_key='100007689'; -- phone no for registering -column addrdtls_mobile_num
select * from IDCCORE.indclients;
select * from arx.tb_arm_user_master where USER_LOGIN IN ('450','202209022182');
SELECT * FROM CBX.OD_USERS_MB WHERE OD_USER_NO IN ('202431028043');
SELECT * FROM CBX.OD_USERS_hb WHERE OD_USER_NO IN ('202431028043');
select * from arx.tb_arm_user_master where user_login='202431028043';


select * from arx.tb_arx_user_otp_history where user_login='202431028043';
select * from ARX.tb_arx_user_otp order by OTP_GENERATED_TIME desc;
select * from payments.od_pending_mail order by OD_DATE desc;

select * from dfcore.od_users_mb;
select * from idccore.clients;
select * from arx.od_audit where od_gcif='100166689';
select * from idccore.acntlink where acntlink_cif_number = '100000043'; --account linkage
select * from IDCCORE.auditlog where gcif = '100174436';

select * from IDCCORE.acnts where acnts_client_num = '158228';
select * from DFCORE.oo_bene_prod_bank_map_mt;
--CHECK DIGITAL FACE ISSUE

select * from DFCORE.login_stat_error;
select * from dfcore.customer_master where CIF='100188723';
select * from IDCCORE.acntstmt where cif = '100003112';
select * from DFCORE.bene_maint_mt where cif = '100007389';
select * from DFCORE.transfers_txn_ht where created_by = '100007389';
select * from DFCORE.transfers_txn_mt where created_by = '100007389';


select * from DFCORE.accounts_txn_mt where ref_no = 'AAAAAFOC2919';
select * from IDCCORE.acntbal where acntbal_internal_acnum like '%158228';
select * from CBX.od_user_profile_mb where od_login_id = 'SEYSOKSCG';
select * from CBX.od_account_master where od_gcif like '100002902';
select * from idccore.TRANADDINFO2020;

SELECT COUNT(1)
select * 
FROM idccore.TRANADDINFO2021
WHERE INSTR(TRANAI_NARR_DTL1,CHR(25),1) > 0  AND TRANAI_BATCH_SL_NUM=1 AND TRANAI_ENTITY_NUM=1;


--TRANSACTION ACCOUNT STATEMENT
SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,TRAN_VALUE_DATE,TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_NARR_DTL1, TRAN_NARR_DTL2, TRAN_NARR_DTL3, to_char(tran_entd_on,'dd-mon-yyyy hh24:mi:ss') trm_dt
FROM IDCCORE.TRAN2021, IDCCORE.IACLINK 
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM 
AND trunc(TRAN_DATE_OF_TRAN) BETWEEN '01-DEC-2021' AND '31-DEC-2021' 
AND IACLINK_ACTUAL_ACNUM IN ( 3668781  ) ;


union all
SELECT IACLINK_ACTUAL_ACNUM, TRAN_DATE_OF_TRAN,TRAN_VALUE_DATE,TRAN_DB_CR_FLG, TRAN_AMOUNT, TRAN_NARR_DTL1, TRAN_NARR_DTL2, TRAN_NARR_DTL3, to_char(tran_entd_on,'dd-mon-yyyy hh24:mi:ss') trm_dt
FROM IDCCORE.TRAN2020, IDCCORE.IACLINK 
WHERE TRAN_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=TRAN_ENTITY_NUM 
AND trunc(TRAN_DATE_OF_TRAN) BETWEEN '01-JAN-2020' AND '09-FEB-2021' 
AND IACLINK_ACTUAL_ACNUM IN ( 654135  ) 
ORDER BY IACLINK_ACTUAL_ACNUM,TRAN_DATE_OF_TRAN; 

select * from PAYMENTS.WF110TB where ref_no = 'FCSF141220041595';


1050494
select * from cashcore.ps080tb where ref_no = '5452005250693935'; 

SELECT IACLINK_ACTUAL_ACNUM, ACNTBBAL_AC_OPNG_DB_SUM , ACNTBBAL_AC_OPNG_CR_SUM, ACNTBBAL_BC_OPNG_DB_SUM, ACNTBBAL_BC_OPNG_CR_SUM
FROM IDCCORE.ACNTBBAL, IDCCORE.IACLINK 
WHERE ACNTBBAL_INTERNAL_ACNUM=IACLINK_INTERNAL_ACNUM AND IACLINK_ENTITY_NUM=ACNTBBAL_ENTITY_NUM
AND IACLINK_ACTUAL_ACNUM IN ( 142376)
AND ACNTBBAL_YEAR=2020 AND ACNTBBAL_MONTH=5 AND ACNTBBAL_ENTITY_NUM=1;


select * from IDCCORE.TRAN2020;

select * from DATA_SYNC.dtsync_status_hist where entity_no like '00000000000142376' and tod_date = '20200601';
--Payment engine
select * from PAYMENTS.txn_post_errors where ref_no = '5455209099190006';
select cif_no, ref_no, val_dt, txn_posted_on, col_26 NARATIVE, col_14 AMT, col_15 CCY
from PAYMENTS.txn_post_history 
where ref_no = 'AAAAB45B3119';

--payment entries
select * from PAYMENTS.ca080tb where ref_no = 'AAAAB45B3119';
select * from PAYMENTS.txn_post_errors; -- txn error detail
select * from PAYMENTS.ps015tb where seq_no = 'FCSF110324282224'; -- txn entries summary
select * from PAYMENTS.ps013tb where txn_ref_no = 'AAAAB45B3119'; -- txn entries detail
select * from PAYMENTS.mc011tb where app_srno = 'AAAAB45B3119';-- txn msg detail

--TRANSFER ENTRY
select * from PAYMENTS.txn_post_history where ref_no in ('AAAAB45B3119');
select * from PAYMENTS.txn_post_errors where col_7 = '2153716';
select * from PAYMENTS.txn_post_errors where ref_no = 'AAAAB45B3119';
select * from PAYMENTS.txn_post_staging_trade where ref_no = '5452908109140208';
select * from PAYMENTS.txn_post_staging where ref_no = 'AAAAB3DB7C19';
select * from DFCORE.transfers_txn_ht where ref_no = 'AAAAB3996E19';
select * from DFCORE.transfers_txn_mt where cif = '100028096'
SELECT * FROM PAYMENTS.txn_post_history WHERE col_7 = '2153716'
select * from PAYMENTS.dft_outward_backup where serial_no = '5459412099110502';
select * from PAYMENTS.account_master where legacy_ac = '2481679';

--RBX & CBX USER REGISRATION
select * from dfcore.od_users_mb where od_user_no = '100051183'
select * from DFCORE.orbiibs_nickname;
select * from DFCORE.orbiibs_user_attribute where user_no = 'od_login_id';
select * from IDCCORE.clients ;
select * from DFCORE.od_user_roles_map_mb;
select * from DFCORE.od_users_mb where od_login_id = '26453631';
select * from dfcore.od_users_mb where od_login_id = '26453631'
select * from dfcore.customer_info where customer_number = '100185363';
SELECT * FROM ARX.tb_arm_user_master where user_login in ('100004859', '100185363');
--update 

--85512410166
-------

select * from DATA_SYNC.safa where customer_no = '100011495';
select * from dfcore.customer_info


--DATA SYNC
select * from DATA_SYNC.dtsync_audit_log where log_key like '%100009910%';
select * from DATA_SYNC.dtsync_sp_maint;
select * from data_sync.safa
select * from DATA_SYNC.dtsync_status_hist where entity_no like '%100009910%';
select * from data_sync.pre_mig_state_err_count
select * from DATA_SYNC.dtsync_status_hist where status = 'FAILED';

select * from idccore.safa where acct_no like '%390271%';
select * from IDCCORE.acntbal


select * from DATA_SYNC.SAFC;
select * from DATA_SYNC.safa where acct_no = '2220707';
SE
safc
sweta
safa;

select * from IDCCORE.safc where cust_no like '%10003090%';
select to_char(audit_date, 'dd-mon-rr hh24:mi:ss') from cbx.od_audit where reference = '5451631120151239';
--CBX User Login Audit
select a.event_id,to_char(audit_date,'dd-MON-yyyy HH:MI:SS'), reference ,od_login_id, c.user_name ,od_cif, event_desc,action 
from cbx.od_audit a
left join cbx.event_master b on a.event_id=b.event_id
left join ARX.tb_arm_user_master c on a.od_login_id = c.user_login
where --audit_date between '19-AUG-19' and '05-SEP-19' 
--audit_date like '%04-SEP-19%' 
  -- reference = '5459828070084729'
-- a.od_login_id = 'WALSSCRY'
 od_gcif = '100218382'
order by audit_date desc,2; 

select * from CBX.od_users_mb;


select b.event_desc, b.action,a.*
from CBX.od_audit a
left join cbx.event_master b on a.event_id = b.event_id
where reference in ('5459828070084729');

select * from CBX.entitled_record_maintenance;

select * from CBX.od_txn_master where od_ref_no = '5459828070084729';
select * from CBX.od_account_master;
select * from CBX.od_account_master_wb;
select * from cbx.OD_PORTAL_ACCT_MASTER_VW;

select * from CBX.od_audit where od_gcif = '100218382';

--dormant account in IDC
select * from ARX.tb_arm_user_master;
select * from idccore.acntstatus;
select ACNTS_INOP_ACNT from idccore.acnts;
select * from idccore.acnts;

select * from CBX.od_audit

--CBX User Login Audit
select a.event_id,to_char(a.audit_date,'dd-MON-yyyy HH:MI:SS AM'), od_login_id, od_cif, event_desc,action 
from dfcore.od_audit a, cbx.event_master b 
where 
--audit_date between '19-AUG-19' and '05-SEP-19' 
--audit_date like '%04-SEP-19%' 
 a.event_id=b.event_id 
and od_login_id = 'NGYCHCAM'
order by audit_date desc,2; 

select a.audit_date, a.od_login_id, b.event_desc, b.action
from dfcore.od_audit a
left join DFCORE.event_master b on a.event_id = b.event_id
where a.od_login_id = '10665492';



72717433

select * from dfcore.od_audit 
select * from arx.tb_arm_user_master where user_login = '100039351'
select * from CBX.od_audit where user_no = '75464';
select * from CBX.od_users_mb
select * from CBX.od_user_profile_mb where od_login_id = 'NGYCHCAM'

--ARX 
select * from ARX.tb_arx_user_otp where mobile_number = '85587376052' order by otp_generated_time desc;  --Check OTP has sent or not (OTP not validate)
select * from ARX.tb_arx_user_otp_history where mobile_number = '85592308995'; -- check OTP validated by client
select * from ARX.tb_arx_user_otp where user_login = '100122209';
select * from ARX.tb_arx_user_otp_history where user_login = '100019385';
select * from ARX.tb_arx_user_otp_history where email_id like '%shimizu@jtrustsystem.co.jp%';2218
select * from CBX.od_users_mb where od_login_id = 'DOUGCRAF'

select od_to_id, od_from_id, od_mail_subject, od_mail_status, od_date
select * 
from cbx.od_pending_mail where od_to_id = 'shimizu@jtrustsystem.co.jp';
select * from CBX.od_pending_alrt_mail where od_gcif = '100228914'

select * from cbx.od_pending_mail where od_mail_body like '%AHMALJEMI%'; 

select user_login, otp_status, mobile_number, request_type,otp_generated_time, a.aws_response
--select * 
from ARX.tb_arx_user_otp a
--where user_login = '85581605072';

where mobile_number in ('85589777882');

--To set no password expiry for corporate front office users, please execute below statement on ARX schema : 
-- Set password no expiry 
--update arx.TB_ARM_GROUP set NO_PSWD_EXPRY=1 where name='ARMADMGROUP'; 





select user_login, otp_reference ,otp_status, mobile_number, request_type,otp_generated_time, otp_updated_time
from ARX.tb_arx_user_otp_history
--where user_login = '100033876';
where mobile_number = '85589777882';

select * from ARX.tb_arx_user_otp_history where otp_reference = '52105379'
--USER CREATION
select * from ARX.tb_arm_user_master where mailid like '%sean%';
select * from ARX.tb_arm_user_master where id= '1694';
select * from ARX.tb_arm_user_master where user_login = 'Phirin.E';
select * from ARX.tb_arm_group;
select * from ARX.tb_arm_user_group where group_id = '188';

select user_login, otp_status, email_id, mobile_number, request_type, otp_generated_time, otp_updated_time

from ARX.tb_arx_user_otp_history
where mobile_number = '85517880185';
where user_login = '10015459';
select user_login, otp_status, email_id, mobile_number, request_type, otp_generated_time, otp_updated_time;
select  * from arx.tb_arx_user_otp SELECT
    *
FROM
    arx.tb_arx_user_otp
WHERE
    mobile_number = '85517880185'
--user_login = '10015459'
SELECT
    *
FROM
    arx.ims_actvy_log
WHERE
    user_login = '100010698';  -- LOGIN AUDIT

SELECT
    *
FROM
    idccore.products
WHERE
    product_code IN (
        1400,
        200
    );

SELECT
    *
FROM
    idccore.actypes
WHERE
    actype_code IN (
        '0089',
        '0010'
    );

SELECT
    n.*
FROM
    idccore.iaclink,
    idccore.acnts n
WHERE
    iaclink_internal_acnum = acnts_internal_acnum
    AND iaclink_actual_acnum IN (
        2694745,
        2694734
    );

SELECT
    substr(mpi_cust_id, 2, 9) cif,
    mpi_cust_id
FROM
    lms.m_proj_info
WHERE
    mpi_mat_dt > '30-APR-20';

SELECT
    mpi_legacy_id,
    mpf_tot_disb_amt,
    mpf_int_accrued,
    f.*
FROM
    lms.m_proj_finbal f,
    lms.m_proj_info
WHERE
    mpf_cust_id = mpi_cust_id
    AND mpf_con_id = mpi_con_id
        AND mpf_proj_id = mpi_proj_id
            AND mpi_legacy_id = lpad(2764408, 17, 0);

SELECT
    mpi_legacy_id,
    mpf_tot_disb_amt,
    mpf_int_accrued,
    f.*
FROM
    lms.m_proj_finbal f,
    lms.m_proj_info
WHERE
    mpf_cust_id = mpi_cust_id
    AND mpf_con_id = mpi_con_id
        AND mpf_proj_id = mpi_proj_id
            AND mpi_legacy_id = lpad(4126010, 17, 0);

SELECT
    *
FROM
    dfcore.customer_info;

SELECT
    *
FROM
    dfcore.od_users_wb;

SELECT
    *
FROM
    dfcore.orbiibs_nickname;

SELECT
    *
FROM
    dfcore.od_users_mb;

SELECT
    *
FROM
    dfcore.accounts_txn_mt;


