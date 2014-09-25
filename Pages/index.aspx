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
                    <div class="ui-grid-c">
                        <div class="ui-block-a">
                            <div class="ui-bar  ui-bar-a">
                                <span id="lblBoilStartTime">Boil Start Time:</span>
                            </div>
                        </div>
                        <div class="ui-block-b">
                            <div class="ui-bar ui-bar-a">
                                <span id="Span1">12:31 AM</span>
                            </div>
                        </div>
                        <div class="ui-block-c">
                            <div class="ui-bar  ui-bar-a">
                                <span id="Span2">Boil Finish Time(Planned):</span>
                            </div>
                        </div>
                        <div class="ui-block-d">
                            <div class="ui-bar  ui-bar-a">
                                <span id="Span3">1:31pm</span>
                            </div>
                        </div>
                    </div>

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

    <script type="text/javascript">
        $("#btnInitialCapture").click(function () {
            goToCurrentBrewSession();
        });

        $("#btnCurrentCapture").click(function () {
            goToCurrentBrewSession();
        });

        $("#btnCurrentCancel").click(function () {
            goToCurrentBrewSession();
        });


        function goToCurrentBrewSession() {
            var url = '#currentBrewSession';
            $.mobile.changePage(url, { transition: "fade" });
        };

        function isOnLine() {
            return navigator.onLine;
        }


        function reportOnlineStatus() {
            var status = $("#onlineStatus");

            if (isOnLine()) {
                status.text("Online");
                status.
                    removeClass("offline").
                    addClass("online");
            }
            else {
                status.text("Offline");
                status.
                    removeClass("online").
                    addClass("offline");
            }
        }
        //window.applicationCache.onupdateready = function (e) {
        //    applicationCache.swapCache();
        //    window.location.reload();
        //}

        window.addEventListener("online", function (e) {
            reportOnlineStatus();
            //saveToServer();
        }, true);

        window.addEventListener("offline", function (e) {
            reportOnlineStatus();
        }, true);

        var db;
        // created by Max Aller <nanodeath@gmail.com>
        function Migrator(db) {
            var migrations = [];
            this.migration = function (number, func) {
                migrations[number] = func;
            };
            var doMigration = function (number) {
                //debugger;
                if (migrations[number]) {
                    db.changeVersion(db.version, String(number), function (t) {
                        migrations[number](t);
                    }, function (err) {
                        if (console.error) console.error("Error!: %o", err);
                    }, function () {
                        doMigration(number + 1);
                    });
                }
            };
            this.doIt = function () {
                debugger;
                var initialVersion = parseInt(db.version) || 0;
                try {
                    doMigration(initialVersion + 1);
                } catch (e) {
                    if (console.error) console.error(e);
                }
            }
        }
        $(document).ready(function () {
            reportOnlineStatus();
            $('#submitSession').click(function () {
                //debugger;
                createSession();
                return false;
            })
            $('#btnCurrentCapture').click(function () {
                recordReading();
                goToCurrentBrewSession();
                return false;
            })
            $(document).on("pagebeforeshow", "#setDefaults", function (event) {
                loadDefaults();
            });


            //debugger;
            var shortName = 'GuCalc';
            var version = '1';
            var displayName = 'GuCalc';
            var maxSize = 65536;

            db = openDatabase(shortName, "", displayName, maxSize);
            var M = new Migrator(db);
            M.migration(1, function (t) {
                //debugger;
                t.executeSql(
                    'CREATE TABLE IF NOT EXISTS sessions ' +
                    ' (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
                    ' creationDate DATE NOT NULL,   ' +
                    ' postGU FLOAT NOT NULL, postVol FLOAT NOT NULL, ' +
                    ' boilLength FLOAT NOT NULL); '
                    //' boilStartDate Date, name TEXT '
                    //' boilLength FLOAT NOT NULL);'
                    );
            });
            M.migration(2, function (t) {
                //debugger;
                t.executeSql(
                    'CREATE TABLE IF NOT EXISTS readings ' +
                    ' (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
                    ' readingDateTime DATE NOT NULL,   ' +
                    ' currentGU FLOAT NOT NULL, currentVol FLOAT NOT NULL, ' +
                    ' sessionID INTEGER NOT NULL); '
                    );
            });
            //M.migration(2, function (t) {
            //    debugger;
            //    t.executeSql(' alter table sessions ' +
            //        ' ADD boilLength FLOAT '
            //        );
            //});
            //M.migration(3, function (t) {
            //    debugger;
            //    t.executeSql(' alter table sessions ' +
            //        ' DROP COLUMN boilStartDate, name '
            //        );
            //});


            M.doIt();

        });

        function goBack() {
            window.history.back()
        }

        //-------- form saving and populating ---------------
        function saveDefaults() {
            localStorage.boilRate = $('#boilRate').val();
            localStorage.defaultBoilTime = $('#defaultBoilTime').val();
            localStorage.defaultPreBoilVolume = $('#defaultPreBoilVolume').val();

            goBack();
            return false;
        }
        function loadDefaults() {
            $('#boilRate').val(localStorage.boilRate);
            $('#defaultBoilTime').val(localStorage.defaultBoilTime);
            $('#defaultPreBoilVolume').val(localStorage.defaultPreBoilVolume);
        }

        function createSession() {
            var creationDate = Date.now();
            var postGU = $('#plannedPostGU').val();
            var postVol = $('#plannedPostBoilVol').val();
            var boilLength = $('#plannedBoil').val();


            db.transaction(
            function (transaction) {
                transaction.executeSql(
                'INSERT INTO sessions (creationDate, postGU, postVol, boilLength) VALUES (?, ?, ?, ?);',
                [creationDate, postGU, postVol, boilLength],
                function () {
                    //refreshEntries();
                    //goBack();
                    var url = '#additionalReadings';
                    $.mobile.changePage(url, { transition: "fade" });
                    return false;
                },
                errorHandler,
                goToCurrentBrewSession
                );
            }
            );
            return false;
        }
        function recordReading() {
            debugger;
            //* Id 
            //* SessionID
            //* volume
            //* Gu reading
            //* Time

            getLatestSession();

            //var readingDateTime = Date.now();
            //var currentGU = $('#currentGU').val();
            //var currentVol = $('#currentVol').val();
            //var row = getLatestSession();
            //debugger;
            //var sessionID = 0;
            //if (row) {
            //    debugger;
            //    sessionID = row.id;
            //}

            //db.transaction(
            //function (transaction) {
            //    transaction.executeSql(
            //    'INSERT INTO readings (readingDateTime, currentGU, currentVol, sessionID) VALUES (?, ?, ?, ?);',
            //    [readingDateTime, currentGU, currentVol, sessionID],
            //    function () {
            //        //refreshEntries();
            //        //goBack();
            //        goToCurrentBrewSession();
            //        return false;
            //    },
            //    errorHandler,
            //    goToCurrentBrewSession
            //    );
            //}
            //);
            return false;
        }

        function insertReadings(readingDateTime, readingDateTime, currentGU, currentVol, sessionID) {
            db.transaction(
function (transaction) {
    transaction.executeSql(
    'INSERT INTO readings (readingDateTime, currentGU, currentVol, sessionID) VALUES (?, ?, ?, ?);',
    [readingDateTime, currentGU, currentVol, sessionID],
    function () {
        //refreshEntries();
        //goBack();
        goToCurrentBrewSession();
        return false;
    },
      errorHandler,
    goToCurrentBrewSession
    );
}
);
        }

        function getLatestSession() {
            var returnRow;
            debugger;
            db.transaction(function (transaction) {
                transaction.executeSql(
                 'SELECT * FROM sessions order by id desc limit 1',
                 [],
                 function (transaction, result) {
                     debugger;
                     if (result.rows.length > 0) {
                         var readingDateTime = Date.now();
                         var currentGU = $('#currentGU').val();
                         var currentVol = $('#currentVol').val();
                         var sessionID = result.rows.item(0).id;
                         insertReadings(readingDateTime, readingDateTime, currentGU, currentVol, sessionID);
                     }
                 },
                 errorHandler
                 );

            });
        }


        function resultsHandler(transaction, result) {
            debugger;
            //if (result.rows.length > 0)
            //    returnRow = result.rows.item(0);
            returnRow = result;
            alert("Results length" + result.rows.length);
            //for (var i = 0; i < result.rows.length; i++) {
            //    returnRow = result.rows.item(i);
            //var newEntryRow = $('#entryTemplate').clone();
            //newEntryRow.removeAttr('id');
            //newEntryRow.removeAttr('style');
            //newEntryRow.data('entryId', row.id);
            //newEntryRow.appendTo('#date ul');
            //newEntryRow.find('.label').text(row.food);
            //newEntryRow.find('.calories').text(row.calories);
            //}
        }


        function errorHandler(transaction, error) {
            alert('Oops. Error was ' + error.message + ' (Code ' + error.code + ')');
            return true;
        }


    </script>

</body>
</>
