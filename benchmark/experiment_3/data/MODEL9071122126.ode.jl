Original system:

[
Ras_slash_GAP_star_ => 1//250000000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx,
MAPK_slash_MAPKK_star__slash_MAPKKtyr_slash_MAPKKtyr_cplx => 81//5000000000000*MAPK_slash_MAPK*MAPK_slash_MAPKK_star_,
PLA2_slash_DAG_minus_Ca_minus_PLA2_star_ => 3//1000000000000000*DAG*PLA2_slash_PLA2_minus_Ca_star_ + 3//10000000000*PLA2_slash_DAG_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx,
PKC_slash_PKC_minus_Ca => 3//5000000000000*Ca*PKC_slash_PKC_minus_cytosolic + 1//10000000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 21587//2500000000000000*PKC_slash_PKC_minus_Ca_minus_DAG + 17513//5000000000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_,
PLA2_slash_PIP2_minus_PLA2_star__slash_kenz_slash_kenz_cplx => 69//25000000000000*PLA2_slash_APC*PLA2_slash_PIP2_minus_PLA2_star_,
temp_minus_PIP2 => 0,
MAPK_slash_MAPK_minus_tyr => 3//5000000000000*MAPK_slash_MAPKK_star__slash_MAPKKthr_slash_MAPKKthr_cplx + 3//20000000000000*MAPK_slash_MAPKK_star__slash_MAPKKtyr_slash_MAPKKtyr_cplx + 1//1000000000000*MKP_minus_1_slash_MKP1_minus_thr_minus_deph_slash_MKP1_minus_thr_minus_deph_cplx + 1//250000000000*MKP_minus_1_slash_MKP1_minus_tyr_minus_deph_slash_MKP1_minus_tyr_minus_deph_cplx,
PKC_slash_PKC_minus_Ca_minus_DAG => 39999//5000000000000000000*DAG*PKC_slash_PKC_minus_Ca + 1//10000000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_,
PLA2_slash_APC => 0,
PLA2_slash_PLA2_star__minus_Ca_slash_kenz_slash_kenz_cplx => 3//100000000000*PLA2_slash_APC*PLA2_slash_PLA2_star__minus_Ca,
PLA2_slash_PIP2_minus_Ca_minus_PLA2_star_ => 9//50000000000*PLA2_slash_PIP2_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx + 3//250000000000000*PLA2_slash_PLA2_minus_Ca_star_*temp_minus_PIP2,
PKC_slash_PKC_minus_DAG => 3//5000000000000000*DAG*PKC_slash_PKC_minus_cytosolic + 1//500000000000*PKC_slash_PKC_minus_DAG_minus_AA,
MAPK_star__slash_MAPK_star__minus_feedback_slash_MAPK_star__minus_feedback_cplx => 39//20000000000000*MAPK_slash_craf_minus_1_star_*MAPK_star_,
PPhosphatase2A_slash_MAPKK_minus_deph_slash_MAPKK_minus_deph_cplx => 99//50000000000000*MAPK_slash_MAPKK_star_*PPhosphatase2A,
PPhosphatase2A_slash_craf_star__star__minus_deph_slash_craf_star__star__minus_deph_cplx => 99//50000000000000*MAPK_slash_craf_minus_1_star__star_*PPhosphatase2A,
PLA2_slash_PIP2_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx => 9//1000000000000*PLA2_slash_APC*PLA2_slash_PIP2_minus_Ca_minus_PLA2_star_,
PLA2_slash_PLA2_minus_Ca_star__slash_kenz_slash_kenz_cplx => 27//20000000000000*PLA2_slash_APC*PLA2_slash_PLA2_minus_Ca_star_,
Ras_slash_GEF_star__slash_GEF_star__minus_act_minus_ras_slash_GEF_star__minus_act_minus_ras_cplx => 99//500000000000000*Ras_slash_GDP_minus_Ras*Ras_slash_GEF_star_,
MAPK_slash_MAPKK_star_ => 3//4000000000000*MAPK_slash_MAPKK_star__slash_MAPKKthr_slash_MAPKKthr_cplx + 3//4000000000000*MAPK_slash_MAPKK_star__slash_MAPKKtyr_slash_MAPKKtyr_cplx + 21//200000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_2_slash_Raf_minus_GTP_minus_Ras_star__dot_2_cplx + 1//40000000000*PPhosphatase2A_slash_MAPKK_minus_deph_slash_MAPKK_minus_deph_cplx,
PPhosphatase2A_slash_craf_minus_deph_slash_craf_minus_deph_cplx => 99//50000000000000*MAPK_slash_craf_minus_1_star_*PPhosphatase2A,
PKC_minus_active => 3//10000000000000*MAPK_slash_craf_minus_1*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_AA_star_ - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_Ca_minus_AA_star_ - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_Ca_minus_memb_star_ - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_DAG_minus_AA_star_ - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_DAG_minus_memb_star_ - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_basal_star_ + 3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx*Ras_slash_GAP + 3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx*Ras_slash_inact_minus_GEF + 1//50000000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx + 3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx*Ras_slash_GAP + 3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx*Ras_slash_inact_minus_GEF + 1//50000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx + 3//500000000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx*Ras_slash_GAP + 3//500000000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx*Ras_slash_inact_minus_GEF + 1//50000000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx - 3//500000000000*PKC_slash_PKC_minus_AA_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_AA_star_*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_slash_PKC_minus_basal_star_*Ras_slash_GAP - 3//500000000000*PKC_slash_PKC_minus_basal_star_*Ras_slash_inact_minus_GEF,
MAPK_slash_MAPKK_minus_ser => 21//200000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_1_slash_Raf_minus_GTP_minus_Ras_star__dot_1_cplx + 21//50000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_2_slash_Raf_minus_GTP_minus_Ras_star__dot_2_cplx + 1//40000000000*PPhosphatase2A_slash_MAPKK_minus_deph_minus_ser_slash_MAPKK_minus_deph_minus_ser_cplx + 3//500000000000*PPhosphatase2A_slash_MAPKK_minus_deph_slash_MAPKK_minus_deph_cplx,
MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_1_slash_Raf_minus_GTP_minus_Ras_star__dot_1_cplx => 33//10000000000000*MAPK_slash_MAPKK*MAPK_slash_Raf_minus_GTP_minus_Ras_star_,
PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx => -3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx*Ras_slash_inact_minus_GEF - 3//500000000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_AA_star_*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_*Ras_slash_inact_minus_GEF + 3//500000000000*PKC_slash_PKC_minus_basal_star_*Ras_slash_inact_minus_GEF,
MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_2_slash_Raf_minus_GTP_minus_Ras_star__dot_2_cplx => 33//10000000000000*MAPK_slash_MAPKK_minus_ser*MAPK_slash_Raf_minus_GTP_minus_Ras_star_,
MAPK_star__slash_MAPK_star__slash_MAPK_star__cplx => 39//10000000000000*MAPK_star_*PLA2_slash_PLA2_minus_cytosolic,
PPhosphatase2A_slash_MAPKK_minus_deph_minus_ser_slash_MAPKK_minus_deph_minus_ser_cplx => 99//50000000000000*MAPK_slash_MAPKK_minus_ser*PPhosphatase2A,
PLA2_slash_PLA2_minus_Ca_star_ => 50001//50000000000000000*Ca*PLA2_slash_PLA2_minus_cytosolic + 1//250000000000*PLA2_slash_DAG_minus_Ca_minus_PLA2_star_ + 1//10000000000000*PLA2_slash_PIP2_minus_Ca_minus_PLA2_star_ + 27//1000000000000*PLA2_slash_PLA2_minus_Ca_star__slash_kenz_slash_kenz_cplx,
PKC_slash_PKC_minus_Ca_minus_memb_star_ => 2541//2000000000000000*PKC_slash_PKC_minus_Ca,
MAPK_slash_craf_minus_1_star__star_ => 1//100000000000*MAPK_star__slash_MAPK_star__minus_feedback_slash_MAPK_star__minus_feedback_cplx + 1//40000000000*PPhosphatase2A_slash_craf_star__star__minus_deph_slash_craf_star__star__minus_deph_cplx,
PKC_slash_PKC_minus_basal_star_ => 1//1000000000000*PKC_slash_PKC_minus_cytosolic,
PKC_slash_PKC_minus_DAG_minus_memb_star_ => 1//1000000000000*PKC_slash_PKC_minus_Ca_minus_DAG,
Ras_slash_GDP_minus_Ras => 1//100000000000*Ras_slash_GAP_slash_GAP_minus_inact_minus_ras_slash_GAP_minus_inact_minus_ras_cplx + 1//12500000000000*Ras_slash_GEF_star__slash_GEF_star__minus_act_minus_ras_slash_GEF_star__minus_act_minus_ras_cplx + 1//10000000000000000*Ras_slash_GTP_minus_Ras,
Ras_slash_GEF_star_ => 1//250000000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx + 1//10000000000000*Ras_slash_GEF_star__slash_GEF_star__minus_act_minus_ras_slash_GEF_star__minus_act_minus_ras_cplx,
AA => 1//10000000000000*PKC_slash_PKC_minus_AA_star_ + 1//10000000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 1//500000000000*PKC_slash_PKC_minus_DAG_minus_AA + 3//50000000000*PLA2_slash_DAG_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx + 9//250000000000*PLA2_slash_PIP2_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx + 69//6250000000000*PLA2_slash_PIP2_minus_PLA2_star__slash_kenz_slash_kenz_cplx + 27//5000000000000*PLA2_slash_PLA2_minus_Ca_star__slash_kenz_slash_kenz_cplx + 3//25000000000*PLA2_slash_PLA2_star__minus_Ca_slash_kenz_slash_kenz_cplx,
MKP_minus_1_slash_MKP1_minus_tyr_minus_deph_slash_MKP1_minus_tyr_minus_deph_cplx => 3//40000000000*MAPK_slash_MAPK_minus_tyr*MKP_minus_1,
PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx => -3//10000000000000*MAPK_slash_craf_minus_1*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx - 3//10000000000000*MAPK_slash_craf_minus_1*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_AA_star_ + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_Ca_minus_AA_star_ + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_Ca_minus_memb_star_ + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_DAG_minus_AA_star_ + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_DAG_minus_memb_star_ + 3//10000000000000*MAPK_slash_craf_minus_1*PKC_slash_PKC_minus_basal_star_,
PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx => -3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx*Ras_slash_GAP - 3//500000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_AA_star_*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_Ca_minus_AA_star_*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_Ca_minus_memb_star_*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_DAG_minus_memb_star_*Ras_slash_GAP + 3//500000000000*PKC_slash_PKC_minus_basal_star_*Ras_slash_GAP,
Ras_slash_GTP_minus_Ras => 1//2000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star_ + 1//1000000000*Ras_slash_GAP_slash_GAP_minus_inact_minus_ras_slash_GAP_minus_inact_minus_ras_cplx + 1//50000000000000*Ras_slash_GEF_star__slash_GEF_star__minus_act_minus_ras_slash_GEF_star__minus_act_minus_ras_cplx,
MAPK_slash_MAPKK => 21//50000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_1_slash_Raf_minus_GTP_minus_Ras_star__dot_1_cplx + 3//500000000000*PPhosphatase2A_slash_MAPKK_minus_deph_minus_ser_slash_MAPKK_minus_deph_minus_ser_cplx,
MKP_minus_1 => 1//200000000000*MKP_minus_1_slash_MKP1_minus_thr_minus_deph_slash_MKP1_minus_thr_minus_deph_cplx + 1//200000000000*MKP_minus_1_slash_MKP1_minus_tyr_minus_deph_slash_MKP1_minus_tyr_minus_deph_cplx,
MAPK_star_ => 3//20000000000000*MAPK_slash_MAPKK_star__slash_MAPKKthr_slash_MAPKKthr_cplx + 1//20000000000*MAPK_star__slash_MAPK_star__minus_feedback_slash_MAPK_star__minus_feedback_cplx + 1//10000000000*MAPK_star__slash_MAPK_star__slash_MAPK_star__cplx + 1//250000000000*MKP_minus_1_slash_MKP1_minus_thr_minus_deph_slash_MKP1_minus_thr_minus_deph_cplx,
PLA2_slash_PLA2_star__minus_Ca => 3//500000000000*Ca*PLA2_slash_PLA2_star_ + 3//5000000000*PLA2_slash_PLA2_star__minus_Ca_slash_kenz_slash_kenz_cplx,
MAPK_slash_Raf_minus_GTP_minus_Ras_star_ => 21//40000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_1_slash_Raf_minus_GTP_minus_Ras_star__dot_1_cplx + 21//40000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_2_slash_Raf_minus_GTP_minus_Ras_star__dot_2_cplx + 3//125000000000*MAPK_slash_craf_minus_1_star_*Ras_slash_GTP_minus_Ras,
Ras_slash_GAP => 1//62500000000*PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx + 101//100000000000*Ras_slash_GAP_slash_GAP_minus_inact_minus_ras_slash_GAP_minus_inact_minus_ras_cplx + 1//10000000000000*Ras_slash_GAP_star_,
PKC_slash_PKC_minus_AA_star_ => 3//25000000000000000*AA*PKC_slash_PKC_minus_cytosolic,
PKC_slash_PKC_minus_cytosolic => 1//10000000000000*PKC_slash_PKC_minus_AA_star_ + 1//2000000000000*PKC_slash_PKC_minus_Ca + 1//10000000000000*PKC_slash_PKC_minus_DAG + 1//20000000000*PKC_slash_PKC_minus_basal_star_,
PLA2_slash_DAG_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx => 3//200000000000*PLA2_slash_APC*PLA2_slash_DAG_minus_Ca_minus_PLA2_star_,
Ca => 0,
PKC_slash_PKC_minus_Ca_minus_AA_star_ => 3//2500000000000000*AA*PKC_slash_PKC_minus_Ca,
PLA2_slash_PIP2_minus_PLA2_star_ => 69//1250000000000*PLA2_slash_PIP2_minus_PLA2_star__slash_kenz_slash_kenz_cplx + 3//2500000000000000*PLA2_slash_PLA2_minus_cytosolic*temp_minus_PIP2,
MAPK_slash_MAPKK_star__slash_MAPKKthr_slash_MAPKKthr_cplx => 81//5000000000000*MAPK_slash_MAPKK_star_*MAPK_slash_MAPK_minus_tyr,
MAPK_slash_craf_minus_1 => 1//62500000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx + 3//500000000000*PPhosphatase2A_slash_craf_minus_deph_slash_craf_minus_deph_cplx,
MAPK_slash_MAPK => 3//5000000000000*MAPK_slash_MAPKK_star__slash_MAPKKtyr_slash_MAPKKtyr_cplx + 1//1000000000000*MKP_minus_1_slash_MKP1_minus_tyr_minus_deph_slash_MKP1_minus_tyr_minus_deph_cplx,
Ras_slash_GAP_slash_GAP_minus_inact_minus_ras_slash_GAP_minus_inact_minus_ras_cplx => 2499//2500000000000*Ras_slash_GAP*Ras_slash_GTP_minus_Ras,
DAG => 0,
Ras_slash_inact_minus_GEF => 1//62500000000*PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx + 1//1000000000000*Ras_slash_GEF_star_,
MAPK_slash_craf_minus_1_star_ => 1//2000000000000*MAPK_slash_Raf_minus_GTP_minus_Ras_star_ + 1//25000000000*MAPK_star__slash_MAPK_star__minus_feedback_slash_MAPK_star__minus_feedback_cplx + 1//250000000000*PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx + 1//40000000000*PPhosphatase2A_slash_craf_minus_deph_slash_craf_minus_deph_cplx + 3//500000000000*PPhosphatase2A_slash_craf_star__star__minus_deph_slash_craf_star__star__minus_deph_cplx,
PKC_slash_PKC_minus_DAG_minus_AA_star_ => 1//500000000000*PKC_slash_PKC_minus_DAG_minus_AA,
PKC_slash_PKC_minus_DAG_minus_AA => 9//500000000000000*AA*PKC_slash_PKC_minus_DAG + 1//5000000000000*PKC_slash_PKC_minus_DAG_minus_AA_star_,
PLA2_slash_PLA2_star_ => 1//50000000000*MAPK_star__slash_MAPK_star__slash_MAPK_star__cplx + 1//10000000000000*PLA2_slash_PLA2_star__minus_Ca,
PLA2_slash_PLA2_minus_cytosolic => 1//12500000000*MAPK_star__slash_MAPK_star__slash_MAPK_star__cplx + 1//2000000000000*PLA2_slash_PIP2_minus_PLA2_star_ + 1//10000000000000*PLA2_slash_PLA2_minus_Ca_star_ + 17//100000000000000*PLA2_slash_PLA2_star_,
PPhosphatase2A => 31//1000000000000*PPhosphatase2A_slash_MAPKK_minus_deph_minus_ser_slash_MAPKK_minus_deph_minus_ser_cplx + 31//1000000000000*PPhosphatase2A_slash_MAPKK_minus_deph_slash_MAPKK_minus_deph_cplx + 31//1000000000000*PPhosphatase2A_slash_craf_minus_deph_slash_craf_minus_deph_cplx + 31//1000000000000*PPhosphatase2A_slash_craf_star__star__minus_deph_slash_craf_star__star__minus_deph_cplx,
MKP_minus_1_slash_MKP1_minus_thr_minus_deph_slash_MKP1_minus_thr_minus_deph_cplx => 3//40000000000*MAPK_star_*MKP_minus_1
]

