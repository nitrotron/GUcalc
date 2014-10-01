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
        //debugger;
        var initialVersion = parseInt(db.version) || 0;
        try {
            doMigration(initialVersion + 1);
        } catch (e) {
            if (console.error) console.error(e);
        }
    }
}

function currentSession(id, creationDate, postGU, postVol, boilLength) {

    //id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
    //' creationDate DATE NOT NULL,   ' +
    //' postGU FLOAT NOT NULL, postVol FLOAT NOT NULL, ' +
    //' boilLength FLOAT NOT NULL); '
    this.id = id;
    this.creationDate = creationDate;
    this.postGU = postGU;
    this.postVol = postVol;
    this.boilLength = boilLength;


}
$(document).ready(function () {
    reportOnlineStatus();
    $('#submitSession').click(function () {
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
        t.executeSql(
            'CREATE TABLE IF NOT EXISTS readings ' +
            ' (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, ' +
            ' readingDateTime DATE NOT NULL,   ' +
            ' currentGU FLOAT NOT NULL, currentVol FLOAT NOT NULL, ' +
            ' sessionID INTEGER NOT NULL); '
            );
    });

    //for when I need to make an addition
    //M.migration(3, function (t) {
    //    debugger;
    //    t.executeSql(' alter table sessions ' +
    //        ' ADD boilLength FLOAT '
    //        );
    //});
    //M.migration(4, function (t) {
    //    debugger;
    //    t.executeSql(' alter table sessions ' +
    //        ' DROP COLUMN boilStartDate, name '
    //        );
    //});


    M.doIt();
    if (localStorage.sessionID) // if we have a sessionID established then set update the entries window
        refreshEntries();

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
        function (transaction, results) {
            //refreshEntries();
            //goBack();
            //debugger;
            localStorage.sessionID = results.insertId;
            var myCurrectSession = new currentSession(results.insertId, creationDate, postGU, postVol, boilLength);
            localStorage.setItem('myCurrentSession', JSON.stringify(myCurrectSession));
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
    getLatestSession();
    return false;
}

function insertReadings(readingDateTime, currentGU, currentVol, sessionID) {
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
    //debugger;
    db.transaction(function (transaction) {
        transaction.executeSql(
         'SELECT * FROM sessions order by id desc limit 1',
         [],
         function (transaction, result) {
            // debugger;
             if (result.rows.length > 0) {
                 var readingDateTime = Date.now();
                 var currentGU = $('#currentGU').val();
                 var currentVol = $('#currentVol').val();
                 var sessionID = result.rows.item(0).id;
                 insertReadings(readingDateTime, currentGU, currentVol, sessionID);
                 refreshEntries();
             }

         },
         errorHandler
         );

    });
}

function refreshEntries() {
    var sessionID = localStorage.sessionID;
    $('#currentBrewSession  ul li:gt(0)').remove();
    db.transaction(
        function (transaction) {
            transaction.executeSql(
                'SELECT * FROM readings WHERE sessionID = ? ORDER BY readingDateTime;',
                [sessionID],
                function (transaction, result) {
                    //debugger;
                    for (var i = 0; i < result.rows.length; i++) {
                        var row2 = result.rows.item(i);
                        addReadingToDOM(row2)
                    }
                },
                errorHandler
                );
        })
}

function addReadingToDOM(row2) {
    var newEntryRow = $('#readingsTemplate').clone();
    newEntryRow.removeAttr('id');
    newEntryRow.removeAttr('style');
    newEntryRow.data('entryId', row2.id);
    newEntryRow.appendTo('#currentBrewSession ul');
    var newDate = new Date(row2.readingDateTime);
    newEntryRow.find('.readingTime').text('Reading at: ' + newDate.getHours() + ':' + newDate.getMinutes());
    newEntryRow.find('.readingGU').text('Gravity Reading: ' + row2.currentGU);
    newEntryRow.find('.readingVol').text('Volume Reading: ' + row2.currentVol);

    //lets compute the GU and Vol
    //var boilLeft = 
    //todo show the current evaporation rate, 
    // how much longer to achieve the desired vol
    // how much longer it takes to achive the goal GU
    // then provide a course of action. Add more water, add more boil, add more malt extract,
    debugger;
    var startingPoint = JSON.parse(localStorage.myCurrentSession);


    var boilEnd = new Date(startingPoint.creationDate); 
    boilEnd.setMinutes(boilEnd.getMinutes() + parseFloat(startingPoint.boilLength));
    var boilLeft = (boilEnd.getHours() - newDate.getHours()) * 60 + boilEnd.getMinutes() - newDate.getMinutes();
    var volBoiledOff = row2.currentVol - startingPoint.postVol;
    var alreadyBoiled = alreadyBoiled = (newDate.getHours() - (new Date(startingPoint.creationDate)).getHours()) * 60 + newDate.getMinutes() - (new Date(startingPoint.creationDate)).getMinutes()
    var boilRateP = volBoiledOff / alreadyBoiled / 60.0;
    var totalGU = row2.currentGU * row2.currentVol;
    var goalGU = startingPoint.postVol * startingPoint.postGU;
    var outlookVol = totalGU / startingPoint.postGU;
    
    };


function resultsHandler(transaction, result) {
    debugger;
    returnRow = result;
    alert("Results length" + result.rows.length);
}


function errorHandler(transaction, error) {
    alert('Oops. Error was ' + error.message + ' (Code ' + error.code + ')');
    return true;
}

