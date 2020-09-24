/*****************************************************************************
 * Copyright (c) 2015 Rowley Associates Limited.                             *
 *                                                                           *
 * This file may be distributed under the terms of the License Agreement     *
 * provided with this software.                                              *
 *                                                                           *
 * THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE   *
 * WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. *
 *                                                                           *
 *****************************************************************************/

function Reset()
{
  // Reset the target
  TargetInterface.stopAndReset(100);
}

function GetPartName()
{
  var chipid = TargetInterface.peekWord(0x400E0940);
  var exid = TargetInterface.peekWord(0x400E0944);
  var version = chipid & 0xF;
  var nvpsiz = (chipid >> 8) & 0xF;
  var arch = (chipid >> 20) & 0xFF;
  var pidid = "";
  var rev_id = "";
  var flash_id = "";

  switch (exid)
    {
      case 0:
        pin_id = "J";
        break;
      case 1:
        pin_id = "N";
        break;
      case 2:
        pin_id = "Q";
        break;
      default:
        return "";
    }

  switch (version)
    {
      case 0:
        rev_id = "";
        break;
      case 1:
        rev_id = "B";
        break;
      default:
        return "";
    }

  switch (nvpsiz)
    {
      case 0xA:
        flash_id = "19";
        break;
      case 0xC:
        flash_id = "20";
        break;
      case 0xE:
        flash_id = "21";
        break;
      default:
        return "";
    }

  switch (arch)
    {
      case 0x10:
        series_id = "E70";
        break;
      case 0x11:
        series_id = "S70";
        break;
      case 0x12:
        series_id = "V71";
        break;
      case 0x13:
        series_id = "V70";
        break;
      default:
        return "";
    }

  return "ATSAM" + series_id + pin_id + flash_id + rev_id;
}

function MatchPartName(name)
{
  var partName = GetPartName();

  if (partName == "")
    return false;

  return partName.indexOf(name) != -1;

}

function EnableTrace(traceInterfaceType)
{
}

function EnableTCM()
{
  TargetInterface.pokeWord(0xE000EF90, 7);
  TargetInterface.pokeWord(0xE000EF94, 7);
}

