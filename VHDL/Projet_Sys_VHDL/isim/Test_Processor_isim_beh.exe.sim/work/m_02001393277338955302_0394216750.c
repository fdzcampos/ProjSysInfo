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
static const char *ng0 = "/home/mendesfe/Bureau/ProjSysInfo/VHDL/Projet_Sys_VHDL/bram16.v";
static int ng1[] = {1852796517, 0};



static void Always_26_0(char *t0)
{
    char t13[8];
    char t14[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;

LAB0:    t1 = (t0 + 3864U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 4680);
    *((int *)t2) = 1;
    t3 = (t0 + 3896);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(26, ng0);

LAB5:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 2072U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2952);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2952);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t15 = (t0 + 2952);
    t16 = (t15 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 2392U);
    t19 = *((char **)t18);
    xsi_vlog_generic_get_array_select_value(t13, 16, t4, t12, t17, 2, 1, t19, 10, 2);
    t18 = (t0 + 2792);
    xsi_vlogvar_wait_assign_value(t18, t13, 0, 0, 16, 0LL);
    goto LAB2;

LAB6:    xsi_set_current_line(27, ng0);

LAB9:    xsi_set_current_line(28, ng0);
    t11 = (t0 + 1912U);
    t12 = *((char **)t11);
    t11 = (t0 + 2952);
    t15 = (t0 + 2952);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2952);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 2392U);
    t22 = *((char **)t21);
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t22, 10, 2);
    t21 = (t13 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (!(t23));
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB10;

LAB11:    goto LAB8;

LAB10:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t14);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, *((unsigned int *)t14), t32, 0LL);
    goto LAB11;

}

static void Cont_33_1(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 4112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2232U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 1);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 1023U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 1023U);
    t12 = (t0 + 4776);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 1023U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 9);
    t25 = (t0 + 4696);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Initial_38_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(39, ng0);

LAB2:    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng1)));
    t2 = ((char*)((ng1)));
    memset(t3, 0, 8);
    t4 = (t1 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t1);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t11 = (t9 ^ t10);
    t12 = (t8 | t11);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t5);
    t15 = (t13 | t14);
    t16 = (~(t15));
    t17 = (t12 & t16);
    if (t17 != 0)
        goto LAB4;

LAB3:    if (t15 != 0)
        goto LAB5;

LAB6:    t19 = (t3 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t3);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB7;

LAB8:
LAB9:
LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB6;

LAB5:    t18 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB6;

LAB7:    xsi_set_current_line(41, ng0);

LAB10:    xsi_set_current_line(42, ng0);
    t25 = ((char*)((ng1)));
    t26 = (t0 + 2952);
    xsi_vlogfile_readmemh(t25, 32, t26, 0, 0, 0, 0);
    goto LAB9;

}


extern void work_m_02001393277338955302_0394216750_init()
{
	static char *pe[] = {(void *)Always_26_0,(void *)Cont_33_1,(void *)Initial_38_2};
	xsi_register_didat("work_m_02001393277338955302_0394216750", "isim/Test_Processor_isim_beh.exe.sim/work/m_02001393277338955302_0394216750.didat");
	xsi_register_executes(pe);
}
