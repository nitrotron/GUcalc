﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GuCalc.Pages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"></html>

<head runat="server">
    <title>GUcalc</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0;" />
    <link href="../Content/jquery.mobile-1.4.2.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/jquery.mobile-1.4.2.min.js"></script>
    <script src="../Scripts/GuCalc.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Start of first page -->
            <div data-role="page" id="home">

                <div data-role="header">
                    <h1>Home</h1>
                    <div id="onlineStatus"></div>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <a href="#startSession" class="ui-btn ui-btn-a" data-transition="slide">Start New Session</a>
                    <a href="#currentBrewSession" class="ui-btn ui-btn-a" data-transition="slide">Continue Current Session</a>
                    <a href="#setDefaults" class="ui-btn ui-btn-a" data-transition="slide">Set Defaults</a>

                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4></h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->

            <!-- Start of second page -->
            <div data-role="page" id="startSession">

                <div data-role="header">
                    <h1>Session Settings</h1>
                    <p><a href="#home" class="ui-btn ui-btn-b" data-transition="slide" data-direction="reverse">Back</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <p>The process will begin with setting the session settings. Then, once boiling begins, you can add data points</p>
                    <label for="plannedBoil">Planned Boil Time:</label>
                    <input type="number" data-clear-btn="true" name="plannedBoil" id="plannedBoil" value="" />
                    <label for="plannedPostBoilVol">Planned Post-Boil Volume:</label>
                    <input type="number" data-clear-btn="true" name="plannedPostBoilVol" id="plannedPostBoilVol" value="" />
                    <label for="plannedPostGU">Planned Post-Boil Gravity Units:</label>
                    <input type="number" data-clear-btn="true" name="plannedPostGU" id="plannedPostGU" value="" />
                    <%--<p>Planned checkpoints will notify you when to take readings. Like all things planned.... they are just reminders.</p>--%>
                    <%--<label for="plannedChkPts">Planned Boil Time:</label>
                    <select name="plannedChkPts" id="plannedChkPts">
                        <option value="50">50</option>
                        <option value="45">45</option>
                        <option value="30">30</option>
                        <option value="20">20</option>
                        <option value="15">15</option>
                        <option value="10">10</option>
                        <option value="5">5</option>
                    </select>--%>
                    <a href="#" class="ui-btn ui-btn-a" data-transition="slide" id="submitSession">Boil Starting!</a>

                </div>
                <!-- /content -->

                <div data-role="footer">
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->



            <!-- Start of second page -->
            <div data-role="page" id="setDefaults">

                <div data-role="header">
                    <h1>System Defaults</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back </a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="boilRate">Boil Rate (gal/hour):</label>
                    <input type="number" data-clear-btn="true" name="boilRate" id="boilRate" value="" />
                    <label for="defaultBoilTime">Default Boil Time:</label>
                    <input type="number" data-clear-btn="true" name="defaultBoilTime" id="defaultBoilTime" value="" />
                    <label for="defaultPreBoilVolume">Default Pre-Boil Volume:</label>
                    <input type="number" data-clear-btn="true" name="defaultPreBoilVolume" id="defaultPreBoilVolume" value="" />
                    <a href="#" data-transition="slide" class="ui-btn ui-btn-a" data-direction="reverse" onclick="saveDefaults()">Save</a>
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4></h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->

            <div data-role="page" id="startBoil">

                <div data-role="header">
                    <h1>Start Boil</h1>
                    <p><a href="#startSession" data-transition="slide" data-direction="reverse">Session Settings</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="initialVol">Initial Volume:</label>
                    <input type="number" data-clear-btn="true" name="initialVol" id="initialVol" value="" />
                    <label for="initialGU">Initial GU:</label>
                    <input type="number" data-clear-btn="true" name="initialGU" id="initialGU" value="" />
                    <input type="button" name="btInitialCapture" id="btnInitialCapture" value="Boil has Started!" />
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4></h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->



            <div data-role="page" id="additionalReadings">

                <div data-role="header">
                    <h1>Additional Readings</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Home</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="currentVol">Current Volume:</label>
                    <input type="number" data-clear-btn="true" name="currentVol" id="currentVol" value="" />
                    <label for="currentGU">Current GU:</label>
                    <input type="number" data-clear-btn="true" name="currentGU" id="currentGU" value="" />
                    <fieldset class="ui-grid-a">
                        <div class="ui-block-a">
                            <input type="button" name="btnCurrentCapturee" id="btnCurrentCapture" value="Submit Readings" />
                        </div>
                        <div class="ui-block-b">
                            <input type="button" name="btnCurrentCapturee" id="btnCurrentCancel" value="Cancel Readings" />
                        </div>
                    </fieldset>

                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4></h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->


            <div data-role="page" id="currentBrewSession">

                <div data-role="header">
                    <h1>Current Brew Session</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Home</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <div class="goalPostGU"></div>
                    <div class="goalPostVol"></div>
                    <div class="goalBoilLength"></div>
                    <br />
                    <ul data-role="listview" class="ui-listview">
                        <li id="readingsTemplate" class="entry" style="display: none">
                            <div class="readingTime">Reading Time</div>
                            <div class="readingGU">Gravity Units</div>
                            <div class="readingVol">Volume</div>
                            <div class="estPostBoilGUV">Est. Post Boil Gravity:</div>
                            <div class="estPostBoilVolV">Est. Post Boil Volume:</div>
                             <div class="estPostBoilGUG">Est. Post Boil Gravity:</div>
                            <div class="estPostBoilVolG">Est. Post Boil Volume:</div>
                            <div class="amountTimeToReachGU">Est. Time To Reach Gravity:</div>
                            <div class="amountTimeToReachGUVol">Est. Time To Reach Volume:</div>
                            <div class="amntOfWaterToAdd">Amount of water to add to get GU for planned boil:</div>
                            <div class="amntofDMEtoADD">Amount of DME to add to get GU for planned boil:</div>
                        </li>
                    </ul>

                    <a href="#additionalReadings" class="ui-btn ui-btn-a" data-transition="slide">Enter Readings</a>

                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4></h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->
        </div>
    </form>

   
</body>
</>
