------------------------------------------------------------------------------
--                                                                          --
--                             STM32F4 COMPONENTS                           --
--                                                                          --
--                 S T M 32 F 4 . O7xx . T i m e r s . T 2 _ 5              --
--                                                                          --
--                           H a r d w ar e  S p e c                        --
--                                                                          --
--                     Copyright (C) 2014, Jan de Kruyf                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.                                               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
--                      (email: jan.de.kruyf@gmail.com)                     --
--                                                                          --
------------------------------------------------------------------------------

--  This file provides type definitions for the STM32F4 (ARM Cortex M4F)
--  microcontrollers from ST Microelectronics.
--
--  chapter 18.4   TIM2 to TIM5 registers       RM0090 Reference manual
--


pragma Restrictions (No_Elaboration_Code);

with STM32F4.O7xx.Timers.T1_8;

package STM32F4.O7xx.Timers.T2_5 is
   
   type Cr1_Register is new STM32F4.O7xx.Timers.T1_8.Cr1_Register;
   
   
   type Cr2_Register is record
      Res1  : Reserved (0 .. 2) := (others => 0);
      CCDS  : Bits_1; -- Capture/compare DMA selection
      MMS   : Bits_3; -- Master mode selection
      TI1S  : Bits_1; -- TI1 selection
      Res2  : Reserved ( 8 .. 15) := (others => 0);
   end record;
   
   for Cr2_Register use record
      Res1  at 0 range 0 .. 2;
      CCDS  at 0 range 3 .. 3;
      MMS   at 0 range 4 .. 6;
      TI1S  at 0 range 7 .. 7;
      Res2  at 0 range 8 .. 15;
   end record;
   
   
   type SMCR_Register is new STM32F4.O7xx.Timers.T1_8.SMCR_Register;
   
   
   type DIER_Register is record   --  DMA/interrupt enable register
      UIE,              -- Update interrupt enable
      CC1IE,            -- Capture/Compare 1 interrupt enable
      CC2IE,            -- Capture/Compare 2 interrupt enable
      CC3IE,            -- Capture/Compare 3 interrupt enable
      CC4IE,            -- Capture/Compare 4 interrupt enable
      TIE    : Bits_1;  -- Trigger interrupt enable
      Res1   : Reserved (3 .. 3) := (others => 0);
      UDE,              -- Update DMA request enable
      CC1DE,            -- Capture/Compare 1 DMA request enable
      CC2DE,            -- Capture/Compare 2 DMA request enable
      CC3DE,            -- Capture/Compare 3 DMA request enable
      CC4DE,            -- Capture/Compare 4 DMA request enable
      COMDE,            -- COM DMA request enable
      TDE    : Bits_1;  -- Trigger DMA request enable
   end record;
   
   for DIER_Register use record
      UIE    at 0 range 0 .. 0;
      CC1IE  at 0 range 1 .. 1;
      CC2IE  at 0 range 2 .. 2;
      CC3IE  at 0 range 3 .. 3;
      CC4IE  at 0 range 4 .. 4;
      TIE    at 0 range 6 .. 6;
      Res1   at 0 range 7 .. 7;
      UDE    at 0 range 8 .. 8; 
      CC1DE  at 0 range 9 .. 9; 
      CC2DE  at 0 range 10 .. 10;
      CC3DE  at 0 range 11 .. 11;
      CC4DE  at 0 range 12 .. 12;
      COMDE  at 0 range 13 .. 13;
      TDE    at 0 range 14 .. 14;
   end record;
   
         
   type SR_Register is record  -- status register 
      UIF,                -- Update interrupt flag
      CC1IF,              -- CC1IF
      CC2IF,              -- CC2IF
      CC3IF,              -- Capture/Compare 3 interrupt flag
      CC4IF    : Bits_1;  -- Capture/Compare 4 interrupt flag
      Res1     : Reserved (5 .. 5) := (others => 0);	
      TIF      : Bits_1;  -- Trigger interrupt flag
      Res3     : Reserved (7 .. 8) := (others => 0);
      CC1OF,              -- Capture/Compare 1 overcapture flag
      CC2OF,              -- Capture/Compare 2 overcapture flag
      CC3OF,              -- Capture/Compare 3 overcapture flag
      CC4OF    : Bits_1;  -- Capture/Compare 4 overcapture flag
      Res2   : Reserved (13 .. 15) := (others => 0);
   end record;
   
   for SR_Register use record
      UIF    at 0 range 0 .. 0;	
      CC1IF  at 0 range 1 .. 1;	
      CC2IF  at 0 range 2 .. 2;	
      CC3IF  at 0 range 3 .. 3;	
      CC4IF  at 0 range 4 .. 4;	
      Res1   at 0 range 5 .. 5;
      TIF    at 0 range 6 .. 6;
      Res3   at 0 range 7 .. 8;
      CC1OF  at 0 range 9 .. 9; 
      CC2OF  at 0 range 10 .. 10;
      CC3OF  at 0 range 11 .. 11;
      CC4OF  at 0 range 12 .. 12;
      Res2   at 0 range 13 .. 15;
   end record;
   
   
   type EGR_Register is record  -- event generation register
      UG,                 -- Update generation
      CC1G,               -- Capture/Compare 1 generation
      CC2G,               -- Capture/Compare 2 generation
      CC3G,               -- Capture/Compare 3 generation
      CC4G      : Bits_1; -- Capture/Compare 4 generation
      Res1      : Reserved (5 .. 5) := (others => 0);
      TG        : Bits_1; -- Trigger generation
      Res2      : Reserved (7 .. 15) := (others => 0);
   end record;
   
   for EGR_Register use record
      UG    at 0 range 0 .. 0;	
      CC1G  at 0 range 1 .. 1;	
      CC2G  at 0 range 2 .. 2;	
      CC3G  at 0 range 3 .. 3;	
      CC4G  at 0 range 4 .. 4;
      Res1  at 0 range 5 .. 5; 
      TG    at 0 range 6 .. 6;
      Res2  at 0 range 7 .. 15;
   end record;
   
   
   subtype CCMR1_Capture_Register is
     STM32F4.O7xx.Timers.T1_8.CCMR1_Capture_Register;

   
   subtype CCMR2_Capture_Register is 
     STM32F4.O7xx.Timers.T1_8.CCMR2_Capture_Register;
   
   
   type CCER_Register is record  -- capture/compare enable register 
      CC1E,               -- Capture/Compare 1 output enable
      CC1P     : Bits_1;  -- Capture/Compare 1 output polarity
      Res1     : Reserved (2 .. 2) := (others => 0);
      CC1NP,              -- Capture/Compare 1 complementary output polarity
      CC2E,               -- Capture/Compare 2 output enable
      CC2P     : Bits_1;  -- Capture/Compare 2 output polarity
      Res2     : Reserved (6 .. 6) := (others => 0);
      CC2NP,              -- Capture/Compare 2 complementary output polarity
      CC3E,               -- Capture/Compare 3 output enable
      CC3P     : Bits_1;  -- Capture/Compare 3 output polarity
      Res3     : Reserved (10 .. 10) := (others => 0); 	
      CC3NP,              -- Capture/Compare 3 complementary output polarity
      CC4E,               -- Capture/Compare 4 output enable
      CC4P     : Bits_1;  -- Capture/Compare 4 output polarity
      Res4     : Reserved (14 .. 14) := (others => 0);
      CC4NP    : Bits_1; -- Capture/Compare 4 complementary output polarity
   end record;
   
   for CCER_Register use record
      CC1E   at 0 range 0 .. 0;	 
      CC1P   at 0 range 1 .. 1;	 
      Res1   at 0 range 2 .. 2;
      CC1NP  at 0 range 3 .. 3;	 
      CC2E   at 0 range 4 .. 4;	 
      CC2P   at 0 range 5 .. 5;	 
      Res2   at 0 range 6 .. 6;
      CC2NP  at 0 range 7 .. 7;  
      CC3E   at 0 range 8 .. 8;  
      CC3P   at 0 range 9 .. 9;  
      Res3   at 0 range 10 .. 10;
      CC3NP  at 0 range 11 .. 11;
      CC4E   at 0 range 12 .. 12;
      CC4P   at 0 range 13 .. 13;
      Res4   at 0 range 14 .. 14;
      CC4NP  at 0 range 15 .. 15;
   end record;
   
   
   subtype CNT16_Register is Half_Word;  -- counter
   subtype PSC_Register is Half_Word;  -- prescaler 
   subtype ARR16_Register is Half_Word;  -- auto-reload register
   subtype CCR16_Register is Half_Word;  -- capture/compare register
   
   subtype CNT32_Register is Word;  -- counter
   subtype ARR32_Register is Word;  -- auto-reload register
   subtype CCR32_Register is Word;  -- capture/compare register
   
       
   type DCR_Register is record  --  DMA control register
      DBA       : Bits_5;    --  DMA base address
      Res1      : Reserved (5 .. 7) := (others => 0);
      DBL       : Bits_5;    --  DMA burst length
      Res2      : Reserved (13 .. 15) := (others => 0);
   end record;
   
   for DCR_Register use record
      DBA   at 0 range  0 .. 4;
      Res1  at 0 range  5 .. 7;
      DBL   at 0 range  8 .. 12;
      Res2  at 0 range 13 .. 15;
   end record;
   
   
   subtype DMAR_Register is Half_Word;  -- DMA address for full transfer
      
   
   type TIM2_OR_Register is record  -- TIM2 option register
      Res1      : Reserved (0 .. 9) := (others => 0);
      ITR1_RMP  : Bits_2;    -- TIM2  Internal trigger 1 remap
      Res2      : Reserved (12 .. 15) := (others => 0);
   end record;
   
   for TIM2_OR_Register use record
      Res1     at 0 range  0 .. 9;
      ITR1_RMP at 0 range 10 .. 11;
      Res2     at 0 range 12 .. 15;
   end record;
   
   
   type TIM5_OR_Register is record  -- TIM5 option register
      Res1      : Reserved (0 .. 5) := (others => 0);
      TI4_RMP   : Bits_2;    -- TIM5  Timer Input 4 remap
      Res2      : Reserved (8 .. 15) := (others => 0);
   end record;
   
   for TIM5_OR_Register use record
      Res1    at 0 range  0 .. 5;
      TI4_RMP at 0 range  6 .. 7;
      Res2    at 0 range  8 .. 15;
   end record;
   
   
   --  type Cntr_Nr_Type is new Positive range 2 .. 5;
   
   --  type Timer_Register (Cntr : Cntr_Nr_Type := 2) is record
   --     CR1         : Cr1_Register;   -- control register 1 
   --     CR2         : Cr2_Register;   -- control register 2 
   --     SMCR        : SMCR_Register;  -- slave mode control register
   --     DIER        : DIER_Register;  -- DMA/interrupt enable register
   --     SR          : SR_Register;    -- status register 
   --     EGR         : EGR_Register;   -- event generation register
   --     CCMR1       : CCMR1_Register; -- capture/compare mode register 1
   --     CCMR2       : CCMR2_Register; -- capture/compare mode register 2
   --     CCER        : CCER_Register;  -- capture/compare enable register 
   --     PSC         : PSC_Register;   -- prescaler 
   --     DCR         : DCR_Register;   -- DMA control register
   --     DMAR        : DMAR_Register;  -- DMA address for full transfer
   --    case Cntr is
   --  	 when 2      =>
   --  	    CNT2        : CNT32_Register;  -- counter
   --  	    ARR2        : ARR32_Register;  -- auto-reload register
   --  	    CCR1_2      : CCR32_Register;  -- capture/compare register 1
   --  	    CCR2_2      : CCR32_Register;  -- capture/compare register 2
   --  	    CCR3_2      : CCR32_Register;  -- capture/compare register 3
   --  	    CCR4_2      : CCR32_Register;  -- capture/compare register 4
   --  	    TIM2_OR     : TIM2_OR_Register;-- TIM2 option register
   --  	 when 5      =>
   --  	    CNT5        : CNT32_Register;  -- counter
   --  	    ARR5        : ARR32_Register;  -- auto-reload register
   --  	    CCR1_5      : CCR32_Register;  -- capture/compare register 1
   --  	    CCR2_5      : CCR32_Register;  -- capture/compare register 2
   --  	    CCR3_5      : CCR32_Register;  -- capture/compare register 3
   --  	    CCR4_5      : CCR32_Register;  -- capture/compare register 4
   --  	    TIM5_OR     : TIM5_OR_Register;-- TIM2 option register
   --  	 when 3 | 4  =>
   --  	    CNT16       : CNT16_Register;  -- counter
   --  	    ARR16       : ARR16_Register;  -- auto-reload register
   --  	    CCR1_16     : CCR16_Register;  -- capture/compare register 1
   --  	    CCR2_16     : CCR16_Register;  -- capture/compare register 2
   --  	    CCR3_16     : CCR16_Register;  -- capture/compare register 3
   --  	    CCR4_16     : CCR16_Register;  -- capture/compare register 4
   --     end case;
      
   --  end record;
   
   --  for Timer_Register use record
   --     CR1   at 0   range 0 .. 31;
   --     CR2   at 4   range 0 .. 31;
   --     SMCR  at 8   range 0 .. 31;
   --     DIER  at 12  range 0 .. 31;
   --     SR    at 16  range 0 .. 31;
   --     EGR   at 20  range 0 .. 31;
   --     CCMR1 at 24  range 0 .. 31;
   --     CCMR2 at 28  range 0 .. 31;
   --     CCER  at 32  range 0 .. 31;
   --     PSC   at 40  range 0 .. 31;
      
   --     CNT2  at 36  range 0 .. 31;
   --     ARR2  at 44  range 0 .. 31;
   --     CCR1_2  at 52  range 0 .. 31;
   --     CCR2_2  at 56  range 0 .. 31;
   --     CCR3_2  at 60  range 0 .. 31;
   --     CCR4_2  at 64  range 0 .. 31;
      
   --     CNT5  at 36  range 0 .. 31;
   --     ARR5  at 44  range 0 .. 31;
   --     CCR1_5  at 52  range 0 .. 31;
   --     CCR2_5  at 56  range 0 .. 31;
   --     CCR3_5  at 60  range 0 .. 31;
   --     CCR4_5  at 64  range 0 .. 31;
      
   --     CNT16 at 36  range 0 .. 31;
   --     ARR16 at 44  range 0 .. 31;
   --     CCR1_16  at 52  range 0 .. 31;
   --     CCR2_16  at 56  range 0 .. 31;
   --     CCR3_16  at 60  range 0 .. 31;
   --     CCR4_16  at 64  range 0 .. 31;
      
   --     DCR   at 72  range 0 .. 31;
   --     DMAR  at 76  range 0 .. 31;
   --     TIM2_OR at 80 range 0 .. 31;
   --     TIM5_OR at 80 range 0 .. 31;
   --  end record;
   
   
   type Timer2_Register is record
      CR1         : Cr1_Register;   -- control register 1 
      Res0        : Bits_16;
      CR2         : Cr2_Register;   -- control register 2 
      Res1        : Bits_16;
      SMCR        : SMCR_Register;  -- slave mode control register
      Res2        : Bits_16;
      DIER        : DIER_Register;  -- DMA/interrupt enable register
      Res3        : Bits_16;
      SR          : SR_Register;    -- status register 
      Res4        : Bits_16;
      EGR         : EGR_Register;   -- event generation register
      Res5        : Bits_16;
      CCMR1       : CCMR1_Capture_Register; -- capt/compare mode register 1
      Res6        : Bits_16;
      CCMR2       : CCMR2_Capture_Register; -- capt/compare mode register 2
      Res7        : Bits_16;
      CCER        : CCER_Register;  -- capture/compare enable register 
      Res8        : Bits_16;
      CNT         : CNT32_Register;  -- counter
      PSC         : PSC_Register;   -- prescaler 
      Res10       : Bits_16;
      ARR         : ARR32_Register;  -- auto-reload register
      Reserved0   : Bits_32x1;
      CCR1        : CCR32_Register;  -- capture/compare register 1
      CCR2        : CCR32_Register;  -- capture/compare register 2
      CCR3        : CCR32_Register;  -- capture/compare register 3
      CCR4        : CCR32_Register;  -- capture/compare register 4
      Reserved1   : Bits_32x1;
      DCR         : DCR_Register;  -- DMA control register
      Res18       : Bits_16;
      DMAR        : DMAR_Register; -- DMA address for full transfer 
      Res19       : Bits_16;
      T_OR        : TIM2_OR_Register;-- TIM2 option register
   end record;
   
   for Timer2_Register use record
      CR1   at 0   range 0 .. 15;
      Res0  at 2   range 0 .. 15;
      CR2   at 4   range 0 .. 15;
      Res1  at 6   range 0 .. 15;
      SMCR  at 8   range 0 .. 15;
      Res2  at 10  range 0 .. 15;
      DIER  at 12  range 0 .. 15;
      Res3  at 14  range 0 .. 15;
      SR    at 16  range 0 .. 15;
      Res4  at 18  range 0 .. 15;
      EGR   at 20  range 0 .. 15;
      Res5  at 22  range 0 .. 15;
      CCMR1 at 24  range 0 .. 15;
      Res6  at 26  range 0 .. 15;
      CCMR2 at 28  range 0 .. 15;
      Res7  at 30  range 0 .. 15;
      CCER  at 32  range 0 .. 15;
      Res8  at 34  range 0 .. 15;
      CNT   at 36  range 0 .. 31;
      PSC   at 40  range 0 .. 15;
      Res10 at 42  range 0 .. 15;
      ARR   at 44  range 0 .. 31;
      Reserved0 at 48 range 0 .. 31;
      CCR1  at 52  range 0 .. 31;
      CCR2  at 56  range 0 .. 31;
      CCR3  at 60  range 0 .. 31;
      CCR4  at 64  range 0 .. 31;
      Reserved1 at 68 range 0 .. 31;
      DCR   at 72  range 0 .. 15;
      Res18 at 74  range 0 .. 15;
      DMAR  at 76  range 0 .. 15;
      Res19 at 78  range 0 .. 15;
      T_OR  at 80  range 0 .. 15;
   end record;
   
   
   type Timer34_Register is record
      --  CR1         : Cr1_Register;   -- control register 1 
      --  CR2         : Cr2_Register;   -- control register 2 
      --  SMCR        : SMCR_Register;  -- slave mode control register
      --  DIER        : DIER_Register;  -- DMA/interrupt enable register
      --  SR          : SR_Register;    -- status register 
      --  EGR         : EGR_Register;   -- event generation register
      --  CCMR1       : CCMR1_Register; -- capture/compare mode register 1
      --  CCMR2       : CCMR2_Register; -- capture/compare mode register 2
      --  CCER        : CCER_Register;  -- capture/compare enable register 
      --  CNT         : CNT16_Register;  -- counter
      --  PSC         : PSC_Register;   -- prescaler 
      --  ARR         : ARR16_Register;  -- auto-reload register
      CR1         : Cr1_Register;   -- control register 1 
      Res0        : Bits_16;
      CR2         : Cr2_Register;   -- control register 2 
      Res1        : Bits_16;
      SMCR        : SMCR_Register;  -- slave mode control register
      Res2        : Bits_16;
      DIER        : DIER_Register;  -- DMA/interrupt enable register
      Res3        : Bits_16;
      SR          : SR_Register;    -- status register 
      Res4        : Bits_16;
      EGR         : EGR_Register;   -- event generation register
      Res5        : Bits_16;
      CCMR1       : CCMR1_Capture_Register; -- capt/compare mode register 1
      Res6        : Bits_16;
      CCMR2       : CCMR2_Capture_Register; -- capt/compare mode register 2
      Res7        : Bits_16;
      CCER        : CCER_Register;  -- capture/compare enable register 
      Res8        : Bits_16;
      CNT         : CNT16_Register;   -- counter
      Res9        : Bits_16;
      PSC         : PSC_Register;   -- prescaler 
      Res10       : Bits_16;
      ARR         : ARR16_Register;   -- auto-reload register
      Res11       : Bits_16;
      Reserved0   : Bits_32x1;
      --  CCR1        : CCR16_Register;  -- capture/compare register 1
      --  CCR2        : CCR16_Register;  -- capture/compare register 2
      --  CCR3        : CCR16_Register;  -- capture/compare register 3
      --  CCR4        : CCR16_Register;  -- capture/compare register 4
      CCR1        : CCR16_Register;  -- capture/compare register 1
      Res13       : Bits_16;
      CCR2        : CCR16_Register;  -- capture/compare register 1
      Res14       : Bits_16;
      CCR3        : CCR16_Register;  -- capture/compare register 1
      Res15       : Bits_16;
      CCR4        : CCR16_Register;  -- capture/compare register 1
      Res16       : Bits_16;
      Reserved1   : Bits_32x1;
      --  DCR         : DCR_Register;   -- DMA control register
      --  DMAR        : DMAR_Register;  -- DMA address for full transfer
      DCR         : DCR_Register;  -- DMA control register
      Res18       : Bits_16;
      DMAR        : DMAR_Register; -- DMA address for full transfer 
      Res19       : Bits_16;
   end record;
   
   for Timer34_Register use record
      --  CR1   at 0   range 0 .. 31;
      --  CR2   at 4   range 0 .. 31;
      --  SMCR  at 8   range 0 .. 31;
      --  DIER  at 12  range 0 .. 31;
      --  SR    at 16  range 0 .. 31;
      --  EGR   at 20  range 0 .. 31;
      --  CCMR1 at 24  range 0 .. 31;
      --  CCMR2 at 28  range 0 .. 31;
      --  CCER  at 32  range 0 .. 31;
      --  CNT   at 36  range 0 .. 31;
      --  PSC   at 40  range 0 .. 31;
      --  ARR   at 44  range 0 .. 31;
      CR1   at 0   range 0 .. 15;
      Res0  at 2   range 0 .. 15;
      CR2   at 4   range 0 .. 15;
      Res1  at 6   range 0 .. 15;
      SMCR  at 8   range 0 .. 15;
      Res2  at 10  range 0 .. 15;
      DIER  at 12  range 0 .. 15;
      Res3  at 14  range 0 .. 15;
      SR    at 16  range 0 .. 15;
      Res4  at 18  range 0 .. 15;
      EGR   at 20  range 0 .. 15;
      Res5  at 22  range 0 .. 15;
      CCMR1 at 24  range 0 .. 15;
      Res6  at 26  range 0 .. 15;
      CCMR2 at 28  range 0 .. 15;
      Res7  at 30  range 0 .. 15;
      CCER  at 32  range 0 .. 15;
      Res8  at 34  range 0 .. 15;
      CNT   at 36  range 0 .. 15;
      Res9  at 38  range 0 .. 15;
      PSC   at 40  range 0 .. 15;
      Res10 at 42  range 0 .. 15;
      ARR   at 44  range 0 .. 15;
      Res11 at 46  range 0 .. 15;
      Reserved0 at 48 range 0 .. 31;
      --  CCR1  at 52  range 0 .. 31;
      --  CCR2  at 56  range 0 .. 31;
      --  CCR3  at 60  range 0 .. 31;
      --  CCR4  at 64  range 0 .. 31;
      CCR1  at 52  range 0 .. 15;
      Res13 at 54  range 0 .. 15;
      CCR2  at 56  range 0 .. 15;
      Res14 at 58  range 0 .. 15;
      CCR3  at 60  range 0 .. 15;
      Res15 at 62  range 0 .. 15;
      CCR4  at 64  range 0 .. 15;
      Res16 at 66  range 0 .. 15;
      Reserved1 at 68 range 0 .. 31;
      --  DCR   at 72  range 0 .. 31;
      --  DMAR  at 76  range 0 .. 31;
      DCR   at 72  range 0 .. 15;
      Res18 at 74  range 0 .. 15;
      DMAR  at 76  range 0 .. 15;
      Res19 at 78  range 0 .. 15;
   end record;
   
   
   type Timer5_Register is record
      CR1         : Cr1_Register;   -- control register 1 
      Res0        : Bits_16;
      CR2         : Cr2_Register;   -- control register 2 
      Res1        : Bits_16;
      SMCR        : SMCR_Register;  -- slave mode control register
      Res2        : Bits_16;
      DIER        : DIER_Register;  -- DMA/interrupt enable register
      Res3        : Bits_16;
      SR          : SR_Register;    -- status register 
      Res4        : Bits_16;
      EGR         : EGR_Register;   -- event generation register
      Res5        : Bits_16;
      CCMR1       : CCMR1_Capture_Register; -- capt/compare mode register 1
      Res6        : Bits_16;
      CCMR2       : CCMR2_Capture_Register; -- capt/compare mode register 2
      Res7        : Bits_16;
      CCER        : CCER_Register;  -- capture/compare enable register 
      Res8        : Bits_16;
      CNT         : CNT32_Register;  -- counter
      PSC         : PSC_Register;   -- prescaler 
      Res10       : Bits_16;
      ARR         : ARR32_Register;  -- auto-reload register
      Reserved0   : Bits_32x1;
      CCR1        : CCR32_Register;  -- capture/compare register 1
      CCR2        : CCR32_Register;  -- capture/compare register 2
      CCR3        : CCR32_Register;  -- capture/compare register 3
      CCR4        : CCR32_Register;  -- capture/compare register 4
      Reserved1   : Bits_32x1;
      DCR         : DCR_Register;  -- DMA control register
      Res18       : Bits_16;
      DMAR        : DMAR_Register; -- DMA address for full transfer 
      Res19       : Bits_16;
      T_OR        : TIM5_OR_Register;-- TIM5 option register
   end record;
   
   for Timer5_Register use record
      CR1   at 0   range 0 .. 15;
      Res0  at 2   range 0 .. 15;
      CR2   at 4   range 0 .. 15;
      Res1  at 6   range 0 .. 15;
      SMCR  at 8   range 0 .. 15;
      Res2  at 10  range 0 .. 15;
      DIER  at 12  range 0 .. 15;
      Res3  at 14  range 0 .. 15;
      SR    at 16  range 0 .. 15;
      Res4  at 18  range 0 .. 15;
      EGR   at 20  range 0 .. 15;
      Res5  at 22  range 0 .. 15;
      CCMR1 at 24  range 0 .. 15;
      Res6  at 26  range 0 .. 15;
      CCMR2 at 28  range 0 .. 15;
      Res7  at 30  range 0 .. 15;
      CCER  at 32  range 0 .. 15;
      Res8  at 34  range 0 .. 15;
      CNT   at 36  range 0 .. 31;
      PSC   at 40  range 0 .. 15;
      Res10 at 42  range 0 .. 15;
      ARR   at 44  range 0 .. 31;
      Reserved0 at 48 range 0 .. 31;
      CCR1  at 52  range 0 .. 31;
      CCR2  at 56  range 0 .. 31;
      CCR3  at 60  range 0 .. 31;
      CCR4  at 64  range 0 .. 31;
      Reserved1 at 68 range 0 .. 31;
      DCR   at 72  range 0 .. 15;
      Res18 at 74  range 0 .. 15;
      DMAR  at 76  range 0 .. 15;
      Res19 at 78  range 0 .. 15;
      T_OR  at 80  range 0 .. 15;
   end record;

end STM32F4.O7xx.Timers.T2_5;
