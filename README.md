# FinalProject2
<h1>Europe Borders</h1>

<h4>Xavier Chen<br>Naotaka Kinoshita</h4>

<p>
This project shows the change of Europe's borders over time. Through scaling, rotation, and translation, maps are adjusted in a way that they are uniform to each other which allows for fluid transitions.
</p>

<h3> How to use the project</h3>
<p>
The project consists of two phases. Phase 1 is for taking different maps that may have different sizes/orientations and fitting them to a standard, so that phase 2 can run smoothly. Phase 2 is a viewer for the maps, which will be accomplished by using a slider from ControlP5.
</p>

<h5> Using Phase 1 <h5>
<p>
In order to 'fix' the maps, the user must select two pairs of corresponding points so that the maps can be properly fixed. The points should be in geographically corresponding locations, for example, one of the points on the left hand map (the base map) could be on Gibraltar, and the corresponding point on the right hand map (the map to be fixed) would also be on Gibraltar. 
</p>

<p>
To start, enter the filename of the map that needs to be fixed (ex: "1810.png"). Note that the text entry can on occasion not work correctly. If this is the case, stop the program and run it again until it works. Once you have entered the filename, press ENTER and then SHIFT to load the maps. You will see a map on the left (the base map) and a map on the right (the map to be fixed). Once the maps are loaded, you can begin to select the points. Start by selecting one point on the left map by clicking. Then press RIGHT ARROW to advance to the next point, which will be the corresponding point to the first point, but on the right map. After this, you will repeat the same process by starting with the left map and then going on to the righ tmap. After selecting all the points, press ENTER to fix the map. You will see the right map translated, rotated, and scaled over the base map. Press S to save the map, which will save the map into the FinishedMaps folder. You can repeat the fixing process for any other remaining maps.
</p>

<h5> Using Phase 2 </h5>
<p>
To use Phase 2, simply run the program and use the slider at the top left to view different maps of Europe.
</p>

<h3> Timeline </h3>
  <ul>
    <li> 5/31/17 - Added Maps to start out the project. Also preliminary work done on DataFix. </li>
    <li> 6/1/17 - Created Point class, almost finished with it </li>
    <li> 6/2/17 - Worked on Point class. Also worked on DataFix. </li>
    <li> 6/4/17 - Worked on fixer method which fixes the maps by translation, rotation, and scaling </li>
    <li> 6/5/17 - Finished all methods for Point Class. Can select the Points now too </li>
    <li> 6/7/17 - Scaling works properly, but translating still needs some fixing</li>
    <li> 6/8/17 - Started work on Phase 2, implemented a rough method of viewing maps by entering year manually</li>
    <li> 6/10/17 - Translating is completely done</li>
    <li> 6/11/17 - Finished Phase 2 by implementing slider from controlp5</li>
  </ul>


<h3>Bugs</h3>
  <ul>
    <li>Rotate still needs to be implemented</li>
    <li>need to add ways to give user confirmation that an action happened</li>
    <li>stop user from selecting too many points</li>
  </ul>