Reductions:


new_vars = fmpq_mpoly[Ca]
new_system = 
[
0
]


new_vars = fmpq_mpoly[Ca, DAG]
new_system = 
[
0,
0
]


new_vars = fmpq_mpoly[Ca, DAG, PLA2_slash_APC]
new_system = 
[
0,
0,
0
]


new_vars = fmpq_mpoly[Ca, DAG, PLA2_slash_APC, temp_minus_PIP2]
new_system = 
[
0,
0,
0,
0
]


new_vars = fmpq_mpoly[AA, Ca, DAG, MAPK_slash_MAPK, MAPK_slash_MAPKK, MAPK_slash_MAPKK_minus_ser, MAPK_slash_MAPKK_star_, MAPK_slash_MAPKK_star__slash_MAPKKthr_slash_MAPKKthr_cplx, MAPK_slash_MAPKK_star__slash_MAPKKtyr_slash_MAPKKtyr_cplx, MAPK_slash_MAPK_minus_tyr, MAPK_slash_Raf_minus_GTP_minus_Ras_star_, MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_1_slash_Raf_minus_GTP_minus_Ras_star__dot_1_cplx, MAPK_slash_Raf_minus_GTP_minus_Ras_star__slash_Raf_minus_GTP_minus_Ras_star__dot_2_slash_Raf_minus_GTP_minus_Ras_star__dot_2_cplx, MAPK_slash_craf_minus_1, MAPK_slash_craf_minus_1_star_, MAPK_slash_craf_minus_1_star__star_, MAPK_star_, MAPK_star__slash_MAPK_star__minus_feedback_slash_MAPK_star__minus_feedback_cplx, MAPK_star__slash_MAPK_star__slash_MAPK_star__cplx, MKP_minus_1, MKP_minus_1_slash_MKP1_minus_thr_minus_deph_slash_MKP1_minus_thr_minus_deph_cplx, MKP_minus_1_slash_MKP1_minus_tyr_minus_deph_slash_MKP1_minus_tyr_minus_deph_cplx, PKC_minus_active_slash_PKC_minus_act_minus_GEF_slash_PKC_minus_act_minus_GEF_cplx, PKC_minus_active_slash_PKC_minus_act_minus_raf_slash_PKC_minus_act_minus_raf_cplx, PKC_minus_active_slash_PKC_minus_inact_minus_GAP_slash_PKC_minus_inact_minus_GAP_cplx, PKC_slash_PKC_minus_AA_star_, PKC_slash_PKC_minus_Ca, PKC_slash_PKC_minus_Ca_minus_AA_star_, PKC_slash_PKC_minus_Ca_minus_DAG, PKC_slash_PKC_minus_Ca_minus_memb_star_, PKC_slash_PKC_minus_DAG, PKC_slash_PKC_minus_DAG_minus_AA, PKC_slash_PKC_minus_DAG_minus_AA_star_, PKC_slash_PKC_minus_DAG_minus_memb_star_, PKC_slash_PKC_minus_basal_star_, PKC_slash_PKC_minus_cytosolic, PLA2_slash_APC, PLA2_slash_DAG_minus_Ca_minus_PLA2_star_, PLA2_slash_DAG_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx, PLA2_slash_PIP2_minus_Ca_minus_PLA2_star_, PLA2_slash_PIP2_minus_Ca_minus_PLA2_star__slash_kenz_slash_kenz_cplx, PLA2_slash_PIP2_minus_PLA2_star_, PLA2_slash_PIP2_minus_PLA2_star__slash_kenz_slash_kenz_cplx, PLA2_slash_PLA2_minus_Ca_star_, PLA2_slash_PLA2_minus_Ca_star__slash_kenz_slash_kenz_cplx, PLA2_slash_PLA2_minus_cytosolic, PLA2_slash_PLA2_star_, PLA2_slash_PLA2_star__minus_Ca, PLA2_slash_PLA2_star__minus_Ca_slash_kenz_slash_kenz_cplx, PPhosphatase2A, PPhosphatase2A_slash_MAPKK_minus_deph_minus_ser_slash_MAPKK_minus_deph_minus_ser_cplx, PPhosphatase2A_slash_MAPKK_minus_deph_slash_MAPKK_minus_deph_cplx, PPhosphatase2A_slash_craf_minus_deph_slash_craf_minus_deph_cplx, PPhosphatase2A_slash_craf_star__star__minus_deph_slash_craf_star__star__minus_deph_cplx, Ras_slash_GAP, Ras_slash_GAP_slash_GAP_minus_inact_minus_ras_slash_GAP_minus_inact_minus_ras_cplx, Ras_slash_GAP_star_, Ras_slash_GDP_minus_Ras, Ras_slash_GEF_star_, Ras_slash_GEF_star__slash_GEF_star__minus_act_minus_ras_slash_GEF_star__minus_act_minus_ras_cplx, Ras_slash_GTP_minus_Ras, Ras_slash_inact_minus_GEF, temp_minus_PIP2]
new_system = 
[
1//10000000000000*y26 + 1//10000000000000*y28 + 1//500000000000*y32 + 3//50000000000*y39 + 9//250000000000*y41 + 69//6250000000000*y43 + 27//5000000000000*y45 + 3//25000000000*y49,
0,
0,
3//5000000000000*y9 + 1//1000000000000*y22,
21//50000000000000*y12 + 3//500000000000*y51,
21//200000000000000*y12 + 21//50000000000000*y13 + 1//40000000000*y51 + 3//500000000000*y52,
3//4000000000000*y8 + 3//4000000000000*y9 + 21//200000000000000*y13 + 1//40000000000*y52,
81//5000000000000*y7*y10,
81//5000000000000*y4*y7,
3//5000000000000*y8 + 3//20000000000000*y9 + 1//1000000000000*y21 + 1//250000000000*y22,
21//40000000000000*y12 + 21//40000000000000*y13 + 3//125000000000*y15*y61,
33//10000000000000*y5*y11,
33//10000000000000*y6*y11,
1//62500000000*y24 + 3//500000000000*y53,
1//2000000000000*y11 + 1//25000000000*y18 + 1//250000000000*y24 + 1//40000000000*y53 + 3//500000000000*y54,
1//100000000000*y18 + 1//40000000000*y54,
3//20000000000000*y8 + 1//20000000000*y18 + 1//10000000000*y19 + 1//250000000000*y21,
39//20000000000000*y15*y17,
39//10000000000000*y17*y46,
1//200000000000*y21 + 1//200000000000*y22,
3//40000000000*y17*y20,
3//40000000000*y10*y20,
-3//500000000000*y24*y62 - 3//500000000000*y25*y62 + 3//500000000000*y26*y62 + 3//500000000000*y28*y62 + 3//500000000000*y30*y62 + 3//500000000000*y33*y62 + 3//500000000000*y34*y62 + 3//500000000000*y35*y62,
-3//10000000000000*y14*y23 - 3//10000000000000*y14*y25 + 3//10000000000000*y14*y26 + 3//10000000000000*y14*y28 + 3//10000000000000*y14*y30 + 3//10000000000000*y14*y33 + 3//10000000000000*y14*y34 + 3//10000000000000*y14*y35,
-3//500000000000*y23*y55 - 3//500000000000*y24*y55 + 3//500000000000*y26*y55 + 3//500000000000*y28*y55 + 3//500000000000*y30*y55 + 3//500000000000*y33*y55 + 3//500000000000*y34*y55 + 3//500000000000*y35*y55,
3//25000000000000000*y1*y36,
3//5000000000000*y2*y36 + 1//10000000000000*y28 + 21587//2500000000000000*y29 + 17513//5000000000000000*y30,
3//2500000000000000*y1*y27,
39999//5000000000000000000*y3*y27 + 1//10000000000000*y34,
2541//2000000000000000*y27,
3//5000000000000000*y3*y36 + 1//500000000000*y32,
9//500000000000000*y1*y31 + 1//5000000000000*y33,
1//500000000000*y32,
1//1000000000000*y29,
1//1000000000000*y36,
1//10000000000000*y26 + 1//2000000000000*y27 + 1//10000000000000*y31 + 1//20000000000*y35,
0,
3//1000000000000000*y3*y44 + 3//10000000000*y39,
3//200000000000*y37*y38,
9//50000000000*y41 + 3//250000000000000*y44*y63,
9//1000000000000*y37*y40,
69//1250000000000*y43 + 3//2500000000000000*y46*y63,
69//25000000000000*y37*y42,
50001//50000000000000000*y2*y46 + 1//250000000000*y38 + 1//10000000000000*y40 + 27//1000000000000*y45,
27//20000000000000*y37*y44,
1//12500000000*y19 + 1//2000000000000*y42 + 1//10000000000000*y44 + 17//100000000000000*y47,
1//50000000000*y19 + 1//10000000000000*y48,
3//500000000000*y2*y47 + 3//5000000000*y49,
3//100000000000*y37*y48,
31//1000000000000*y51 + 31//1000000000000*y52 + 31//1000000000000*y53 + 31//1000000000000*y54,
99//50000000000000*y6*y50,
99//50000000000000*y7*y50,
99//50000000000000*y15*y50,
99//50000000000000*y16*y50,
1//62500000000*y25 + 101//100000000000*y56 + 1//10000000000000*y57,
2499//2500000000000*y55*y61,
1//250000000000*y25,
1//100000000000*y56 + 1//12500000000000*y60 + 1//10000000000000000*y61,
1//250000000000*y23 + 1//10000000000000*y60,
99//500000000000000*y58*y59,
1//2000000000000*y11 + 1//1000000000*y56 + 1//50000000000000*y60,
1//62500000000*y23 + 1//1000000000000*y59,
0
]


