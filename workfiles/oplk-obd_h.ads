pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with oplk.oplkinc_h;
with Interfaces.C.Extensions;
with System;
with Interfaces.C.Strings;
with oplk.errordefs_h;

package oplk.obd_h is


   OBD_TABLE_INDEX_END : constant := 16#FFFF#;  --  ./oplk/obd.h:50

   OBD_TRUE : constant := 16#01#;  --  ./oplk/obd.h:53
   OBD_FALSE : constant := 16#00#;  --  ./oplk/obd.h:54

   OBD_NODE_ID_INDEX : constant := 16#1F93#;  --  ./oplk/obd.h:56
   OBD_NODE_ID_SUBINDEX : constant := 16#01#;  --  ./oplk/obd.h:57
   OBD_NODE_ID_HWBOOL_SUBINDEX : constant := 16#02#;  --  ./oplk/obd.h:58

   OID_DLL_MN_CRCERROR_REC : constant := 16#1C00#;  --  ./oplk/obd.h:61
   OID_DLL_MN_CYCTIME_EXCEED_REC : constant := 16#1C02#;  --  ./oplk/obd.h:62
   OID_DLL_CN_LOSSSOC_REC : constant := 16#1C0B#;  --  ./oplk/obd.h:63
   OID_DLL_CN_LOSSPREQ_REC : constant := 16#1C0D#;  --  ./oplk/obd.h:64
   OID_DLL_CN_CRCERROR_REC : constant := 16#1C0F#;  --  ./oplk/obd.h:65

   SUBIDX_DLL_ERROR_CUM_CNT : constant := 1;  --  ./oplk/obd.h:67
   SUBIDX_DLL_ERROR_THR_CNT : constant := 2;  --  ./oplk/obd.h:68
   SUBIDX_DLL_ERROR_THRESHOLD : constant := 3;  --  ./oplk/obd.h:69

   NUM_DLL_MNCN_LOSSPRES_OBJS : constant := 254;  --  ./oplk/obd.h:71
   OID_DLL_MNCN_LOSSPRES_CUMCNT_AU32 : constant := 16#1C07#;  --  ./oplk/obd.h:72
   OID_DLL_MNCN_LOSSPRES_THRCNT_AU32 : constant := 16#1C08#;  --  ./oplk/obd.h:73
   OID_DLL_MNCN_LOSSPRES_THRESHOLD_AU32 : constant := 16#1C09#;  --  ./oplk/obd.h:74

   kObdPartNo : constant := 16#00#;  --  ./oplk/obd.h:132
   kObdPartGen : constant := 16#01#;  --  ./oplk/obd.h:133
   kObdPartMan : constant := 16#02#;  --  ./oplk/obd.h:134
   kObdPartDev : constant := 16#04#;  --  ./oplk/obd.h:135
   kObdPartUsr : constant := 16#08#;  --  ./oplk/obd.h:136
   --  unsupported macro: kObdPartApp ( kObdPartMan | kObdPartDev | kObdPartUsr)
   --  unsupported macro: kObdPartAll (kObdPartGen | kObdPartMan | kObdPartDev | kObdPartUsr)

   kObdAccRead : constant := 16#01#;  --  ./oplk/obd.h:152
   kObdAccWrite : constant := 16#02#;  --  ./oplk/obd.h:153
   kObdAccConst : constant := 16#04#;  --  ./oplk/obd.h:154
   kObdAccPdo : constant := 16#08#;  --  ./oplk/obd.h:155
   kObdAccArray : constant := 16#10#;  --  ./oplk/obd.h:156
   kObdAccRange : constant := 16#20#;  --  ./oplk/obd.h:157
   kObdAccVar : constant := 16#40#;  --  ./oplk/obd.h:158
   kObdAccStore : constant := 16#80#;  --  ./oplk/obd.h:159
   --  unsupported macro: kObdAccR (0 | 0 | 0 | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccW (0 | 0 | 0 | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccRW (0 | 0 | 0 | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccCR (0 | 0 | 0 | 0 | kObdAccConst | 0 | kObdAccRead)
   --  unsupported macro: kObdAccGR (0 | 0 | kObdAccRange | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccGW (0 | 0 | kObdAccRange | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccGRW (0 | 0 | kObdAccRange | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccVR (0 | kObdAccVar | 0 | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccVW (0 | kObdAccVar | 0 | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccVRW (0 | kObdAccVar | 0 | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccVPR (0 | kObdAccVar | 0 | kObdAccPdo | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccVPW (0 | kObdAccVar | 0 | kObdAccPdo | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccVPRW (0 | kObdAccVar | 0 | kObdAccPdo | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccVGR (0 | kObdAccVar | kObdAccRange | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccVGW (0 | kObdAccVar | kObdAccRange | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccVGRW (0 | kObdAccVar | kObdAccRange | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccVGPR (0 | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccVGPW (0 | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccVGPRW (0 | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSR (kObdAccStore | 0 | 0 | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSW (kObdAccStore | 0 | 0 | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSRW (kObdAccStore | 0 | 0 | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSCR (kObdAccStore | 0 | 0 | 0 | kObdAccConst | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSGR (kObdAccStore | 0 | kObdAccRange | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSGW (kObdAccStore | 0 | kObdAccRange | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSGRW (kObdAccStore | 0 | kObdAccRange | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSVR (kObdAccStore | kObdAccVar | 0 | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSVW (kObdAccStore | kObdAccVar | 0 | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSVRW (kObdAccStore | kObdAccVar | 0 | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSVPR (kObdAccStore | kObdAccVar | 0 | kObdAccPdo | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSVPW (kObdAccStore | kObdAccVar | 0 | kObdAccPdo | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSVPRW (kObdAccStore | kObdAccVar | 0 | kObdAccPdo | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSVGR (kObdAccStore | kObdAccVar | kObdAccRange | 0 | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSVGW (kObdAccStore | kObdAccVar | kObdAccRange | 0 | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSVGRW (kObdAccStore | kObdAccVar | kObdAccRange | 0 | 0 | kObdAccWrite | kObdAccRead)
   --  unsupported macro: kObdAccSVGPR (kObdAccStore | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | 0 | kObdAccRead)
   --  unsupported macro: kObdAccSVGPW (kObdAccStore | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | kObdAccWrite | 0 )
   --  unsupported macro: kObdAccSVGPRW (kObdAccStore | kObdAccVar | kObdAccRange | kObdAccPdo | 0 | kObdAccWrite | kObdAccRead)

  --*
  --********************************************************************************
  --\file   oplk/obd.h
  --\brief  Definitions for OBD module
  --This file contains definitions for the OBD module
  --****************************************************************************** 

  --------------------------------------------------------------------------------
  --Copyright (c) 2014, Bernecker+Rainer Industrie-Elektronik Ges.m.b.H. (B&R)
  --Copyright (c) 2013, SYSTEC electronic GmbH
  --Copyright (c) 2013, Kalycito Infotech Private Ltd.All rights reserved.
  --All rights reserved.
  --Redistribution and use in source and binary forms, with or without
  --modification, are permitted provided that the following conditions are met:
  --    * Redistributions of source code must retain the above copyright
  --      notice, this list of conditions and the following disclaimer.
  --    * Redistributions in binary form must reproduce the above copyright
  --      notice, this list of conditions and the following disclaimer in the
  --      documentation and/or other materials provided with the distribution.
  --    * Neither the name of the copyright holders nor the
  --      names of its contributors may be used to endorse or promote products
  --      derived from this software without specific prior written permission.
  --THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  --ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  --WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  --DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS BE LIABLE FOR ANY
  --DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  --(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  --LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  --ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  --(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  --SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  -------------------------------------------------------------------------------- 

  --------------------------------------------------------------------------------
  -- includes
  --------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- const defines
  --------------------------------------------------------------------------------
  -- for the usage of BOOLEAN in OD
  -- object IDs of error handling objects
  --------------------------------------------------------------------------------
  -- typedef
  --------------------------------------------------------------------------------
  --*
  --* \brief Directions for access to object dictionary
  --*
  --* This enumeration defines valid "directions" for accesses to the object
  --* dictionary.
  -- 

  --/< Initialising after power on
  --/< Store all object values to non volatile memory
  --/< Load all object values from non volatile memory
  --/< Deletes non volatile memory (restore)
  --/< Reserved
   subtype tObdDir is unsigned;
   kObdDirInit : constant tObdDir := 0;
   kObdDirStore : constant tObdDir := 1;
   kObdDirLoad : constant tObdDir := 2;
   kObdDirRestore : constant tObdDir := 3;
   kObdDirOBKCheck : constant tObdDir := 255;  -- ./oplk/obd.h:93

  --*
  --* \brief Valid OD store commands
  --*
  --* This enumeration defines valid store commands for the OD
  -- 

   subtype tObdCommand is unsigned;
   kObdCmdOpenWrite : constant tObdCommand := 1;
   kObdCmdWriteObj : constant tObdCommand := 2;
   kObdCmdCloseWrite : constant tObdCommand := 3;
   kObdCmdOpenRead : constant tObdCommand := 4;
   kObdCmdReadObj : constant tObdCommand := 5;
   kObdCmdCloseRead : constant tObdCommand := 6;
   kObdCmdClear : constant tObdCommand := 7;  -- ./oplk/obd.h:109

  --*
  --* \brief Events of object callback function
  --*
  --* This enumeration defines events that can be handled by the object
  --* callback function.
  -- 

  --/< Checking if object does exist (reading and writing).  pArg points to: NULL
  --/< Called before reading an object. pArg points to: source data buffer in OD
  --/< Called after reading an object. pArg points to: destination data buffer from caller
  --/< Event for changing string/domain data pointer or size. pArg points to: struct tObdVStringDomain in RAM
  --/< Initializes writing an object (checking object size). pArg points to: size of object in OD (tObdSize)
  --/< Called before writing an object. pArg points to: source data buffer from caller
  --/< Called after writing an object. pArg points to: destination data buffer in OD
  --/< Called after setting default values. pArg points to: data buffer in OD
   subtype tObdEvent is unsigned;
   kObdEvCheckExist : constant tObdEvent := 6;
   kObdEvPreRead : constant tObdEvent := 0;
   kObdEvPostRead : constant tObdEvent := 1;
   kObdEvWrStringDomain : constant tObdEvent := 7;
   kObdEvInitWrite : constant tObdEvent := 4;
   kObdEvPreWrite : constant tObdEvent := 2;
   kObdEvPostWrite : constant tObdEvent := 3;
   kObdEvPostDefault : constant tObdEvent := 8;  -- ./oplk/obd.h:127

  --/< Data type for OD part definitions
   subtype tObdPart is unsigned;  -- ./oplk/obd.h:129

  -- Definitions for parts of the OD (bit oriented)
  -- combinations
  --/< Data type for OD access types
   subtype tObdAccess is unsigned;  -- ./oplk/obd.h:142

  --/\{
  --*
  --* \anchor sect_obdAccessRights
  --* \name   Access rights for objects
  --*
  --* The following macros define the access rights for objects.
  -- 

  -- combinations (not all combinations are required)
  --/\}
  -- For all objects as objects size are used an unsigned int.
   subtype tObdSize is unsigned;  -- ./oplk/obd.h:202

  --*
  --\brief Enumeration for object data types (DS301)
  --This enumeration defines the data types of objects in object dictionary.
  --DS-301 defines these types as UINT16.
  --openPOWERLINK supports only the listed data types. Other types are not supported
  --in this version.
  -- 

  --/< 0001 - BOOLEAN
  --/< 0002 - INTEGER8
  --/< 0003 - INTEGER16
  --/< 0004 - INTEGER32
  --/< 0005 - UNSIGNED8
  --/< 0006 - UNSIGNED16
  --/< 0007 - UNSIGNED32
  --/< 0008 - REAL32
  --/< 0009 - VISIBLE_STRING
  --/< 000A - OCTET_STRING
  --/< 000C - TIME_OF_DAY
  --/< 000D - TIME_DIFFERENCE
  --/< 000F - DOMAIN
  --/< 0010 - INTEGER24
  --/< 0011 - REAL64
  --/< 0012 - INTEGER40
  --/< 0013 - INTEGER48
  --/< 0014 - INTEGER56
  --/< 0015 - INTEGER64
  --/< 0016 - UNSIGNED24
  --/< 0018 - UNSIGNED40
  --/< 0019 - UNSIGNED48
  --/< 001A - UNSIGNED56
  --/< 001B - UNSIGNED64
   subtype tObdType is unsigned;
   kObdTypeBool : constant tObdType := 1;
   kObdTypeInt8 : constant tObdType := 2;
   kObdTypeInt16 : constant tObdType := 3;
   kObdTypeInt32 : constant tObdType := 4;
   kObdTypeUInt8 : constant tObdType := 5;
   kObdTypeUInt16 : constant tObdType := 6;
   kObdTypeUInt32 : constant tObdType := 7;
   kObdTypeReal32 : constant tObdType := 8;
   kObdTypeVString : constant tObdType := 9;
   kObdTypeOString : constant tObdType := 10;
   kObdTypeTimeOfDay : constant tObdType := 12;
   kObdTypeTimeDiff : constant tObdType := 13;
   kObdTypeDomain : constant tObdType := 15;
   kObdTypeInt24 : constant tObdType := 16;
   kObdTypeReal64 : constant tObdType := 17;
   kObdTypeInt40 : constant tObdType := 18;
   kObdTypeInt48 : constant tObdType := 19;
   kObdTypeInt56 : constant tObdType := 20;
   kObdTypeInt64 : constant tObdType := 21;
   kObdTypeUInt24 : constant tObdType := 22;
   kObdTypeUInt40 : constant tObdType := 24;
   kObdTypeUInt48 : constant tObdType := 25;
   kObdTypeUInt56 : constant tObdType := 26;
   kObdTypeUInt64 : constant tObdType := 27;
   kObdTypeMax : constant tObdType := 28;  -- ./oplk/obd.h:243

  --/\{
  --*
  --\name C type definitions for data types defined in POWERLINK DS301
  --The following C data types are defined according to the POWERLINK DS301
  --specification.
  -- 

  --/< for DS301 data type \ref kObdTypeBool
   subtype tObdBoolean is unsigned_char;  -- ./oplk/obd.h:252

  --/< for DS301 data type \ref kObdTypeInt8
   subtype tObdInteger8 is signed_char;  -- ./oplk/obd.h:253

  --/< for DS301 data type \ref kObdTypeInt16
   subtype tObdInteger16 is short;  -- ./oplk/obd.h:254

  --/< for DS301 data type \ref kObdTypeInt32
   subtype tObdInteger32 is int;  -- ./oplk/obd.h:255

  --/< for DS301 data type \ref kObdTypeUInt8
   subtype tObdUnsigned8 is unsigned_char;  -- ./oplk/obd.h:256

  --/< for DS301 data type \ref kObdTypeUInt16
   subtype tObdUnsigned16 is unsigned_short;  -- ./oplk/obd.h:257

  --/< for DS301 data type \ref kObdTypeUInt32
   subtype tObdUnsigned32 is unsigned;  -- ./oplk/obd.h:258

  --/< for DS301 data type \ref kObdTypeReal32
   subtype tObdReal32 is float;  -- ./oplk/obd.h:259

  --/< for DS301 data type \ref kObdTypeTimeOfDay
   subtype tObdTimeOfDay is oplk.oplkinc_h.tTimeOfDay;

  --/< for DS301 data type \ref kObdTypeTimeDiff
   subtype tObdTimeDifference is oplk.oplkinc_h.tTimeOfDay;

  --/< for DS301 data type \ref kObdTypeDomain
   subtype tObdDomain is unsigned_char;  -- ./oplk/obd.h:264

  --/< for DS301 data type \ref kObdTypeInt24
   subtype tObdInteger24 is int;  -- ./oplk/obd.h:265

  --/< for DS301 data type \ref kObdTypeReal64
   subtype tObdReal64 is double;  -- ./oplk/obd.h:266

  --/< for DS301 data type \ref kObdTypeInt40
   subtype tObdInteger40 is Long_Long_Integer;  -- ./oplk/obd.h:267

  --/< for DS301 data type \ref kObdTypeInt48
   subtype tObdInteger48 is Long_Long_Integer;  -- ./oplk/obd.h:268

  --/< for DS301 data type \ref kObdTypeInt56
   subtype tObdInteger56 is Long_Long_Integer;  -- ./oplk/obd.h:269

  --/< for DS301 data type \ref kObdTypeInt64
   subtype tObdInteger64 is Long_Long_Integer;  -- ./oplk/obd.h:270

  --/< for DS301 data type \ref kObdTypeUInt24
   subtype tObdUnsigned24 is unsigned;  -- ./oplk/obd.h:271

  --/< for DS301 data type \ref kObdTypeUInt40
   subtype tObdUnsigned40 is Extensions.unsigned_long_long;  -- ./oplk/obd.h:273

  --/< for DS301 data type \ref kObdTypeUInt48
   subtype tObdUnsigned48 is Extensions.unsigned_long_long;  -- ./oplk/obd.h:274

  --/< for DS301 data type \ref kObdTypeUInt56
   subtype tObdUnsigned56 is Extensions.unsigned_long_long;  -- ./oplk/obd.h:275

  --/< for DS301 data type \ref kObdTypeUInt64
   subtype tObdUnsigned64 is Extensions.unsigned_long_long;  -- ./oplk/obd.h:276

  --/\}
  -- currently only size and data are implemented and used
   subtype tVarParamValid is unsigned;
   kVarValidSize : constant tVarParamValid := 1;
   kVarValidData : constant tVarParamValid := 2;
   kVarValidAll : constant tVarParamValid := 3;  -- ./oplk/obd.h:284

   type tVarParam is record
      validFlag : aliased tVarParamValid;  -- ./oplk/obd.h:290
      index : aliased unsigned;  -- ./oplk/obd.h:291
      subindex : aliased unsigned;  -- ./oplk/obd.h:292
      size : aliased tObdSize;  -- ./oplk/obd.h:293
      pData : System.Address;  -- ./oplk/obd.h:294
   end record;
   pragma Convention (C_Pass_By_Copy, tVarParam);  -- ./oplk/obd.h:295

   --  skipped anonymous struct anon_57

   type tObdVarEntry is record
      pData : System.Address;  -- ./oplk/obd.h:299
      size : aliased tObdSize;  -- ./oplk/obd.h:300
   end record;
   pragma Convention (C_Pass_By_Copy, tObdVarEntry);  -- ./oplk/obd.h:301

   --  skipped anonymous struct anon_58

  --/ C type definition for DS301 data type \ref kObdTypeOString
   type tObdOString is record
      size : aliased tObdSize;  -- ./oplk/obd.h:306
      pString : access unsigned_char;  -- ./oplk/obd.h:307
   end record;
   pragma Convention (C_Pass_By_Copy, tObdOString);  -- ./oplk/obd.h:308

   --  skipped anonymous struct anon_59

  -- 0009
   type tObdOStringDef is record
      size : aliased tObdSize;  -- ./oplk/obd.h:312
      pDefString : access unsigned_char;  -- ./oplk/obd.h:313
      pString : access unsigned_char;  -- ./oplk/obd.h:314
   end record;
   pragma Convention (C_Pass_By_Copy, tObdOStringDef);  -- ./oplk/obd.h:315

   --  skipped anonymous struct anon_60

  -- must be same offset as pString in tObdVString
  --/ C type definition for DS301 data type \ref kObdTypeVString
   type tObdVString is record
      size : aliased tObdSize;  -- ./oplk/obd.h:321
      pString : Interfaces.C.Strings.chars_ptr;  -- ./oplk/obd.h:322
   end record;
   pragma Convention (C_Pass_By_Copy, tObdVString);  -- ./oplk/obd.h:323

   --  skipped anonymous struct anon_61

  -- 000A
   type tObdVStringDef is record
      size : aliased tObdSize;  -- ./oplk/obd.h:327
      pDefString : Interfaces.C.Strings.chars_ptr;  -- ./oplk/obd.h:328
      pString : Interfaces.C.Strings.chars_ptr;  -- ./oplk/obd.h:329
   end record;
   pragma Convention (C_Pass_By_Copy, tObdVStringDef);  -- ./oplk/obd.h:330

   --  skipped anonymous struct anon_62

  -- must be same offset as pString in tObdVString
  --r.d. parameter struct for changing object size and/or pointer to data of Strings or Domains
  -- download size from SDO or APP
   type tObdVStringDomain is record
      downloadSize : aliased tObdSize;  -- ./oplk/obd.h:335
      objSize : aliased tObdSize;  -- ./oplk/obd.h:336
      pData : System.Address;  -- ./oplk/obd.h:337
   end record;
   pragma Convention (C_Pass_By_Copy, tObdVStringDomain);  -- ./oplk/obd.h:338

   --  skipped anonymous struct anon_63

  -- current object size from OD - should be changed from callback function
  -- current object ptr  from OD - should be changed from callback function
  -- 000D
  --*
  --\brief Parameters for callback function
  --This structure defines the parameters for the OD callback function.
  -- 

  --/< Event that caused calling the function.
   type tObdCbParam is record
      obdEvent : aliased tObdEvent;  -- ./oplk/obd.h:347
      index : aliased unsigned;  -- ./oplk/obd.h:348
      subIndex : aliased unsigned;  -- ./oplk/obd.h:349
      pArg : System.Address;  -- ./oplk/obd.h:350
      abortCode : aliased unsigned;  -- ./oplk/obd.h:351
   end record;
   pragma Convention (C_Pass_By_Copy, tObdCbParam);  -- ./oplk/obd.h:352

   --  skipped anonymous struct anon_64

  --/< Index of the accessed object.
  --/< Subindex of the accessed object.
  --/< Additional argument.
  --/< Abort Code.
  -- define type for callback function: pParam_p points to tObdCbParam
   type tObdCallback is access function (arg1 : access tObdCbParam) return oplk.errordefs_h.tOplkError;
   pragma Convention (C, tObdCallback);  -- ./oplk/obd.h:355

  --*
  --\brief Structure for subindices
  --This structure defines a subindex in the OD.
  -- 

  --/< Subindex of the object
   type tObdSubEntry is record
      subIndex : aliased unsigned;  -- ./oplk/obd.h:364
      c_type : aliased tObdType;  -- ./oplk/obd.h:365
      c_access : aliased tObdAccess;  -- ./oplk/obd.h:366
      pDefault : System.Address;  -- ./oplk/obd.h:367
      pCurrent : System.Address;  -- ./oplk/obd.h:368
   end record;
   pragma Convention (C_Pass_By_Copy, tObdSubEntry);  -- ./oplk/obd.h:369

   --  skipped anonymous struct anon_65

  --/< Data type of the object
  --/< Access type of the object
  --/< Pointer to default data
  --/< Pointer to data (points always to RAM)
   type tObdSubEntryPtr is access all tObdSubEntry;  -- ./oplk/obd.h:371

  --*
  --\brief Structure for indices
  --This structure defines an index in the OD.
  -- 

  --/< Index of the object
   type tObdEntry is record
      index : aliased unsigned;  -- ./oplk/obd.h:381
      pSubIndex : tObdSubEntryPtr;  -- ./oplk/obd.h:382
      count : aliased unsigned;  -- ./oplk/obd.h:383
      pfnCallback : tObdCallback;  -- ./oplk/obd.h:384
   end record;
   pragma Convention (C_Pass_By_Copy, tObdEntry);  -- ./oplk/obd.h:385

   --  skipped anonymous struct anon_66

  --/< Points to subindex structures of this object
  --/< number of subindices.
  --/< function is called back if object access
   type tObdEntryPtr is access all tObdEntry;  -- ./oplk/obd.h:387

  --*
  --\brief Structure for OBD init parameters
  --This structure defines the init parameters of the OBD module.
  -- 

  --/< Pointer to generic part of OD
   type u_tObdInitParam is record
      pGenericPart : tObdEntryPtr;  -- ./oplk/obd.h:396
      numGeneric : aliased unsigned;  -- ./oplk/obd.h:397
      pManufacturerPart : tObdEntryPtr;  -- ./oplk/obd.h:398
      numManufacturer : aliased unsigned;  -- ./oplk/obd.h:399
      pDevicePart : tObdEntryPtr;  -- ./oplk/obd.h:400
      numDevice : aliased unsigned;  -- ./oplk/obd.h:401
   end record;
   pragma Convention (C_Pass_By_Copy, u_tObdInitParam);  -- ./oplk/obd.h:394

  --/< Number of entries in generic partition
  --/< Pointer to manufacturer part of OD
  --/< Number of entries in manufacturer partition
  --/< Pointer to device part of OD
  --/< Number of entries in device partition
  --/< Pointer to user part of OD
  --/< Number of entries in user partition
   subtype tObdInitParam is u_tObdInitParam;

  --*
  --\brief Structure for parameters of the store/restore commands
  --This structure specifies the parameters for the store/restore commands.
  -- 

   type tObdCbStoreParam is record
      command : aliased tObdCommand;  -- ./oplk/obd.h:417
      currentOdPart : aliased tObdPart;  -- ./oplk/obd.h:418
      pData : System.Address;  -- ./oplk/obd.h:419
      objSize : aliased tObdSize;  -- ./oplk/obd.h:420
   end record;
   pragma Convention (C_Pass_By_Copy, tObdCbStoreParam);  -- ./oplk/obd.h:421

   --  skipped anonymous struct anon_67

   type tInitTabEntryCallback is access function (arg1 : System.Address; arg2 : unsigned) return oplk.errordefs_h.tOplkError;
   pragma Convention (C, tInitTabEntryCallback);  -- ./oplk/obd.h:423

   type tObdStoreLoadCallback is access function (arg1 : access tObdCbStoreParam) return oplk.errordefs_h.tOplkError;
   pragma Convention (C, tObdStoreLoadCallback);  -- ./oplk/obd.h:424

  --*
  --\brief Enumeration for Node ID setting types
  --This structure defines constants for the types of setting the node ID.
  --They are used in the function obd_setNodeId()
  -- 

  --/< unknown how the node id was set
  --/< node id set by software
  --/< node id set by hardware
   type tObdNodeIdType is 
     (kObdNodeIdUnknown,
      kObdNodeIdSoftware,
      kObdNodeIdHardware);
   pragma Convention (C, tObdNodeIdType);  -- ./oplk/obd.h:437

  --------------------------------------------------------------------------------
  -- function prototypes
  --------------------------------------------------------------------------------
   function obd_init (pInitParam_p : access tObdInitParam) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:446
   pragma Import (C, obd_init, "obd_init");

   function obd_deleteInstance return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:447
   pragma Import (C, obd_deleteInstance, "obd_deleteInstance");

   function obd_writeEntry
     (index_p : unsigned;
      subIndex_p : unsigned;
      pSrcData_p : System.Address;
      size_p : tObdSize) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:448
   pragma Import (C, obd_writeEntry, "obd_writeEntry");

   function obd_readEntry
     (index_p : unsigned;
      subIndex_p : unsigned;
      pDstData_p : System.Address;
      pSize_p : access tObdSize) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:449
   pragma Import (C, obd_readEntry, "obd_readEntry");

   function obd_accessOdPart (obdPart_p : tObdPart; direction_p : tObdDir) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:450
   pragma Import (C, obd_accessOdPart, "obd_accessOdPart");

   function obd_defineVar (pVarParam_p : access tVarParam) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:451
   pragma Import (C, obd_defineVar, "obd_defineVar");

   function obd_getObjectDataPtr (index_p : unsigned; subIndex_p : unsigned) return System.Address;  -- ./oplk/obd.h:452
   pragma Import (C, obd_getObjectDataPtr, "obd_getObjectDataPtr");

   function obd_registerUserOd (pUserOd_p : tObdEntryPtr) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:453
   pragma Import (C, obd_registerUserOd, "obd_registerUserOd");

   procedure obd_initVarEntry
     (pVarEntry_p : access tObdVarEntry;
      type_p : tObdType;
      obdSize_p : tObdSize);  -- ./oplk/obd.h:454
   pragma Import (C, obd_initVarEntry, "obd_initVarEntry");

   function obd_getDataSize (index_p : unsigned; subIndex_p : unsigned) return tObdSize;  -- ./oplk/obd.h:455
   pragma Import (C, obd_getDataSize, "obd_getDataSize");

   function obd_getNodeId return unsigned;  -- ./oplk/obd.h:456
   pragma Import (C, obd_getNodeId, "obd_getNodeId");

   function obd_setNodeId (nodeId_p : unsigned; nodeIdType_p : tObdNodeIdType) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:457
   pragma Import (C, obd_setNodeId, "obd_setNodeId");

   function obd_isNumerical
     (index_p : unsigned;
      subIndex_p : unsigned;
      pfEntryNumerical_p : access unsigned_char) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:458
   pragma Import (C, obd_isNumerical, "obd_isNumerical");

   function obd_getType
     (index_p : unsigned;
      subIndex_p : unsigned;
      pType_p : access tObdType) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:459
   pragma Import (C, obd_getType, "obd_getType");

   function obd_writeEntryFromLe
     (index_p : unsigned;
      subIndex_p : unsigned;
      pSrcData_p : System.Address;
      size_p : tObdSize) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:460
   pragma Import (C, obd_writeEntryFromLe, "obd_writeEntryFromLe");

   function obd_readEntryToLe
     (index_p : unsigned;
      subIndex_p : unsigned;
      pDstData_p : System.Address;
      pSize_p : access tObdSize) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:461
   pragma Import (C, obd_readEntryToLe, "obd_readEntryToLe");

   function obd_getAccessType
     (index_p : unsigned;
      subIndex_p : unsigned;
      pAccessType_p : access tObdAccess) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:462
   pragma Import (C, obd_getAccessType, "obd_getAccessType");

   function obd_searchVarEntry
     (index_p : unsigned;
      subindex_p : unsigned;
      ppVarEntry_p : System.Address) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:463
   pragma Import (C, obd_searchVarEntry, "obd_searchVarEntry");

   function obd_initObd (pInitParam_p : access tObdInitParam) return oplk.errordefs_h.tOplkError;  -- ./oplk/obd.h:465
   pragma Import (C, obd_initObd, "obd_initObd");

end oplk.obd_h;
