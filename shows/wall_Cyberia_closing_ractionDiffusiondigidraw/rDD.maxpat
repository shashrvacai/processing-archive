{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 415.0, 127.0, 1320.0, 1175.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-9",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 583.522383987903595, 1493.170734226703644, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 546.992733955383301, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.075102388858795, 1493.170734226703644, 103.0, 22.0 ],
					"text" : "scale 0 127 2 500"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-16",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 284.922071993350983, 1493.170734226703644, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.902416467666626, 546.992733955383301, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[7]"
						}

					}
,
					"varname" : "slider[7]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 658.233748733997345, 1493.170734226703644, 94.0, 22.0 ],
					"text" : "prepend /rDD16"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 959.216336727142334, 479.11492931842804, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 261.440341472625732, 63.956298410892487, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[7]"
						}

					}
,
					"varname" : "button[7]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 782.250821590423584, 479.11492931842804, 39.0, 22.0 ],
					"text" : "0.552"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.250821590423584, 478.770111203193665, 39.0, 22.0 ],
					"text" : "0.057"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.250821590423584, 478.42529308795929, 39.0, 22.0 ],
					"text" : "0.075"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 661.066678524017334, 478.42529308795929, 39.0, 22.0 ],
					"text" : "0.321"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 623.652860164642334, 478.42529308795929, 39.0, 22.0 ],
					"text" : "0.825"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 959.216336727142334, 416.114928603172302, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 302.302417278289795, 63.956298410892487, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[6]"
						}

					}
,
					"varname" : "button[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 782.250821590423584, 416.114928603172302, 39.0, 22.0 ],
					"text" : "1.209"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.250821590423584, 415.770110487937927, 39.0, 22.0 ],
					"text" : "0.061"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.250821590423584, 415.425292372703552, 39.0, 22.0 ],
					"text" : "0.038"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 661.066678524017334, 415.425292372703552, 39.0, 22.0 ],
					"text" : "0.369"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 623.652860164642334, 415.425292372703552, 39.0, 22.0 ],
					"text" : "0.817"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 959.216336727142334, 353.914927899837494, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 340.302417278289795, 63.956298410892487, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[5]"
						}

					}
,
					"varname" : "button[5]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 782.250821590423584, 353.914927899837494, 39.0, 22.0 ],
					"text" : "1.209"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.250821590423584, 353.570109784603119, 39.0, 22.0 ],
					"text" : "0.066"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 702.250821590423584, 353.225291669368744, 39.0, 22.0 ],
					"text" : "0.078"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 661.066678524017334, 353.225291669368744, 39.0, 22.0 ],
					"text" : "0.127"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 623.652860164642334, 353.225291669368744, 39.0, 22.0 ],
					"text" : "0.828"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-121",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 592.722383677959442, 1441.170734226703644, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 514.992733955383301, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 459.275102078914642, 1441.170734226703644, 97.0, 22.0 ],
					"text" : "scale 0 127 1 60"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-123",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 294.12207168340683, 1441.170734226703644, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.902416467666626, 514.992733955383301, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[6]"
						}

					}
