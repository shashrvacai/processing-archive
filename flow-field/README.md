# flow-field

Weather for particles. A grid of arrows pointed by noise, and things dropped into it that go where the arrows say. First one November 2017 with a microphone shaking the whole field; two years of teaching it to listen after that.

Read the story: [Code 31: Weather for particles](https://www.shashrvacai.com/blog/code-31-weather-for-particles).

| Folder | Date | Where | What it is |
|---|---|---|---|
| 2017-11-14_flow_field_with_mic | 14 Nov 2017 | practice | FF.pde is born. 1,440 vehicles, mic level jitters the field, mouseX bends the noise. Contains the famous `noise(150000)` that does nothing |
| undated_ff_particles_basic, _kinect, _kinect_depth | 2018 | practice | the field lookup as a reusable tab, then the Kinect depth image as the field |
| 2018-04-23_flowers | Apr 2018 | practice | audio-reactive flowers riding the field |
| 2018-09-30_toxiclibs_noise_attractor, _kinect | 30 Sep 2018 | practice | toxiclibs attractor; the Kinect copy from the same evening |
| 2018-11-16_pixelflow_liquid | Nov 2018 | practice | first PixelFlow (Thomas Diewald) fluid |
| undated_magnetic_flow_field, _pixelflow_attractor*, _genetic_algorithm_evolve_field | 2018 to 2019 | practice | side roads: magnets, GPU attractors, a GA that breeds fields |
| 2019-06_cyberia_ff_* | Jun 2019 | Cyberia, TIFA | the show line. AttractorsTest grows a GUI, then sound and ControlP5 (+194 lines, almost all knobs) |
| 2019-06_cyberia_wall_ff_cohesion_* | Jun 2019 | Cyberia wall | PixelFlow cohesion particles, "with syphon to max .. added sliders .. with oscp5 connections" |
| 2019-06-20_ff_cohesion_kinect | 20 Jun 2019 | practice | the same with a body as the field |
| 2019_spilt_milk_ff_attractor_show_file | 2019 | Spilt Milk | eight tabs: Scene, INtros, Impulse, OSc_event. A show file |
| 2019-06-15_type_flow_field, _variant | 15 Jun 2019 | practice | letters as the only place the arrows may go. After Amnon Owed's Generative Typography examples (CAN, 2014) |
| undated_p5_flow_field_js | 2019 | practice | first p5.js port |

Data folders (Kinect depth frames, video) are not included. Libraries: processing.sound, toxiclibs, PixelFlow, SimpleOpenNI, ControlP5, oscP5, Syphon.
