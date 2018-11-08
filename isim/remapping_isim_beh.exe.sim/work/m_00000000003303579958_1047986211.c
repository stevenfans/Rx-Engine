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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/SCHOOL WORK/CECS 460 Labs/RECEIVE_ENGINE/remapping.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};



static void Cont_32_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 2364U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2892);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Cont_33_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 2508U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2928);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void Always_35_2(char *t0)
{
    char t4[8];
    char t9[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;

LAB0:    t1 = (t0 + 2652U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2680);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);
    t5 = (t0 + 876U);
    t6 = *((char **)t5);
    t5 = (t0 + 784U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 2, 2, 2U, t7, 1, t6, 1);

LAB5:    t5 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB12;

LAB13:
LAB15:
LAB14:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1840);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);

LAB16:    goto LAB2;

LAB6:    xsi_set_current_line(37, ng0);
    t10 = ((char*)((ng2)));
    t11 = ((char*)((ng2)));
    t13 = (t0 + 968U);
    t14 = *((char **)t13);
    memset(t12, 0, 8);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 0);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 0);
    *((unsigned int *)t13) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 127U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 127U);
    t22 = (t0 + 1612U);
    t23 = *((char **)t22);
    xsi_vlogtype_concat(t9, 10, 10, 4U, t23, 1, t12, 7, t11, 1, t10, 1);
    t22 = (t0 + 1840);
    xsi_vlogvar_assign_value(t22, t9, 0, 0, 10);
    goto LAB16;

LAB8:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 968U);
    t6 = *((char **)t5);
    memset(t12, 0, 8);
    t5 = (t12 + 4);
    t7 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (t16 >> 0);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t7);
    t19 = (t18 >> 0);
    *((unsigned int *)t5) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 127U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 127U);
    t10 = (t0 + 1520U);
    t11 = *((char **)t10);
    t10 = (t0 + 1612U);
    t13 = *((char **)t10);
    xsi_vlogtype_concat(t9, 10, 10, 4U, t13, 1, t11, 1, t12, 7, t3, 1);
    t10 = (t0 + 1840);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 10);
    goto LAB16;

LAB10:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 968U);
    t6 = *((char **)t5);
    memset(t12, 0, 8);
    t5 = (t12 + 4);
    t7 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (t16 >> 0);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t7);
    t19 = (t18 >> 0);
    *((unsigned int *)t5) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 255U);
    t21 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t21 & 255U);
    t10 = (t0 + 1612U);
    t11 = *((char **)t10);
    xsi_vlogtype_concat(t9, 10, 10, 3U, t11, 1, t12, 8, t3, 1);
    t10 = (t0 + 1840);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 10);
    goto LAB16;

LAB12:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    memset(t12, 0, 8);
    t3 = (t12 + 4);
    t6 = (t5 + 4);
    t16 = *((unsigned int *)t5);
    t17 = (t16 >> 0);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t6);
    t19 = (t18 >> 0);
    *((unsigned int *)t3) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 255U);
    t21 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t21 & 255U);
    t7 = (t0 + 1520U);
    t10 = *((char **)t7);
    t7 = (t0 + 1612U);
    t11 = *((char **)t7);
    xsi_vlogtype_concat(t9, 10, 10, 3U, t11, 1, t10, 1, t12, 8);
    t7 = (t0 + 1840);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 10);
    goto LAB16;

}


extern void work_m_00000000003303579958_1047986211_init()
{
	static char *pe[] = {(void *)Cont_32_0,(void *)Cont_33_1,(void *)Always_35_2};
	xsi_register_didat("work_m_00000000003303579958_1047986211", "isim/remapping_isim_beh.exe.sim/work/m_00000000003303579958_1047986211.didat");
	xsi_register_executes(pe);
}