,
					"varname" : "slider[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.433748424053192, 1441.170734226703644, 108.634146332740784, 22.0 ],
					"text" : "prepend /rDD15"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-112",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 592.722383677959442, 1382.209759652614594, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.702417612075806, 481.901679515838623, 41.404779076576233, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.433748424053192, 1382.209759652614594, 94.0, 22.0 ],
					"text" : "prepend /rDD14"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-114",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 592.722383677959442, 1335.20975935459137, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.265536248683929, 481.901679515838623, 39.122035145759583, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.433748424053192, 1335.20975935459137, 94.0, 22.0 ],
					"text" : "prepend /rDD13"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"format" : 6,
					"id" : "obj-116",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 588.63374650478363, 1289.009757697582245, 52.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.057741615273301, 481.901679515838623, 40.399999856948853, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 663.34511125087738, 1289.009757697582245, 94.0, 22.0 ],
					"text" : "prepend /rDD12"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-119",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 588.63374650478363, 1247.609758734703064, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.902416467666626, 481.901679515838623, 43.004778325557709, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 663.34511125087738, 1247.609758734703064, 93.0, 22.0 ],
					"text" : "prepend /rDD11"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-110",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 588.63374650478363, 1201.009757697582245, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.702417612075806, 393.901677846908569, 41.404779076576233, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 663.34511125087738, 1201.009757697582245, 94.0, 22.0 ],
					"text" : "prepend /rDD10"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-108",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 588.63374650478363, 1159.40975695848465, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.265536248683929, 393.901677846908569, 39.436881363391876, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 663.34511125087738, 1159.40975695848465, 87.0, 22.0 ],
					"text" : "prepend /rDD9"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"format" : 6,
					"id" : "obj-106",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 588.63374650478363, 1118.809756398200989, 64.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.057741615273301, 393.901677846908569, 39.982600179217457, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 663.34511125087738, 1118.809756398200989, 87.0, 22.0 ],
					"text" : "prepend /rDD8"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-104",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 1069.409755945205688, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 393.901677846908569, 43.599999904632568, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 1069.409755945205688, 87.0, 22.0 ],
					"text" : "prepend /rDD7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.075102388858795, 1388.809759318828583, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.075102388858795, 1281.609758734703064, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.075102388858795, 1320.409758806228638, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.075102388858795, 1247.609758734703064, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 1196.209757506847382, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 1156.209756731987, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 1110.809756278991699, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 1069.409755945205688, 97.0, 22.0 ],
					"text" : "scale 0 127 0. 1."
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.349019607843137, 0.349019607843137, 0.349019607843137, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-74",
					"knobcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 277.722071886062622, 1396.809759318828583, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.702417612075806, 422.701678514480591, 41.404779076576233, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.517647058823529, 0.780392156862745, 0.941176470588235, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-75",
					"knobcolor" : [ 0.0, 0.368627450980392, 0.996078431372549, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 277.722071886062622, 1320.409758806228638, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.580382466316223, 422.701678514480591, 39.122035145759583, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.623529411764706, 0.901960784313726, 0.63921568627451, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-76",
					"knobcolor" : [ 0.52156862745098, 0.992156862745098, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 277.722071886062622, 1285.609758734703064, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.057741615273301, 422.701678514480591, 39.982600179217457, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.454901960784314, 0.454901960784314, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.972549019607843, 0.972549019607843, 1.0 ],
					"id" : "obj-77",
					"knobcolor" : [ 0.992156862745098, 0.141176470588235, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 277.722071886062622, 1251.609758734703064, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 422.701678514480591, 43.122035205364227, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.349019607843137, 0.349019607843137, 0.349019607843137, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-72",
					"knobcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 286.522072017192841, 1201.009757697582245, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 351.14139997959137, 337.101677238941193, 40.965796709060669, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.517647058823529, 0.780392156862745, 0.941176470588235, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-71",
					"knobcolor" : [ 0.0, 0.368627450980392, 0.996078431372549, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 286.522072017192841, 1156.209756731987, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 309.265536248683929, 337.101677238941193, 39.436881363391876, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.623529411764706, 0.901960784313726, 0.63921568627451, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.996078431372549, 0.996078431372549, 1.0 ],
					"id" : "obj-70",
					"knobcolor" : [ 0.52156862745098, 0.992156862745098, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 286.522072017192841, 1110.809756278991699, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 267.057741615273301, 337.101677238941193, 39.982600179217457, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.454901960784314, 0.454901960784314, 1.0 ],
					"elementcolor" : [ 0.996078431372549, 0.972549019607843, 0.972549019607843, 1.0 ],
					"id" : "obj-41",
					"knobcolor" : [ 0.992156862745098, 0.141176470588235, 0.0, 1.0 ],
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 286.522072017192841, 1069.409755945205688, 146.322036743164062, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 337.101677238941193, 43.922035217285156, 54.800000607967377 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2601.366798877716064, 778.666668653488159, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2447.366798877716064, 868.416668653488159, 79.0, 23.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2447.366798877716064, 897.416668653488159, 194.5, 23.0 ],
					"text" : "0.702108 0.586474 0.923199 1."
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.702108263969421, 0.586474299430847, 0.923199415206909, 1.0 ],
					"border" : 1,
					"bordercolor" : [ 0.402352094650269, 0.802361130714417, 0.569913327693939, 1.0 ],
					"id" : "obj-28",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2564.366798877716064, 839.416668653488159, 88.0, 23.5 ],
					"rounded" : 0
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2389.491798877716064, 670.480229139328003, 177.75, 25.0 ],
					"text" : "Open Color dialog box."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 2352.116798877716064, 670.480229139328003, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "bang" ],
					"patching_rect" : [ 2447.366798877716064, 750.666668653488159, 173.0, 23.0 ],
					"text" : "colorpicker @compatibility 0"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-26",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 2626.366798877716064, 741.166668653488159, 140.75, 40.0 ],
					"text" : "Double-click opens dialog box, too."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 2564.366798877716064, 807.916668653488159, 106.0, 23.0 ],
					"text" : "prepend bgcolor"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 965.283007860183716, 58.114924311637878, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 340.302417278289795, 98.289633214473724, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[4]"
						}

					}
,
					"varname" : "button[4]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 788.317492723464966, 58.114924311637878, 39.0, 22.0 ],
					"text" : "0.685"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 748.317492723464966, 57.770106196403503, 32.0, 22.0 ],
					"text" : "0.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.317492723464966, 57.425288081169128, 39.0, 22.0 ],
					"text" : "0.061"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.133349657058716, 57.425288081169128, 39.0, 22.0 ],
					"text" : "0.373"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 629.719531297683716, 57.425288081169128, 39.0, 22.0 ],
					"text" : "1.021"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 965.283007860183716, 120.114924311637878, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 302.302417278289795, 98.289633214473724, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[3]"
						}

					}
,
					"varname" : "button[3]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 788.317492723464966, 120.114924311637878, 29.5, 22.0 ],
					"text" : "1.1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 748.317492723464966, 119.770106196403503, 32.0, 22.0 ],
					"text" : "0.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.317492723464966, 119.425288081169128, 32.0, 22.0 ],
					"text" : "0.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.133349657058716, 119.425288081169128, 32.0, 22.0 ],
					"text" : "0.29"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 629.719531297683716, 119.425288081169128, 32.0, 22.0 ],
					"text" : "0.96"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 965.283007860183716, 201.666651606559753, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 261.440341472625732, 98.289633214473724, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[2]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[2]"
						}

					}
