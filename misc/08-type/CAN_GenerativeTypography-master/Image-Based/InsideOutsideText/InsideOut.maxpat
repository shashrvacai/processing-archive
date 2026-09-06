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
		"rect" : [ 1918.0, 671.0, 519.0, 644.0 ],
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
					"id" : "obj-12",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 120.0, 289.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 830.0, 192.0, 29.5, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 387.285714626312256, 197.0, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 709.0, 173.0, 29.5, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 352.0, 197.0, 29.5, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-2",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 798.600311994552612, 262.670734226703644, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 76.610748291015625, 286.992733955383301, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 873.311676740646362, 262.670734226703644, 80.0, 22.0 ],
					"text" : "prepend /pT3"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-1",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 181.199999690055847, 343.670734226703644, 210.322036743164062, 69.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 69.545273661613464, 155.678571403026581, 58.322036743164062, 110.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[1]",
							"parameter_mmax" : 128.0
						}

					}
,
					"varname" : "slider[1]"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-9",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 599.600311994552612, 427.670734226703644, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 247.610748291015625, 287.992733955383301, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 466.153030395507812, 427.670734226703644, 110.0, 22.0 ],
					"text" : "scale 0 127 15 100"
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
					"patching_rect" : [ 301.0, 427.670734226703644, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.902416467666626, 153.0, 53.322036743164062, 110.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[7]",
							"parameter_mmax" : 128.0
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
					"patching_rect" : [ 674.311676740646362, 427.670734226703644, 80.0, 22.0 ],
					"text" : "prepend /pT2"
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
					"patching_rect" : [ 608.800311684608459, 375.670734226703644, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 165.610748291015625, 323.992733955383301, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 475.35303008556366, 375.670734226703644, 110.0, 22.0 ],
					"text" : "scale 0 127 30 200"
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
					"patching_rect" : [ 289.199999690055847, 309.670734226703644, 146.322036743164062, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.902416467666626, 93.992733955383301, 75.322036743164062, 208.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "slider[5]",
							"parameter_type" : 0,
							"parameter_longname" : "slider[6]",
							"parameter_mmax" : 128.0
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
					"patching_rect" : [ 683.511676430702209, 375.670734226703644, 80.0, 22.0 ],
					"text" : "prepend /pT1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 802.048849880695343, 475.904771208763123, 138.0, 22.0 ],
					"text" : "udpsend 127.0.0.1 9600"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 190.699999690055847, 421.670734226703644, 453.776514887809753, 421.670734226703644, 453.776514887809753, 364.670734226703644, 484.85303008556366, 364.670734226703644 ],
					"order" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"order" : 1,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-124", 0 ],
					"midpoints" : [ 618.300311684608459, 407.670734226703644, 670.910231709480286, 407.670734226703644, 670.910231709480286, 364.670734226703644, 693.011676430702209, 364.670734226703644 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"midpoints" : [ 484.85303008556366, 407.670764744281769, 595.658116459846497, 407.670764744281769, 595.658116459846497, 364.670764744281769, 618.300311684608459, 364.670764744281769 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 298.699999690055847, 407.670764744281769, 468.801941514015198, 407.670764744281769, 468.801941514015198, 364.670764744281769, 484.85303008556366, 364.670764744281769 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 693.011676430702209, 419.221085876226425, 811.548849880695343, 419.221085876226425 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"midpoints" : [ 475.653030395507812, 459.670764744281769, 586.458116769790649, 459.670764744281769, 586.458116769790649, 416.670764744281769, 609.100311994552612, 416.670764744281769 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"midpoints" : [ 310.5, 459.670764744281769, 459.601941823959351, 459.670764744281769, 459.601941823959351, 416.670764744281769, 475.653030395507812, 416.670764744281769 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"midpoints" : [ 808.100311994552612, 294.670734226703644, 860.710232019424438, 294.670734226703644, 860.710232019424438, 251.670734226703644, 882.811676740646362, 251.670734226703644 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"midpoints" : [ 683.811676740646362, 462.287752717733383, 811.548849880695343, 462.287752717733383 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"midpoints" : [ 609.100311994552612, 459.670734226703644, 661.710232019424438, 459.670734226703644, 661.710232019424438, 416.670734226703644, 683.811676740646362, 416.670734226703644 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-16" : [ "slider[7]", "slider[5]", 0 ],
			"obj-123" : [ "slider[6]", "slider[5]", 0 ],
			"obj-1" : [ "slider[1]", "slider[5]", 0 ],
			"parameterbanks" : 			{

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
