/*****************************************************************************
 *
 * Copyright (c) 2017 mCube, Inc.  All rights reserved.
 *
 * This source is subject to the mCube Software License.
 * This software is protected by Copyright and the information and source code
 * contained herein is confidential. The software including the source code
 * may not be copied and the information contained herein may not be used or
 * disclosed except with the written permission of mCube Inc.
 *
 * All other rights reserved.
 *****************************************************************************/

/**
 * @file    m_drv_mc_utility.c
 * @author  mCube
 * @date    25 May 2017
 * @brief   Utility variable for mCube sensors.
 * @see     http://www.mcubemems.com
 */

/*******************************************************************************
 *** INCLUDE FILES
 *******************************************************************************/
#include "m_drv_mc_utility.h"

/*******************************************************************************
 *** CONFIGURATION
 *******************************************************************************/

/*******************************************************************************
 *** CONSTANT / DEFINE
 *******************************************************************************/

/*******************************************************************************
 *** GLOBAL VARIABLE
 *******************************************************************************/
const S_M_DRV_MC_UTIL_ORIENTATIONREMAP_TYPEDEF
          g_MDrvUtilOrientationReMap[E_M_DRV_UTIL_ORIENTATION_TOTAL_CONFIG] =
              {
                  {{  1,  1,  1 }, { M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_Z }},
                  {{ -1,  1,  1 }, { M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Z }},
                  {{ -1, -1,  1 }, { M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_Z }},
                  {{  1, -1,  1 }, { M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Z }},
                  
                  {{ -1,  1, -1 }, { M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_Z }},
                  {{  1,  1, -1 }, { M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Z }},
                  {{  1, -1, -1 }, { M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_Z }},
                  {{ -1, -1, -1 }, { M_DRV_MC_UTL_AXIS_Y, M_DRV_MC_UTL_AXIS_X, M_DRV_MC_UTL_AXIS_Z }},
              };