,
					"varname" : "button[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 788.317492723464966, 201.666651606559753, 39.0, 22.0 ],
					"text" : "1.124"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 748.317492723464966, 201.321833491325378, 45.0, 22.0 ],
					"text" : "0.0562"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.317492723464966, 200.977015376091003, 39.0, 22.0 ],
					"text" : "0.101"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.133349657058716, 200.977015376091003, 38.0, 22.0 ],
					"text" : "0.119"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 629.719531297683716, 200.977015376091003, 32.0, 22.0 ],
					"text" : "0.85"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 965.283007860183716, 288.390787959098816, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 98.289633214473724, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button[1]",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button[1]"
						}

					}
,
					"varname" : "button[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 788.317492723464966, 288.390787959098816, 32.0, 22.0 ],
					"text" : "1.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 748.317492723464966, 288.045969843864441, 32.0, 22.0 ],
					"text" : "0.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 708.317492723464966, 287.701151728630066, 32.0, 22.0 ],
					"text" : "0.06"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 667.133349657058716, 287.701151728630066, 32.0, 22.0 ],
					"text" : "0.37"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 629.719531297683716, 287.701151728630066, 29.5, 22.0 ],
					"text" : "1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 148.592094600200653, 771.333339929580688, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.537939667701721, 132.019180297851562, 24.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1,
							"parameter_shortname" : "button",
							"parameter_enum" : [ "off", "on" ],
							"parameter_type" : 2,
							"parameter_longname" : "button"
						}

					}
,
					"varname" : "button"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-47",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.522072017192841, 711.757076501846313, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 172.023731827735901, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[1]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[1]"
						}

					}
,
					"varname" : "slider[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.437797725200653, 908.677700281143188, 104.2373046875, 20.0 ],
					"text" : "default (0--> 2)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.437797725200653, 833.508205652236938, 104.2373046875, 20.0 ],
					"text" : "default (0--> 0.2)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.437797725200653, 758.338711023330688, 104.2373046875, 20.0 ],
					"text" : "default (0--> 0.2)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.437797725200653, 683.169216394424438, 104.2373046875, 20.0 ],
					"text" : "default (0--> 2)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.949160218238831, 392.112711548805237, 104.2373046875, 20.0 ],
					"text" : "default (0--> 2)"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-61",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 1012.435024499893188, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 294.301677167415619, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 1012.435024499893188, 97.0, 22.0 ],
					"text" : "scale 0 127 1 40"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-63",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.522072017192841, 1012.435024499893188, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 294.301677167415619, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[5]"
						}

					}
,
					"varname" : "slider[5]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.522072017192841, 983.847194910049438, 146.322036743164062, 20.0 ],
					"text" : "i teration"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-57",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 937.265529870986938, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 263.93218320608139, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 937.265529870986938, 100.0, 22.0 ],
					"text" : "scale 0 127 0 1.2"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-59",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.522072017192841, 937.265529870986938, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 263.93218320608139, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[4]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[4]"
						}

					}
,
					"varname" : "slider[4]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.522072017192841, 908.677700281143188, 146.322036743164062, 33.0 ],
					"text" : "dt = delta t (change in time for each iteration)"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-53",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 862.096035242080688, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 235.16268926858902, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 862.096035242080688, 123.0, 22.0 ],
					"text" : "scale 0 127 0.05 0.07"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-55",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.522072017192841, 862.096035242080688, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 235.16268926858902, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[3]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[3]"
						}

					}
,
					"varname" : "slider[3]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.522072017192841, 833.508205652236938, 146.322036743164062, 20.0 ],
					"text" : "k= kill rate"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-49",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 786.926540613174438, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 203.993195295333862, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 786.926540613174438, 117.0, 22.0 ],
					"text" : "scale 0 127 0.02 0.1"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-51",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 286.522072017192841, 786.926540613174438, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 203.993195295333862, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider[2]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[2]"
						}

					}
,
					"varname" : "slider[2]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.522072017192841, 758.338711023330688, 146.322036743164062, 20.0 ],
					"text" : "f = feed scale by (1-A)"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-45",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 711.757076501846313, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 172.023731827735901, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 711.757076501846313, 100.0, 22.0 ],
					"text" : "scale 0 127 0 0.5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 286.522072017192841, 683.169216394424438, 146.322036743164062, 20.0 ],
					"text" : "dB = diffusion rate of B "
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-44",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 585.122384011745453, 643.367244958877563, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 380.610748291015625, 139.571840286254883, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.675102412700653, 643.367244958877563, 110.0, 22.0 ],
					"text" : "scale 0 127 0.5 1.2"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-36",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 283.073799312114716, 642.505184412002563, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.785159587860107, 139.571840286254883, 146.322036743164062, 22.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 128.0,
							"parameter_shortname" : "slider",
							"parameter_type" : 0,
							"parameter_longname" : "slider"
						}

					}
,
					"varname" : "slider"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 1012.435024499893188, 87.0, 22.0 ],
					"text" : "prepend /rDD6"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-21",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1967.616475820541382, 462.650863647460938, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1967.616475820541382, 396.367202758789062, 97.0, 22.0 ],
					"text" : "scale -67 6 0. 10"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-18",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1967.616475820541382, 338.076400756835938, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 1923.169576406478882, 73.813545227050781, 75.0, 22.0 ],
					"text" : "adc~ 1 2 3 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2145.057760000228882, 125.166046142578125, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1006.7215576171875, 132.019180297851562, 48.0, 136.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~[8]"
						}

					}
