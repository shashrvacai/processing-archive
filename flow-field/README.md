# flow-field

Weather for particles. A grid of arrows pointed by noise, and things dropped into it that go where the arrows say. First one November 2017 with a microphone shaking the whole field; two years of teaching it to listen after that.

Read the story: [Code 11: Weather for particles](https://www.shashrvacai.com/blog/code-31-weather-for-particles).

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

## Gallery

One picture per folder, click through to the code.

<p>
<a href="2017-11-14_flow_field_with_mic"><img src="2017-11-14_flow_field_with_mic/Screen%20Shot%202019-06-18%20at%2012.49.51%20AM.png" width="150" alt="2017-11-14_flow_field_with_mic" title="2017-11-14_flow_field_with_mic"></a>
<a href="2018-04-23_flowers"><img src="2018-04-23_flowers/Screen%20Shot%202018-04-23%20at%209.24.42%20PM.png" width="150" alt="2018-04-23_flowers" title="2018-04-23_flowers"></a>
<a href="2018-09-30_toxiclibs_attractor_kinect"><img src="2018-09-30_toxiclibs_attractor_kinect/Screen%20Shot%202018-09-30%20at%207.20.09%20PM.png" width="150" alt="2018-09-30_toxiclibs_attractor_kinect" title="2018-09-30_toxiclibs_attractor_kinect"></a>
<a href="2018-09-30_toxiclibs_noise_attractor"><img src="2018-09-30_toxiclibs_noise_attractor/Screen%20Shot%202018-09-30%20at%207.20.09%20PM.png" width="150" alt="2018-09-30_toxiclibs_noise_attractor" title="2018-09-30_toxiclibs_noise_attractor"></a>
<a href="2018-11-16_pixelflow_liquid"><img src="2018-11-16_pixelflow_liquid/Screen%20Shot%202018-11-16%20at%2012.04.00%20AM.png" width="150" alt="2018-11-16_pixelflow_liquid" title="2018-11-16_pixelflow_liquid"></a>
<a href="2019-06-15_type_flow_field"><img src="2019-06-15_type_flow_field/Screen%20Shot%202019-06-15%20at%204.13.37%20PM.png" width="150" alt="2019-06-15_type_flow_field" title="2019-06-15_type_flow_field"></a>
<a href="2019-06-15_type_flow_field_variant"><img src="2019-06-15_type_flow_field_variant/Screen%20Shot%202019-06-15%20at%204.12.11%20PM.png" width="150" alt="2019-06-15_type_flow_field_variant" title="2019-06-15_type_flow_field_variant"></a>
<a href="2019-06-18_cyberia_ff_cohesion"><img src="2019-06-18_cyberia_ff_cohesion/Screen%20Shot%202019-06-18%20at%2012.44.16%20AM.png" width="150" alt="2019-06-18_cyberia_ff_cohesion" title="2019-06-18_cyberia_ff_cohesion"></a>
<a href="2019-06-20_ff_cohesion_kinect"><img src="2019-06-20_ff_cohesion_kinect/Screen%20Shot%202019-06-20%20at%209.16.24%20PM.png" width="150" alt="2019-06-20_ff_cohesion_kinect" title="2019-06-20_ff_cohesion_kinect"></a>
<a href="2019-06_cyberia_ff_attractors_test"><code>2019-06_cyberia_ff_attractors_test</code> (no picture)</a>
<a href="2019-06_cyberia_ff_attractors_test_2_gui_sound"><code>2019-06_cyberia_ff_attractors_test_2_gui_sound</code> (no picture)</a>
<a href="2019-06_cyberia_ff_particles_basic_test"><code>2019-06_cyberia_ff_particles_basic_test</code> (no picture)</a>
<a href="2019-06_cyberia_ref_ff_attractors_test"><code>2019-06_cyberia_ref_ff_attractors_test</code> (no picture)</a>
<a href="2019-06_cyberia_ref_flow_field_2017"><img src="2019-06_cyberia_ref_flow_field_2017/Screen%20Shot%202019-06-18%20at%2012.49.51%20AM.png" width="150" alt="2019-06_cyberia_ref_flow_field_2017" title="2019-06_cyberia_ref_flow_field_2017"></a>
<a href="2019-06_cyberia_wall_ff_cohesion_osc_syphon_sliders"><code>2019-06_cyberia_wall_ff_cohesion_osc_syphon_sliders</code> (no picture)</a>
<a href="2019-06_cyberia_wall_ff_cohesion_show_copy"><code>2019-06_cyberia_wall_ff_cohesion_show_copy</code> (no picture)</a>
<a href="2019_kinect_flow_field_sketch"><code>2019_kinect_flow_field_sketch</code> (no picture)</a>
<a href="2019_spilt_milk_ff_attractor_show_file"><code>2019_spilt_milk_ff_attractor_show_file</code> (no picture)</a>
<a href="undated_ff_particles_basic"><code>undated_ff_particles_basic</code> (no picture)</a>
<a href="undated_ff_particles_kinect"><code>undated_ff_particles_kinect</code> (no picture)</a>
<a href="undated_ff_particles_kinect_depth"><code>undated_ff_particles_kinect_depth</code> (no picture)</a>
<a href="undated_genetic_algorithm_evolve_field"><code>undated_genetic_algorithm_evolve_field</code> (no picture)</a>
<a href="undated_magnetic_flow_field"><code>undated_magnetic_flow_field</code> (no picture)</a>
<a href="undated_p5_flow_field_js"><code>undated_p5_flow_field_js</code> (no picture)</a>
<a href="undated_pixelflow_attractor"><code>undated_pixelflow_attractor</code> (no picture)</a>
<a href="undated_pixelflow_attractor_kinect"><code>undated_pixelflow_attractor_kinect</code> (no picture)</a>
</p>
