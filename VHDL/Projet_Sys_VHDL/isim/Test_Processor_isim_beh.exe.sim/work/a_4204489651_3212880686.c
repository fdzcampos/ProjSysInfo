/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/ROM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_5109402382352621412_3965413181(char *, char *, char *);


static void work_a_4204489651_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t9;
    char *t11;
    char *t13;
    char *t15;
    char *t17;
    char *t19;
    char *t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(44, ng0);

LAB3:    t1 = xsi_get_transient_memory(992U);
    memset(t1, 0, 992U);
    t2 = t1;
    t3 = (t0 + 6384);
    t5 = (32U != 0);
    if (t5 == 1)
        goto LAB5;

LAB6:    t7 = (t0 + 6416);
    memcpy(t2, t7, 32U);
    t2 = (t2 + 32U);
    t9 = (t0 + 6448);
    memcpy(t2, t9, 32U);
    t2 = (t2 + 32U);
    t11 = (t0 + 6480);
    memcpy(t2, t11, 32U);
    t2 = (t2 + 32U);
    t13 = (t0 + 6512);
    memcpy(t2, t13, 32U);
    t2 = (t2 + 32U);
    t15 = (t0 + 6544);
    memcpy(t2, t15, 32U);
    t2 = (t2 + 32U);
    t17 = (t0 + 6576);
    memcpy(t2, t17, 32U);
    t2 = (t2 + 32U);
    t19 = (t0 + 6608);
    memcpy(t2, t19, 32U);
    t2 = (t2 + 32U);
    t21 = (t0 + 6640);
    memcpy(t2, t21, 32U);
    t2 = (t2 + 32U);
    t23 = (t0 + 3152);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t1, 992U);
    xsi_driver_first_trans_fast(t23);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t6 = (992U / 32U);
    xsi_mem_set_data(t2, t3, 32U, t6);
    goto LAB6;

}

static void work_a_4204489651_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 1032U);
    t3 = *((char **)t1);
    t1 = (t0 + 5312U);
    t4 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 30, 1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 3216);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 3072);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4204489651_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4204489651_3212880686_p_0,(void *)work_a_4204489651_3212880686_p_1};
	xsi_register_didat("work_a_4204489651_3212880686", "isim/Test_Processor_isim_beh.exe.sim/work/a_4204489651_3212880686.didat");
	xsi_register_executes(pe);
}