,
					"varname" : "live.gain~[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-219",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1978.878560781478882, 130.166061401367188, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 822.375732421875, 132.019180297851562, 48.0, 136.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~"
						}

					}
,
					"varname" : "live.gain~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-199",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 2063.057760000228882, 125.166046142578125, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 911.7215576171875, 132.019180297851562, 48.0, 136.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~[4]"
						}

					}
,
					"varname" : "live.gain~[4]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-205",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1895.593852400779724, 130.166061401367188, 48.0, 136.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 733.821533203125, 128.019180297851562, 48.0, 136.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 6.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~[6]"
						}

					}
,
					"varname" : "live.gain~[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.033434510231018, 392.112711548805237, 146.322036743164062, 20.0 ],
					"text" : "dA = diffusion rate of A "
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 937.265529870986938, 87.0, 22.0 ],
					"text" : "prepend /rDD5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 862.096035242080688, 87.0, 22.0 ],
					"text" : "prepend /rDD4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 786.926540613174438, 87.0, 22.0 ],
					"text" : "prepend /rDD3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 711.757076501846313, 87.0, 22.0 ],
					"text" : "prepend /rDD2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 659.833748757839203, 643.367244958877563, 87.0, 22.0 ],
					"text" : "prepend /rDD1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 785.970921874046326, 1541.404771208763123, 138.0, 22.0 ],
					"text" : "udpsend 127.0.0.1 9600"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-219", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 639.219531297683716, 158.162927985191345, 594.622384011745453, 158.162927985191345 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"midpoints" : [ 459.575102388858795, 1313.609758734703064, 560.587759345769882, 1313.609758734703064, 560.587759345769882, 1278.009757697582245, 598.13374650478363, 1278.009757697582245 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 459.575102388858795, 1352.409758806228638, 565.832077980041504, 1352.409758806228638, 565.832077980041504, 1324.20975935459137, 602.222383677959442, 1324.20975935459137 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 459.575102388858795, 1279.609758734703064, 566.187759429216385, 1279.609758734703064, 566.187759429216385, 1236.609758734703064, 598.13374650478363, 1236.609758734703064 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"midpoints" : [ 594.622384011745453, 1101.409755945205688, 647.232304036617279, 1101.409755945205688, 647.232304036617279, 1058.409755945205688, 669.333748757839203, 1058.409755945205688 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 1101.240593791007996, 795.470921874046326, 1101.240593791007996 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"midpoints" : [ 598.13374650478363, 1150.809756398200989, 650.743666529655457, 1150.809756398200989, 650.743666529655457, 1107.809756398200989, 672.84511125087738, 1107.809756398200989 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 672.84511125087738, 1148.340594351291656, 795.470921874046326, 1148.340594351291656 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"midpoints" : [ 598.13374650478363, 1191.40975695848465, 650.743666529655457, 1191.40975695848465, 650.743666529655457, 1148.40975695848465, 672.84511125087738, 1148.40975695848465 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 672.84511125087738, 1189.44059494137764, 795.470921874046326, 1189.44059494137764 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 817.598984003067017, 795.470921874046326, 817.598984003067017 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"midpoints" : [ 598.13374650478363, 1233.009757697582245, 650.743666529655457, 1233.009757697582245, 650.743666529655457, 1190.009757697582245, 672.84511125087738, 1190.009757697582245 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 672.84511125087738, 1232.640595644712448, 795.470921874046326, 1232.640595644712448 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 602.222383677959442, 1414.209759652614594, 654.832303702831268, 1414.209759652614594, 654.832303702831268, 1371.209759652614594, 676.933748424053192, 1371.209759652614594 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 676.933748424053192, 1426.440598160028458, 795.470921874046326, 1426.440598160028458 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"midpoints" : [ 602.222383677959442, 1367.20975935459137, 654.832303702831268, 1367.20975935459137, 654.832303702831268, 1324.20975935459137, 676.933748424053192, 1324.20975935459137 ],
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 676.933748424053192, 1374.940597593784332, 795.470921874046326, 1374.940597593784332 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"midpoints" : [ 598.13374650478363, 1321.009757697582245, 650.743666529655457, 1321.009757697582245, 650.743666529655457, 1278.009757697582245, 672.84511125087738, 1278.009757697582245 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 681.019335210323334, 795.470921874046326, 681.019335210323334 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 672.84511125087738, 1324.640596359968185, 795.470921874046326, 1324.640596359968185 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"midpoints" : [ 598.13374650478363, 1279.609758734703064, 650.743666529655457, 1279.609758734703064, 650.743666529655457, 1236.609758734703064, 672.84511125087738, 1236.609758734703064 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 672.84511125087738, 1275.140596449375153, 795.470921874046326, 1275.140596449375153 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"midpoints" : [ 602.222383677959442, 1473.170734226703644, 654.832303702831268, 1473.170734226703644, 654.832303702831268, 1430.170734226703644, 676.933748424053192, 1430.170734226703644 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"midpoints" : [ 468.775102078914642, 1473.170764744281769, 579.580188453197479, 1473.170764744281769, 579.580188453197479, 1430.170764744281769, 602.222383677959442, 1430.170764744281769 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 303.62207168340683, 1473.170764744281769, 452.72401350736618, 1473.170764744281769, 452.72401350736618, 1430.170764744281769, 468.775102078914642, 1430.170764744281769 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 676.933748424053192, 1484.721085876226425, 795.470921874046326, 1484.721085876226425 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"midpoints" : [ 968.716336727142334, 450.114928603172302, 944.888754963874817, 450.114928603172302, 944.888754963874817, 405.114928603172302, 791.750821590423584, 405.114928603172302 ],
					"order" : 0,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"midpoints" : [ 968.716336727142334, 450.114928603172302, 924.026685953140259, 450.114928603172302, 924.026685953140259, 404.770110487937927, 751.750821590423584, 404.770110487937927 ],
					"order" : 1,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"midpoints" : [ 968.716336727142334, 450.114928603172302, 905.750823974609375, 450.114928603172302, 905.750823974609375, 404.425292372703552, 711.750821590423584, 404.425292372703552 ],
					"order" : 2,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"midpoints" : [ 968.716336727142334, 450.114928603172302, 884.296683430671692, 450.114928603172302, 884.296683430671692, 404.425292372703552, 670.566678524017334, 404.425292372703552 ],
					"order" : 3,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"midpoints" : [ 968.716336727142334, 450.114928603172302, 858.693222165107727, 450.114928603172302, 858.693222165107727, 403.625292360782623, 633.152860164642334, 403.625292360782623 ],
					"order" : 4,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 791.750821590423584, 462.656892538070679, 594.622384011745453, 462.656892538070679 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 751.750821590423584, 460.09973669052124, 594.622384011745453, 460.09973669052124 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 711.750821590423584, 461.542580902576447, 594.622384011745453, 461.542580902576447 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 670.566678524017334, 461.557849407196045, 594.622384011745453, 461.557849407196045 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 633.152860164642334, 460.962934136390686, 594.622384011745453, 460.962934136390686 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"midpoints" : [ 968.716336727142334, 513.11492931842804, 944.888754963874817, 513.11492931842804, 944.888754963874817, 468.11492931842804, 791.750821590423584, 468.11492931842804 ],
					"order" : 0,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"midpoints" : [ 968.716336727142334, 513.11492931842804, 924.026685953140259, 513.11492931842804, 924.026685953140259, 467.770111203193665, 751.750821590423584, 467.770111203193665 ],
					"order" : 1,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"midpoints" : [ 968.716336727142334, 513.11492931842804, 905.750823974609375, 513.11492931842804, 905.750823974609375, 467.42529308795929, 711.750821590423584, 467.42529308795929 ],
					"order" : 2,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-135", 0 ],
					"midpoints" : [ 968.716336727142334, 513.11492931842804, 884.296683430671692, 513.11492931842804, 884.296683430671692, 467.42529308795929, 670.566678524017334, 467.42529308795929 ],
					"order" : 3,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"midpoints" : [ 968.716336727142334, 513.11492931842804, 858.693222165107727, 513.11492931842804, 858.693222165107727, 466.625293076038361, 633.152860164642334, 466.625293076038361 ],
					"order" : 4,
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 791.750821590423584, 511.756893157958984, 594.622384011745453, 511.756893157958984 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 751.750821590423584, 511.599737346172333, 594.622384011745453, 511.599737346172333 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 711.750821590423584, 511.442581534385681, 594.622384011745453, 511.442581534385681 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 670.566678524017334, 511.45785003900528, 594.622384011745453, 511.45785003900528 ],
					"source" : [ "obj-135", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 633.152860164642334, 511.66293478012085, 594.622384011745453, 511.66293478012085 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 893.583731889724731, 795.470921874046326, 893.583731889724731 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 459.575102388858795, 1525.170764744281769, 570.380188763141632, 1525.170764744281769, 570.380188763141632, 1482.170764744281769, 593.022383987903595, 1482.170764744281769 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"midpoints" : [ 294.422071993350983, 1525.170764744281769, 443.524013817310333, 1525.170764744281769, 443.524013817310333, 1482.170764744281769, 459.575102388858795, 1482.170764744281769 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 971.168479800224304, 795.470921874046326, 971.168479800224304 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 974.783007860183716, 92.114924311637878, 950.955426096916199, 92.114924311637878, 950.955426096916199, 47.114924311637878, 797.817492723464966, 47.114924311637878 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"midpoints" : [ 974.783007860183716, 92.114924311637878, 930.093357086181641, 92.114924311637878, 930.093357086181641, 46.770106196403503, 757.817492723464966, 46.770106196403503 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 974.783007860183716, 92.114924311637878, 911.817495107650757, 92.114924311637878, 911.817495107650757, 46.425288081169128, 717.817492723464966, 46.425288081169128 ],
					"order" : 2,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"midpoints" : [ 974.783007860183716, 92.114924311637878, 890.363354563713074, 92.114924311637878, 890.363354563713074, 46.425288081169128, 676.633349657058716, 46.425288081169128 ],
					"order" : 3,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"midpoints" : [ 974.783007860183716, 92.114924311637878, 864.759893298149109, 92.114924311637878, 864.759893298149109, 46.425288081169128, 639.219531297683716, 46.425288081169128 ],
					"order" : 4,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 667.733748733997345, 1527.787752717733383, 795.470921874046326, 1527.787752717733383 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-205", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 1,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"order" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 797.817492723464966, 91.856890320777893, 594.622384011745453, 91.856890320777893 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 1041.553227603435516, 795.470921874046326, 1041.553227603435516 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"midpoints" : [ 968.716336727142334, 387.914927899837494, 944.888754963874817, 387.914927899837494, 944.888754963874817, 342.914927899837494, 791.750821590423584, 342.914927899837494 ],
					"order" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"midpoints" : [ 968.716336727142334, 387.914927899837494, 924.026685953140259, 387.914927899837494, 924.026685953140259, 342.570109784603119, 751.750821590423584, 342.570109784603119 ],
					"order" : 1,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"midpoints" : [ 968.716336727142334, 387.914927899837494, 905.750823974609375, 387.914927899837494, 905.750823974609375, 342.225291669368744, 711.750821590423584, 342.225291669368744 ],
					"order" : 2,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 968.716336727142334, 387.914927899837494, 884.296683430671692, 387.914927899837494, 884.296683430671692, 342.225291669368744, 670.566678524017334, 342.225291669368744 ],
					"order" : 3,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 968.716336727142334, 387.914927899837494, 858.693222165107727, 387.914927899837494, 858.693222165107727, 341.425291657447815, 633.152860164642334, 341.425291657447815 ],
					"order" : 4,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"midpoints" : [ 292.573799312114716, 675.367244958877563, 445.124013841152191, 675.367244958877563, 445.124013841152191, 632.367244958877563, 461.175102412700653, 632.367244958877563 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 791.750821590423584, 396.356891661882401, 594.622384011745453, 396.356891661882401 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 751.750821590423584, 395.39973583817482, 594.622384011745453, 395.39973583817482 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 461.175102412700653, 675.367244958877563, 571.98018878698349, 675.367244958877563, 571.98018878698349, 632.367244958877563, 594.622384011745453, 632.367244958877563 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 757.817492723464966, 94.099733948707581, 594.622384011745453, 94.099733948707581 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 711.750821590423584, 394.442580014467239, 594.622384011745453, 394.442580014467239 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"midpoints" : [ 296.022072017192841, 1093.409755945205688, 440.598589062690735, 1093.409755945205688, 440.598589062690735, 1058.409755945205688, 461.175102412700653, 1058.409755945205688 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 670.566678524017334, 395.257848531007767, 594.622384011745453, 395.257848531007767 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 633.152860164642334, 395.462933272123337, 594.622384011745453, 395.462933272123337 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"midpoints" : [ 594.622384011745453, 675.367244958877563, 645.537388741970062, 675.367244958877563, 645.537388741970062, 632.367244958877563, 669.333748757839203, 632.367244958877563 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 594.622384011745453, 743.757076501846313, 644.689931094646454, 743.757076501846313, 644.689931094646454, 700.757076501846313, 669.333748757839203, 700.757076501846313 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 461.175102412700653, 743.757076501846313, 571.98018878698349, 743.757076501846313, 571.98018878698349, 700.757076501846313, 594.622384011745453, 700.757076501846313 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"midpoints" : [ 296.022072017192841, 743.757076501846313, 378.598587214946747, 743.757076501846313, 378.598587214946747, 700.757076501846313, 461.175102412700653, 700.757076501846313 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 594.622384011745453, 818.926540613174438, 645.771170556545258, 818.926540613174438, 645.771170556545258, 775.926540613174438, 669.333748757839203, 775.926540613174438 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 717.817492723464966, 96.342577576637268, 594.622384011745453, 96.342577576637268 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 461.175102412700653, 818.926571130752563, 571.98018878698349, 818.926571130752563, 571.98018878698349, 775.926571130752563, 594.622384011745453, 775.926571130752563 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 296.022072017192841, 818.926571130752563, 445.124013841152191, 818.926571130752563, 445.124013841152191, 775.926571130752563, 461.175102412700653, 775.926571130752563 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 594.622384011745453, 894.096035242080688, 644.909101545810699, 894.096035242080688, 644.909101545810699, 851.096035242080688, 669.333748757839203, 851.096035242080688 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 461.175102412700653, 894.096065759658813, 571.98018878698349, 894.096065759658813, 571.98018878698349, 851.096065759658813, 594.622384011745453, 851.096065759658813 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ 296.022072017192841, 894.096065759658813, 445.124013841152191, 894.096065759658813, 445.124013841152191, 851.096065759658813, 461.175102412700653, 851.096065759658813 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"midpoints" : [ 594.622384011745453, 969.265529870986938, 646.633239567279816, 969.265529870986938, 646.633239567279816, 926.265529870986938, 669.333748757839203, 926.265529870986938 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 461.175102412700653, 969.265560388565063, 571.98018878698349, 969.265560388565063, 571.98018878698349, 926.265560388565063, 594.622384011745453, 926.265560388565063 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"midpoints" : [ 296.022072017192841, 969.265560388565063, 445.124013841152191, 969.265560388565063, 445.124013841152191, 926.265560388565063, 461.175102412700653, 926.265560388565063 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 676.633349657058716, 93.757845520973206, 594.622384011745453, 93.757845520973206 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 594.622384011745453, 1044.435024499893188, 647.232304036617279, 1044.435024499893188, 647.232304036617279, 1001.435024499893188, 669.333748757839203, 1001.435024499893188 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"midpoints" : [ 461.175102412700653, 1044.435055017471313, 571.98018878698349, 1044.435055017471313, 571.98018878698349, 1001.435055017471313, 594.622384011745453, 1001.435055017471313 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"midpoints" : [ 296.022072017192841, 1044.435055017471313, 445.124013841152191, 1044.435055017471313, 445.124013841152191, 1001.435055017471313, 461.175102412700653, 1001.435055017471313 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 639.219531297683716, 93.162929177284241, 594.622384011745453, 93.162929177284241 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"midpoints" : [ 296.022072017192841, 1134.809756278991699, 440.598589062690735, 1134.809756278991699, 440.598589062690735, 1099.809756278991699, 461.175102412700653, 1099.809756278991699 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"midpoints" : [ 296.022072017192841, 1180.209756731987, 440.598589062690735, 1180.209756731987, 440.598589062690735, 1145.209756731987, 461.175102412700653, 1145.209756731987 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"midpoints" : [ 296.022072017192841, 1225.009757697582245, 439.265255689620972, 1225.009757697582245, 439.265255689620972, 1185.209757506847382, 461.175102412700653, 1185.209757506847382 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"order" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"order" : 6,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"order" : 7,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"order" : 5,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"order" : 4,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"order" : 3,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"order" : 2,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"order" : 1,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"midpoints" : [ 287.222071886062622, 1420.809759318828583, 433.398588925600052, 1420.809759318828583, 433.398588925600052, 1377.809759318828583, 459.575102388858795, 1377.809759318828583 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"midpoints" : [ 287.222071886062622, 1344.409758806228638, 432.73192223906517, 1344.409758806228638, 432.73192223906517, 1309.409758806228638, 459.575102388858795, 1309.409758806228638 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"midpoints" : [ 287.222071886062622, 1309.609758734703064, 432.065255552530289, 1309.609758734703064, 432.065255552530289, 1270.609758734703064, 459.575102388858795, 1270.609758734703064 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"midpoints" : [ 287.222071886062622, 1275.609758734703064, 434.065255612134933, 1275.609758734703064, 434.065255612134933, 1236.609758734703064, 459.575102388858795, 1236.609758734703064 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"midpoints" : [ 461.175102412700653, 1101.409755945205688, 572.432078301906586, 1101.409755945205688, 572.432078301906586, 1058.409755945205688, 594.622384011745453, 1058.409755945205688 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"midpoints" : [ 461.175102412700653, 1142.809756278991699, 567.787759453058243, 1142.809756278991699, 567.787759453058243, 1107.809756398200989, 598.13374650478363, 1107.809756398200989 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 669.333748757839203, 754.414251565933228, 795.470921874046326, 754.414251565933228 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"midpoints" : [ 461.175102412700653, 1188.209756731987, 566.987759441137314, 1188.209756731987, 566.987759441137314, 1148.40975695848465, 598.13374650478363, 1148.40975695848465 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 639.219531297683716, 330.70086282491684, 594.622384011745453, 330.70086282491684 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 676.633349657058716, 330.49577808380127, 594.622384011745453, 330.49577808380127 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 717.817492723464966, 329.680509567260742, 594.622384011745453, 329.680509567260742 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 757.817492723464966, 329.837665379047394, 594.622384011745453, 329.837665379047394 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 797.817492723464966, 328.394821166992188, 594.622384011745453, 328.394821166992188 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"midpoints" : [ 461.175102412700653, 1228.209757506847382, 569.387759476900101, 1228.209757506847382, 569.387759476900101, 1190.009757697582245, 598.13374650478363, 1190.009757697582245 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"midpoints" : [ 459.575102388858795, 1420.809759318828583, 557.832077860832214, 1420.809759318828583, 557.832077860832214, 1371.209759652614594, 602.222383677959442, 1371.209759652614594 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 974.783007860183716, 322.390787959098816, 864.759893298149109, 322.390787959098816, 864.759893298149109, 276.701151728630066, 639.219531297683716, 276.701151728630066 ],
					"order" : 4,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"midpoints" : [ 974.783007860183716, 322.390787959098816, 890.363354563713074, 322.390787959098816, 890.363354563713074, 276.701151728630066, 676.633349657058716, 276.701151728630066 ],
					"order" : 3,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"midpoints" : [ 974.783007860183716, 322.390787959098816, 911.817495107650757, 322.390787959098816, 911.817495107650757, 276.701151728630066, 717.817492723464966, 276.701151728630066 ],
					"order" : 2,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"midpoints" : [ 974.783007860183716, 322.390787959098816, 930.093357086181641, 322.390787959098816, 930.093357086181641, 277.045969843864441, 757.817492723464966, 277.045969843864441 ],
					"order" : 1,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"midpoints" : [ 974.783007860183716, 322.390787959098816, 950.955426096916199, 322.390787959098816, 950.955426096916199, 277.390787959098816, 797.817492723464966, 277.390787959098816 ],
					"order" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"midpoints" : [ 974.783007860183716, 235.666651606559753, 950.955426096916199, 235.666651606559753, 950.955426096916199, 190.666651606559753, 797.817492723464966, 190.666651606559753 ],
					"order" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"midpoints" : [ 974.783007860183716, 235.666651606559753, 930.093357086181641, 235.666651606559753, 930.093357086181641, 190.321833491325378, 757.817492723464966, 190.321833491325378 ],
					"order" : 1,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"midpoints" : [ 974.783007860183716, 235.666651606559753, 911.817495107650757, 235.666651606559753, 911.817495107650757, 189.977015376091003, 717.817492723464966, 189.977015376091003 ],
					"order" : 2,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"midpoints" : [ 974.783007860183716, 235.666651606559753, 890.363354563713074, 235.666651606559753, 890.363354563713074, 189.977015376091003, 676.633349657058716, 189.977015376091003 ],
					"order" : 3,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"midpoints" : [ 974.783007860183716, 235.666651606559753, 864.759893298149109, 235.666651606559753, 864.759893298149109, 189.977015376091003, 639.219531297683716, 189.977015376091003 ],
					"order" : 4,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 593.022383987903595, 1525.170734226703644, 645.632304012775421, 1525.170734226703644, 645.632304012775421, 1482.170734226703644, 667.733748733997345, 1482.170734226703644 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 797.817492723464966, 252.563777327537537, 594.622384011745453, 252.563777327537537 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 757.817492723464966, 251.875588417053223, 594.622384011745453, 251.875588417053223 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 717.817492723464966, 251.187399506568909, 594.622384011745453, 251.187399506568909 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 676.633349657058716, 253.257841944694519, 594.622384011745453, 253.257841944694519 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"midpoints" : [ 639.219531297683716, 253.338792443275452, 594.622384011745453, 253.338792443275452 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"midpoints" : [ 974.783007860183716, 154.114924311637878, 864.759893298149109, 154.114924311637878, 864.759893298149109, 108.425288081169128, 639.219531297683716, 108.425288081169128 ],
					"order" : 4,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 974.783007860183716, 154.114924311637878, 950.955426096916199, 154.114924311637878, 950.955426096916199, 109.114924311637878, 797.817492723464966, 109.114924311637878 ],
					"order" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"midpoints" : [ 974.783007860183716, 154.114924311637878, 930.093357086181641, 154.114924311637878, 930.093357086181641, 108.770106196403503, 757.817492723464966, 108.770106196403503 ],
					"order" : 1,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"midpoints" : [ 974.783007860183716, 154.114924311637878, 911.817495107650757, 154.114924311637878, 911.817495107650757, 108.425288081169128, 717.817492723464966, 108.425288081169128 ],
					"order" : 2,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"midpoints" : [ 974.783007860183716, 154.114924311637878, 890.363354563713074, 154.114924311637878, 890.363354563713074, 108.425288081169128, 676.633349657058716, 108.425288081169128 ],
					"order" : 3,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 797.817492723464966, 158.339635014533997, 594.622384011745453, 158.339635014533997 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 757.817492723464966, 155.927308082580566, 594.622384011745453, 155.927308082580566 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"midpoints" : [ 717.817492723464966, 156.963257193565369, 594.622384011745453, 156.963257193565369 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"midpoints" : [ 676.633349657058716, 157.309561610221863, 594.622384011745453, 157.309561610221863 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-63" : [ "slider[5]", "slider[5]", 0 ],
			"obj-123" : [ "slider[6]", "slider[5]", 0 ],
			"obj-35" : [ "button[5]", "button[2]", 0 ],
			"obj-161" : [ "live.gain~[8]", "live.gain~", 0 ],
			"obj-199" : [ "live.gain~[4]", "live.gain~", 0 ],
			"obj-51" : [ "slider[2]", "slider[2]", 0 ],
			"obj-16" : [ "slider[7]", "slider[5]", 0 ],
			"obj-89" : [ "button[2]", "button[2]", 0 ],
			"obj-2" : [ "button[4]", "button[2]", 0 ],
			"obj-59" : [ "slider[4]", "slider[4]", 0 ],
			"obj-125" : [ "button[6]", "button[2]", 0 ],
			"obj-36" : [ "slider", "slider", 0 ],
			"obj-219" : [ "live.gain~", "live.gain~", 0 ],
			"obj-55" : [ "slider[3]", "slider[3]", 0 ],
			"obj-95" : [ "button[3]", "button[2]", 0 ],
			"obj-131" : [ "button[7]", "button[2]", 0 ],
			"obj-73" : [ "button", "button", 0 ],
			"obj-205" : [ "live.gain~[6]", "live.gain~", 0 ],
			"obj-47" : [ "slider[1]", "slider[1]", 0 ],
			"obj-88" : [ "button[1]", "button[1]", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"parameter_map" : 		{
			"midi" : 			{
				"slider[5]" : 				{
					"srcname" : "14.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[4]" : 				{
					"srcname" : "13.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[3]" : 				{
					"srcname" : "12.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[2]" : 				{
					"srcname" : "11.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[1]" : 				{
					"srcname" : "10.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider" : 				{
					"srcname" : "9.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[7]" : 				{
					"srcname" : "16.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}
,
				"slider[6]" : 				{
					"srcname" : "15.ctrl.1.chan.midi",
					"min" : 0.0,
					"max" : 128.0,
					"flags" : 2
				}

			}

		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1 ],
						"angle" : 270,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
