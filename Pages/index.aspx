<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GuCalc.Pages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUcalc</title>
    <link href="../Content/jquery.mobile-1.4.2.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/jquery.mobile-1.4.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Start of first page -->
            <div data-role="page" id="home">

                <div data-role="header">
                    <h1>Foo</h1>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <p>I'm first in the source order so I'm shown as the page.</p>
                    <p>View internal page called <a href="#bar">bar</a></p>

                    <a href="#startSession" class="ui-btn ui-btn-a" data-transition="slide">Start Session</a>
                    <a href="#setDefaults" class="ui-btn ui-btn-a" data-transition="slide">Set Defaults</a>

                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->

            <!-- Start of second page -->
            <div data-role="page" id="startSession">

                <div data-role="header">
                    <h1>Session Settings</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back to Start</a></p>
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
                    <p>Planned checkpoints will notify you when to take readings. Like all things planned.... they are just reminders.</p>
                    <label for="plannedChkPts">Planned Boil Time:</label>
                    <select name="plannedChkPts" id="plannedChkPts" >
                        <option value="50">50</option>
                        <option value="45">45</option>
                        <option value="30">30</option>
                        <option value="20">20</option>
                        <option value="15">15</option>
                        <option value="10">10</option>
                        <option value="5">5</option>
                        
                    </select>
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->



            <!-- Start of second page -->
            <div data-role="page" id="setDefaults">

                <div data-role="header">
                    <h1>System Defaults</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back to Start</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="boilRate">Boil Rate (gal/hour):</label>
                    <input type="number" data-clear-btn="true" name="boilRate" id="boilRate" value="" />
                    <label for="defaultBoilTime">Default Boil Time:</label>
                    <input type="number" data-clear-btn="true" name="defaultBoilTime" id="defaultBoilTime" value="" />
                    <label for="defaultPreBoilVolume">Default Pre-Boil Volume:</label>
                    <input type="number" data-clear-btn="true" name="defaultPreBoilVolume" id="defaultPreBoilVolume" value="" />


                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->

            <div data-role="page" id="startBoil">

                <div data-role="header">
                    <h1>Start Boil</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back to Start</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="initialVol">Initial Volume:</label>
                    <input type="number" data-clear-btn="true" name="initialVol" id="initialVol" value="" />
                    <label for="initialGU">Initial GU:</label>
                    <input type="number" data-clear-btn="true" name="initialGU" id="initialGU" value="" />
                   <input type="button" name="btInitialCapture" id="btnInitialCapture" />


                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->
             <div data-role="page" id="additionalReadings">

                <div data-role="header">
                    <h1>Additional Readings</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back to Start</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="currentVol">Current Volume:</label>
                    <input type="number" data-clear-btn="true" name="initialVol" id="currentVol" value="" />
                    <label for="currentGU">Current GU:</label>
                    <input type="number" data-clear-btn="true" name="initialGU" id="currentGU" value="" />
                   <input type="button" name="btnCurrentCapturee" id="btnCurrentCapture" />


                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->
            <div data-role="page" id="currentBrewSession">

                <div data-role="header">
                    <h1>Current Brew Session</h1>
                    <p><a href="#home" data-transition="slide" data-direction="reverse">Back to Start</a></p>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <label for="currentVol">Current Volume:</label>
                    
                     <a href="#additionalReadings" class="ui-btn ui-btn-a" data-transition="slide">Enter Readings</a>
                   
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->
        </div>
    </form>

    <script type="text/javascript">
        
       
        
    </script>

</body>
</html>
